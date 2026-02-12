from copy import deepcopy

import view_helper
import backend
from window_manager.tiles import ScreenTiles, WindowTile, ScreenPosition, current_screen_tiles

from window_manager.manager import add_to_watchers, TilesWatcherBase


@add_to_watchers
class AVIONICS_DOWN_1_TilesWatcher(TilesWatcherBase):
    watch_tile_type = WindowTile.AVIONICS
    screen_type = ScreenPosition.MDU_DOWN

    qml_component_path = "components/Avionics_window.qml"
    view_name = "avionics_down_1"
    view_title = "AVIONICS down 1 - falcon7x"

    view = None
    prev_state = [[], []]

    @classmethod
    def is_visible(cls, new_tiles):
        return new_tiles[0][0] == cls.watch_tile_type

    @classmethod 
    def calc_window_geometry(cls, screen_x, screen_y, screen_width, screen_height, new_tiles):
        x = screen_x
        y = screen_y
        w = screen_width * 2 / 3
        h = screen_height * 1 / 2

        cls.view.vertical_position = "top"
        cls.view.horizontal_position = "left"

        return x, y, w, h


@add_to_watchers
class AVIONICS_DOWN_2_TilesWatcher(AVIONICS_DOWN_1_TilesWatcher):
    view_name = "avionics_down_2"
    view_title = "AVIONICS down 2 - falcon7x"

    view = None
    prev_state = [[], []]

    @classmethod
    def is_visible(cls, new_tiles):
        return new_tiles[1][0] == cls.watch_tile_type

    @classmethod 
    def calc_window_geometry(cls, screen_x, screen_y, screen_width, screen_height, new_tiles):
        x = screen_x
        y = screen_y + screen_height * 1 / 2
        w = screen_width * 2 / 3
        h = screen_height * 1 / 2

        cls.view.vertical_position = "bottom"
        cls.view.horizontal_position = "left"

        return x, y, w, h


@add_to_watchers
class AVIONICS_UP_1_TilesWatcher(AVIONICS_DOWN_1_TilesWatcher):
    screen_type = ScreenPosition.MDU_UP

    view_name = "avionics_up_1"
    view_title = "AVIONICS up 1 - falcon7x"

    view = None
    prev_state = [[], []]


@add_to_watchers
class AVIONICS_UP_2_TilesWatcher(AVIONICS_DOWN_2_TilesWatcher):
    screen_type = ScreenPosition.MDU_UP

    view_name = "avionics_up_2"
    view_title = "AVIONICS up 2 - falcon7x"

    view = None
    prev_state = [[], []]
