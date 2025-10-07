from typing import Optional
from functools import lru_cache

from PySide6.QtQuick import QQuickView, QQuickItem


all_views: list[QQuickView] = []


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

