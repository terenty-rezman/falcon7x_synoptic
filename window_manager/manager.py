import enum
from copy import deepcopy

from PySide6.QtGui import QGuiApplication, QCursor, QScreen
from PySide6.QtCore import QObject, Slot, Property, Signal, QPoint, QRect
import PySide6.QtCore as QtCore

from window_manager.tiles import ScreenPosition, WindowTile, current_screen_tiles, ScreenTiles
import backend
import view_helper
import window_manager.click_manager

import settings as s


screen_serials = {
    ScreenPosition.MDU_UP: s.MDU_UP_SERIAL,
    ScreenPosition.MDU_DOWN: s.MDU_DOWN_SERIAL,
    ScreenPosition.PDU_LEFT: s.PDU_LEFT_SERIAL,
    ScreenPosition.PDU_RIGHT: s.PDU_RIGHT_SERIAL,
}

screen_id_screen_obj = {}


def update_screen_sizes():
    global screen_id_screen_obj

    all_screens = QGuiApplication.screens()

    print()
    for i, s in enumerate(all_screens):
        print(f"screen {i}", s.serialNumber())
        screen_id_screen_obj[s.serialNumber()] = s


tile_watchers = []


def add_to_watchers(cls):
    global tile_watchers
    tile_watchers.append(cls)
    return cls


class Watcher():
    prev_screen_tiles = {}

    @classmethod
    def update(cls):
        if cls.prev_screen_tiles != current_screen_tiles:
            for (screen_type, state_new), (_, state_old) in zip(current_screen_tiles.items(), cls.prev_screen_tiles.items()):
                if state_new != state_old:
                    for w in tile_watchers:
                        if w.screen_type == screen_type:
                            w.compare_tiles_state(state_new)

            # on the first run
            if cls.prev_screen_tiles == {}:
                for w in tile_watchers:
                    w.compare_tiles_state(current_screen_tiles[w.screen_type])

            cls.prev_screen_tiles = deepcopy(current_screen_tiles)


class TilesWatcherBase():
    watch_tile_type = None
    screen_type = None

    qml_component_path = None
    view_name = None
    view_title = None

    prev_state = [[], []]
    view = None

    @classmethod
    def compare_tiles_state(cls, new_tiles: ScreenTiles):
        cleared_tiles = new_tiles.remove_all_tiles_beside(cls.watch_tile_type)

        if cleared_tiles == cls.prev_state:
            return
        else:
            # rebuild window
            cls.update_window_pos(new_tiles)
            cls.prev_state = cleared_tiles

    @classmethod
    def update_window_pos(cls, new_tiles):
        global screen_serials
        global screen_id_screen_obj

        screen_serial = screen_serials[cls.screen_type]

        screen_geometry = screen_id_screen_obj[screen_serial].availableGeometry()
        screen_width = screen_geometry.width()
        screen_height = screen_geometry.height()

        screen_x = screen_geometry.topLeft().x()
        screen_y = screen_geometry.topLeft().y()

        if cls.view is None:
            cls.view = cls.create_view(0, 0, 0, 0)
            if cls.screen_type == ScreenPosition.MDU_DOWN:
                cls.view.is_down_mdu = True

        if cls.is_visible(new_tiles):
            window_pos_x, window_pos_y, window_width, window_height = cls.calc_window_geometry(screen_x, screen_y, screen_width, screen_height, new_tiles)
            cls.view.setGeometry(window_pos_x, window_pos_y, window_width, window_height) 
            cls.view.current_window_tile = str(cls.watch_tile_type)
            cls.view.show()
            cls.view.screen_width = cls.view.screen().availableGeometry().width()
            cls.view.screen_height = cls.view.screen().availableGeometry().height()
            pass
        else:
            cls.view.hide()

    @classmethod
    def create_view(cls, x, y, w, h):
        view = view_helper.create_toplevel_qml_view(
            cls.qml_component_path, cls.view_name, cls.view_title,
            w, h, backend.backend, window_manager.click_manager.get_click_manager(tile_watchers, Watcher)
        )
        view_helper.all_views.append(view)
        return view

    @classmethod
    def is_visible(cls, new_tiles):
        pass

    @classmethod 
    def calc_window_geometry(cls, screen_x, screen_y, screen_width, screen_height, new_tiles):
        pass


import window_manager.synoptic_watchers
import window_manager.pdu_watchers
import window_manager.inav_watchers
import window_manager.avionics_watchers
import window_manager.wptlist_watchers
import window_manager.flight_mgmt_watchers

