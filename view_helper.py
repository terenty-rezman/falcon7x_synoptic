from typing import Optional

from PySide6.QtQuick import QQuickView, QQuickItem


all_views: list[QQuickView] = []


def find_object(obj_name: str) -> Optional[QQuickItem]:
    obj = None

    for v in all_views:
        obj = v.rootObject().findChild(QQuickItem, obj_name)
        if obj:
            break
    
    return obj

