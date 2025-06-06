import sys
import asyncio
import traceback

from PySide6.QtQuick import QQuickView, QQuickItem
from PySide6.QtGui import QGuiApplication
from PySide6.QtCore import QUrl, QObject, Slot, Property, SLOT, SIGNAL, QByteArray, QTimer
from PySide6.QtNetwork import QUdpSocket, QHostAddress
from PySide6.QtQml import QQmlContext
from PySide6.QtCore import Qt, QPoint, QSettings, QRect

from qasync import QEventLoop, QApplication

import backend
import web_interface
import view_helper
from view import View

import falcon7x_core.xplane.master as xp
from falcon7x_core.xplane.params import Params

import params_to_subscribe
import black_screen

import settings as s


def on_new_xp_data(type, dataref, value):
    backend.backend.set_data_http({"data": {Params[dataref]: value}})
    black_screen.set_data_http({"data": {Params[dataref]: value}}, synoptic)


def on_data_exception(ex: Exception):
    print(traceback.format_exc())


def on_new_xp_data_udp(received_vals):
    backend.backend.set_data_http({"data": received_vals})
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


async def main():
    try:
        web_interface.run_server_task("0.0.0.0", s.WEB_INTERFACE_PORT)

        await xp.xp_master_udp.connect(
            s.XP_MASTER_HOST, s.XP_MASTER_UDP_PORT, on_new_xp_data_udp, on_data_exception_udp, listen_port=s.UDP_LOCAL_PORT
        )
        await xp.xp_master.connect_until_success(s.XP_MASTER_HOST, s.XP_MASTER_PORT, on_new_xp_data, on_data_exception)

        # replace suscribe values
        xp.set_subscribe_params(params_to_subscribe.to_subscribe)
        xp.param_subscriber.run_subsriber_task()
        xp.udp_param_subscriber.run_subsriber_task()

        await app_close_event.wait()
        # asyncio.create_task(test_qml())
    except asyncio.exceptions.CancelledError:
        pass


def quit():
    main_future.cancel()
    app.quit()


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    app_qml_url = QUrl("components/app.qml")
    synoptic = View(s.WINDOW_WIDTH, s.WINDOW_HEIGHT * 2)
    synoptic.engine().addImportPath("./Falcon7x_synoptic_design")
    synoptic.rootContext().setContextProperty("backend", backend.backend)
    synoptic.setSource(app_qml_url)
    synoptic.setTitle("synoptic - falcon7x")
    synoptic.setResizeMode(QQuickView.SizeRootObjectToView)
    synoptic.engine().quit.connect(quit)
    synoptic.readSettings()
    synoptic.setFlags(synoptic.flags() | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint)
    synoptic.show()
    view_helper.all_views.append(synoptic)

    black_screen.create_black_screens()

    event_loop = QEventLoop(app)
    asyncio.set_event_loop(event_loop)

    app_close_event = asyncio.Event()
    app.aboutToQuit.connect(app_close_event.set)
    
    with event_loop:
        main_future = asyncio.Task(main())
        event_loop.run_until_complete(main_future)
