import sys
import asyncio

from PySide6.QtQuick import QQuickView, QQuickItem
from PySide6.QtGui import QGuiApplication
from PySide6.QtCore import QUrl, QObject, Slot, Property, SLOT, SIGNAL, QByteArray, QTimer
from PySide6.QtNetwork import QUdpSocket, QHostAddress
from PySide6.QtQml import QQmlContext

from qasync import QEventLoop, QApplication

import backend
import web_interface
import view_helper


WEB_INTERFACE_PORT = 8800


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


async def main():
    web_interface.run_server_task("127.0.0.1", WEB_INTERFACE_PORT)
    await app_close_event.wait()


with event_loop:
    event_loop.run_until_complete(main())
