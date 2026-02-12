from typing import Optional
from functools import lru_cache

from PySide6.QtCore import Qt, QPoint, QSettings, QRect
from PySide6.QtQuick import QQuickView, QQuickItem
from PySide6.QtCore import QUrl, QObject, Slot, Property, SLOT, SIGNAL, QByteArray, QTimer

from view import View


all_views: list[View] = []


def create_toplevel_qml_view(app_qml_url: str, view_name: str, window_title: str, width: int, height: int, backend, window_manager=None):
    app_qml_url = QUrl(app_qml_url)
    view = View(view_name, width, height)
    view.engine().addImportPath("./Falcon7x_synoptic_design")
    view.rootContext().setContextProperty("backend", backend)
    view.rootContext().setContextProperty("view", view)
    if window_manager:
        view.rootContext().setContextProperty("window_manager", window_manager)
    view.setSource(app_qml_url)
    view.setTitle(window_title)
    view.setResizeMode(QQuickView.SizeRootObjectToView)
    view.engine().quit.connect(quit)
    view.readSettings()
    # view.setFlags(view.flags() | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint)
    view.setFlags(view.flags() | Qt.FramelessWindowHint)
    return view


@lru_cache(maxsize=None)
def find_object(obj_name: str, root_obj_name=None) -> Optional[QQuickItem]:
    objs = []

    for v in all_views:
        if root_obj_name:
            if v.rootObject().property("objectName") != root_obj_name:
                continue

        found = v.rootObject().findChildren(QQuickItem, obj_name)
        if found:
            objs += found
    
    return objs

