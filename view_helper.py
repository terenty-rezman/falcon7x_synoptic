from typing import Optional

from PySide6.QtQuick import QQuickView, QQuickItem


all_views: list[QQuickView] = []


def find_object(obj_name: str) -> Optional[QQuickItem]:
    objs = []

    for v in all_views:
        found = v.rootObject().findChildren(QQuickItem, obj_name)
        if found:
            objs += found
    
    return objs

