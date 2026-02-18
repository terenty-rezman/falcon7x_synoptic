from copy import deepcopy

from PySide6.QtGui import QGuiApplication, QCursor, QScreen, Qt
from PySide6.QtCore import QObject, Slot, Property, Signal, QPoint, QRect, QUrl
from PySide6.QtQuick import QQuickView, QQuickItem

from window_manager.tiles import WindowTile, current_screen_tiles, default_screen_tiles, ScreenPosition
from window_manager.manager import screen_id_screen_obj, screen_serials

from view import View
import window_manager.click_manager
from window_manager.manager import Watcher, tile_watchers
import backend
import view_helper


class AviaMenuManager(QObject):
    screen_quadrant_changed = Signal()

    current_window_tile_changed = Signal()

    @Property(str, notify=current_window_tile_changed)
    def current_window_tile(self):
        return self.current_tile

    @current_window_tile.setter
    def current_window_tile(self, value: str):
        if value != self.current_tile:
            self.current_tile = value
            self.current_window_tile_changed.emit()

    @Property(str, notify=screen_quadrant_changed)
    def screen_quadrant(self):
        return self.screen_quadrant_

    @screen_quadrant.setter
    def screen_quadrant(self, value: str):
        if value != self.screen_quadrant_:
            self.screen_quadrant_ = value
            self.screen_quadrant_changed.emit()

    is_down_mdu_changed = Signal()

    @Property(bool, notify=is_down_mdu_changed)
    def is_down_mdu(self):
        return self.is_on_down_mdu

    @is_down_mdu.setter
    def is_down_mdu(self, value: bool):
        if value != self.is_on_down_mdu:
            self.is_on_down_mdu = value
            self.is_down_mdu_changed.emit()

    def __init__(self):
        self.view = None
        super().__init__()

        self.menu_width = 135
        self.menu_height = 225
        self.is_on_down_mdu = False
        self.screen_quadrant_ = "left"
        self.current_tile = ""

    @Slot(result=None)
    def close_menu(self):
        self.view.hide()

    def invoke_menu(self, global_mouse_pos):
        if self.view is None:
            app_qml_url = QUrl("components/TopLevelAviaMenu.qml")
            view = View("avia_menu", self.menu_width, self.menu_height)
            view.engine().addImportPath("./Falcon7x_synoptic_design")
            view.rootContext().setContextProperty("view", view)
            view.rootContext().setContextProperty("backend", backend.backend)
            view.rootContext().setContextProperty("window_manager", window_manager.click_manager.get_click_manager(tile_watchers, Watcher))
            view.rootContext().setContextProperty("menu_manager", self)
            view.setSource(app_qml_url)
            view.setTitle("avia menu - falcon7x")
            view.setResizeMode(QQuickView.SizeRootObjectToView)
            view.setFlags(view.flags() | Qt.FramelessWindowHint)
            self.view = view
        else:
            if self.view.isVisible():
                self.view.hide()
                return

        mdu_down = screen_id_screen_obj[screen_serials[ScreenPosition.MDU_DOWN]]
        mdu_up = screen_id_screen_obj[screen_serials[ScreenPosition.MDU_UP]]

        screens = {ScreenPosition.MDU_DOWN: mdu_down, ScreenPosition.MDU_UP: mdu_up}

        for screen_type, s in screens.items():
            screen_rect = s.availableGeometry()
            if screen_rect.contains(global_mouse_pos):
                quadrant, i, j = self.get_quadrant_rect(global_mouse_pos, screen_rect)
                if quadrant is None:
                    return

                q = None 
                if i == 0:
                    q = "top"
                else:
                    q = "bottom"
                
                if j == 0:
                    q += "left"
                else:
                    q += "right"
                
                self.screen_quadrant = q
                
                if screen_type == ScreenPosition.MDU_DOWN:
                    self.is_down_mdu = True
                else:
                    self.is_down_mdu = False

                if j == 0:
                    self.menu_height = 45 * 5
                else:
                    self.menu_height = 45 * 3
                
                if j == 1 and i == 1 and self.is_down_mdu:
                    self.menu_height += 45

                self.current_window_tile = str(current_screen_tiles[screen_type][i][j])
                if j == 1 and self.current_window_tile == "INAV":
                    self.current_window_tile = "FULL INAV"

                window_pos_x = quadrant.right() - self.menu_width
                window_pos_y = quadrant.top()
                window_width = self.menu_width
                window_height = self.menu_height
                self.view.setGeometry(window_pos_x, window_pos_y, window_width, window_height) 
                self.view.show()
                self.view.requestActivate()

    @staticmethod
    def get_quadrant_rect(global_mouse_pos, screen_rect): 
        sl = screen_rect.left()
        st = screen_rect.top()
        sw = screen_rect.width()
        sh = screen_rect.height()

        top_left =  QRect(sl, st, sw * 2/3, sh * 1/2)
        if top_left.contains(global_mouse_pos):
            return top_left, 0, 0

        top_right = QRect(sl + sw * 2/3, st, sw * 1/3, sh * 1/2)
        if top_right.contains(global_mouse_pos):
            return top_right, 0, 1

        bottom_left = QRect(sl, st + sh * 1/2, sw * 2/3, sh * 1/2)
        if bottom_left.contains(global_mouse_pos):
            return bottom_left, 1, 0

        bottom_right = QRect(sl + sw * 2/3, st + sh * 1/2, sw * 1/3, sh * 1/2)
        if bottom_right.contains(global_mouse_pos):
            return bottom_right, 1, 1

        return None


top_level_avia_menu_manager = AviaMenuManager()
