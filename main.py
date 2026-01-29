import sys
import asyncio
import traceback

from PySide6.QtQuick import QQuickView, QQuickItem
from PySide6.QtGui import QGuiApplication, QCursor
from PySide6.QtCore import QUrl, QObject, Slot, Property, SLOT, SIGNAL, QByteArray, QTimer
from PySide6.QtNetwork import QUdpSocket, QHostAddress
from PySide6.QtQml import QQmlContext
from PySide6.QtCore import Qt, QPoint, QSettings, QRect

from qasync import QEventLoop, QApplication

import backend
import web_interface
import view_helper
from view import View
import param_overrides

import falcon7x_core.xplane.master as xp
from falcon7x_core.xplane.params import Params
import falcon7x_core.common.sane_tasks as sane_tasks

import params_to_subscribe
import screen_control
import cas

import settings as s


def on_new_xp_data(type, dataref, value):
    data = {"data": {Params[dataref]: value}}

    backend.backend.set_data_http(data)
    screen_control.set_data_http_tcp(data, mdu_down)
    cas.set_regime_xp_data(data)


def on_data_exception(ex: Exception):
    print(traceback.format_exc())


def on_new_xp_data_udp(received_vals):
    backend.backend.set_data_http({"data": received_vals})
    # screen_control.set_data_http_udp({"data": received_vals})
    pass


def on_data_exception_udp(ex):
    print(traceback.format_exc())


val = 0
async def test_qml():
    global val
    speed = 0.1

    while True:
        if val < 0:
            speed = 0.05 
        elif val > 1:
            speed = -0.05

        val += speed
        
        fake = {
            Params["sim/cockpit2/engine/indicators/N1_percent[0]"]: val*90,
            Params["sim/cockpit2/engine/indicators/N1_percent[1]"]: val*90,
            Params["sim/cockpit2/engine/indicators/N1_percent[2]"]: val*90,
            Params["sim/cockpit2/engine/actuators/throttle_ratio[0]"]: val,
            Params["sim/cockpit2/engine/actuators/throttle_ratio[1]"]: val,
            Params["sim/cockpit2/engine/actuators/throttle_ratio[2]"]: val
        }

        backend.backend.set_data_http(fake)
        await asyncio.sleep(0.016)


async def blue_border_mouse_update():
    while True:
        global_pos = QCursor.pos()  
        backend.backend.updateMousePos.emit(global_pos.x(), global_pos.y(), 0, 0)
        await asyncio.sleep(0.2)


async def main():
    try:
        sane_tasks.spawn(blue_border_mouse_update())    

        web_interface.run_server_task("0.0.0.0", s.WEB_INTERFACE_PORT)

        # replace suscribe values
        xp.set_subscribe_params(params_to_subscribe.to_subscribe)

        await xp.xp_master_udp.connect(
            s.XP_MASTER_HOST, s.XP_MASTER_UDP_PORT, on_new_xp_data_udp, on_data_exception_udp, listen_port=s.UDP_LOCAL_PORT
        )
        await xp.xp_master.connect_until_success(s.XP_MASTER_HOST, s.XP_MASTER_PORT, on_new_xp_data, on_data_exception)

        xp.param_subscriber.run_subsriber_task()
        xp.udp_param_subscriber.run_subsriber_task()

        sane_tasks.spawn(param_overrides.param_overrides_auto_disable_task())    

        await app_close_event.wait()
        # asyncio.create_task(test_qml())
    except asyncio.exceptions.CancelledError:
        pass


def quit():
    main_future.cancel()
    screen_control.restore_brightness()
    app.quit()


def create_toplevel_qml_view(app_qml_url: str, view_name: str, window_title: str, width: int, height: int):
    app_qml_url = QUrl(app_qml_url)
    view = View(view_name, width, height)
    view.engine().addImportPath("./Falcon7x_synoptic_design")
    view.rootContext().setContextProperty("backend", backend.backend)
    view.setSource(app_qml_url)
    view.setTitle(window_title)
    view.setResizeMode(QQuickView.SizeRootObjectToView)
    view.engine().quit.connect(quit)
    view.readSettings()
    # view.setFlags(view.flags() | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint)
    view.setFlags(view.flags() | Qt.FramelessWindowHint)
    return view


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    mdu_down = create_toplevel_qml_view(
        "components/mdu_down.qml", "mdu_down", "mdu - falcon7x",
        s.SYNOPTIC_WINDOW_WIDTH, s.PDU_WINDOW_HEIGHT
    )
    mdu_down.show()
    view_helper.all_views.append(mdu_down)

    mdu_up = create_toplevel_qml_view(
        "components/mdu_up.qml", "mdu up", "mdu - falcon7x",
        s.PDU_WINDOW_WIDTH, s.PDU_WINDOW_HEIGHT
    )
    mdu_up.show()
    view_helper.all_views.append(mdu_up)

    pdu_left = create_toplevel_qml_view(
        "components/pdu_left.qml", "pdu_left", "pdu left - falcon7x", 
        s.PDU_WINDOW_WIDTH, s.PDU_WINDOW_HEIGHT
    )
    pdu_left.show()
    view_helper.all_views.append(pdu_left)

    pdu_right = create_toplevel_qml_view(
        "components/pdu_right.qml", "pdu_right", "pdu right - falcon7x", 
        s.PDU_WINDOW_WIDTH, s.PDU_WINDOW_HEIGHT
    )
    pdu_right.show()
    view_helper.all_views.append(pdu_right)

    cas.create_cas_windows()

    screen_control.create_black_screens()

    event_loop = QEventLoop(app)
    asyncio.set_event_loop(event_loop)

    app_close_event = asyncio.Event()
    app.aboutToQuit.connect(app_close_event.set)
    
    with event_loop:
        main_future = asyncio.Task(main())
        event_loop.run_until_complete(main_future)
