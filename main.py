import sys
import asyncio
import traceback

from PySide6.QtQuick import QQuickView, QQuickItem
from PySide6.QtGui import QGuiApplication
from PySide6.QtCore import QUrl, QObject, Slot, Property, SLOT, SIGNAL, QByteArray, QTimer
from PySide6.QtNetwork import QUdpSocket, QHostAddress
from PySide6.QtQml import QQmlContext

from qasync import QEventLoop, QApplication

import backend
import web_interface
import view_helper

import falcon7x_core.xplane.master as xp

import params_to_subscribe


WEB_INTERFACE_PORT = 8800

# connect to master xplane plugin
XP_MASTER_HOST = "127.0.0.1"
XP_MASTER_PORT = 51000

# native xplane udp port to send to
XP_MASTER_UDP_PORT = 49000


def on_new_xp_data(type, dataref, value):
    print(f"{dataref} value")


def on_data_exception(ex: Exception):
    print(traceback.format_exc())


def on_new_xp_data_udp(received_vals):
    backend.backend.set_data_http(received_vals)


def on_data_exception_udp(ex):
    print(traceback.format_exc())


async def main():
    web_interface.run_server_task("127.0.0.1", WEB_INTERFACE_PORT)

    await xp.xp_master_udp.connect(XP_MASTER_HOST, XP_MASTER_UDP_PORT, on_new_xp_data_udp, on_data_exception_udp)
    await xp.xp_master.connect_until_success(XP_MASTER_HOST, XP_MASTER_PORT, on_new_xp_data, on_data_exception)

    xp.param_subscriber.run_subsriber_task()
    xp.udp_param_subscriber.run_subsriber_task()

    await app_close_event.wait()


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    url = QUrl("components/synoptic.qml")
    synoptic = QQuickView()
    synoptic.rootContext().setContextProperty("backend", backend.backend)
    synoptic.setSource(url)
    synoptic.setTitle("synoptic - falcon7x")
    synoptic.setWidth(670)
    synoptic.setHeight(349)
    synoptic.setMaximumWidth(670)
    synoptic.setMaximumHeight(349)
    synoptic.show()

    view_helper.all_views.append(synoptic)

    event_loop = QEventLoop(app)
    asyncio.set_event_loop(event_loop)

    app_close_event = asyncio.Event()
    app.aboutToQuit.connect(app_close_event.set)

    with event_loop:
        event_loop.run_until_complete(main())
