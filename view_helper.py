from typing import Optional

from PySide6.QtQuick import QQuickView, QQuickItem


all_views: list[QQuickView] = []


def find_object(obj_name: str) -> Optional[QQuickItem]:
    objs = None

    for v in all_views:
        objs = v.rootObject().findChildren(QQuickItem, obj_name)
        if objs:
            break
    
    return objs

