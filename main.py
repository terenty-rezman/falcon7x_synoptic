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
import param_overrides

import falcon7x_core.xplane.master as xp
from falcon7x_core.xplane.params import Params
import falcon7x_core.common.sane_tasks as sane_tasks

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

        sane_tasks.spawn(param_overrides.param_overrides_auto_disable_task())    

        await app_close_event.wait()
        # asyncio.create_task(test_qml())
    except asyncio.exceptions.CancelledError:
        pass


def quit():
    main_future.cancel()
    app.quit()


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    app_qml_url = QUrl("components/synoptic_app.qml")
    synoptic = View("synoptic", s.SYNOPTIC_WINDOW_WIDTH, s.SYNOPTIC_WINDOW_HEIGHT * 2)
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

    app_qml_url = QUrl("components/synoptic_single.qml")
    single_synoptic = View("synoptic_single", s.SYNOPTIC_WINDOW_WIDTH, s.SYNOPTIC_WINDOW_HEIGHT)
    single_synoptic.engine().addImportPath("./Falcon7x_synoptic_design")
    single_synoptic.rootContext().setContextProperty("backend", backend.backend)
    single_synoptic.setSource(app_qml_url)
    single_synoptic.setTitle("synoptic - falcon7x")
    single_synoptic.setResizeMode(QQuickView.SizeRootObjectToView)
    single_synoptic.engine().quit.connect(quit)
    single_synoptic.readSettings()
    single_synoptic.setFlags(synoptic.flags() | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint)
    single_synoptic.show()
    view_helper.all_views.append(single_synoptic)

    app_qml_url = QUrl("components/under_cas_app.qml")
    under_cas_1 = View("under_cas_1", s.UNDER_CAS_WINDOW_WIDTH, s.UNDER_CAS_WINDOW_HEIGHT)
    under_cas_1.engine().addImportPath("./Falcon7x_synoptic_design")
    under_cas_1.rootContext().setContextProperty("backend", backend.backend)
    under_cas_1.setSource(app_qml_url)
    under_cas_1.setTitle("synoptic - falcon7x")
    under_cas_1.setResizeMode(QQuickView.SizeRootObjectToView)
    under_cas_1.engine().quit.connect(quit)
    under_cas_1.readSettings()
    under_cas_1.setFlags(synoptic.flags() | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint)
    under_cas_1.show()
    view_helper.all_views.append(under_cas_1)

    app_qml_url = QUrl("components/under_cas_app.qml")
    under_cas_2 = View("under_cas_2", s.UNDER_CAS_WINDOW_WIDTH, s.UNDER_CAS_WINDOW_HEIGHT)
    under_cas_2.engine().addImportPath("./Falcon7x_synoptic_design")
    under_cas_2.rootContext().setContextProperty("backend", backend.backend)
    under_cas_2.setSource(app_qml_url)
    under_cas_2.setTitle("under cas - falcon7x")
    under_cas_2.setResizeMode(QQuickView.SizeRootObjectToView)
    under_cas_2.engine().quit.connect(quit)
    under_cas_2.readSettings()
    under_cas_2.setFlags(synoptic.flags() | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint)
    under_cas_2.show()
    view_helper.all_views.append(under_cas_2)

    app_qml_url = QUrl("components/adi.qml")
    adi = View("adi", s.ADI_WINDOW_WIDTH, s.ADI_WINDOW_HEIGHT)
    adi.engine().addImportPath("./Falcon7x_synoptic_design")
    adi.rootContext().setContextProperty("backend", backend.backend)
    adi.setSource(app_qml_url)
    adi.setTitle("adi - falcon7x")
    adi.setResizeMode(QQuickView.SizeRootObjectToView)
    adi.engine().quit.connect(quit)
    adi.readSettings()
    adi.setFlags(synoptic.flags() | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint)
    adi.show()
    view_helper.all_views.append(adi)

    black_screen.create_black_screens()

    event_loop = QEventLoop(app)
    asyncio.set_event_loop(event_loop)

    app_close_event = asyncio.Event()
    app.aboutToQuit.connect(app_close_event.set)
    
    with event_loop:
        main_future = asyncio.Task(main())
        event_loop.run_until_complete(main_future)
