from copy import deepcopy

import view_helper
import backend
from window_manager.tiles import ScreenTiles, WindowTile, ScreenPosition, current_screen_tiles

from window_manager.manager import add_to_watchers, TilesWatcherBase


@add_to_watchers
class FLIGHT_MGMT_DOWN_1_TilesWatcher(TilesWatcherBase):
    watch_tile_type = WindowTile.FLIGHT_MGMT
    screen_type = ScreenPosition.MDU_DOWN

    qml_component_path = "components/Flight_mgmt_window.qml"
    view_name = "flight_mgmt_down_1"
    view_title = "Flight Mgmt down 1 - falcon7x"

    view = None
    prev_state = [[], []]

    @classmethod
    def is_visible(cls, new_tiles):
        return new_tiles[0][0] == cls.watch_tile_type or new_tiles[0][1] == cls.watch_tile_type

    @classmethod 
    def calc_window_geometry(cls, screen_x, screen_y, screen_width, screen_height, new_tiles):
        if new_tiles[0][0] == cls.watch_tile_type and new_tiles[0][1] == cls.watch_tile_type:
            x = screen_x
            y = screen_y
            w = screen_width
            h = screen_height * 1 / 2

            cls.view.vertical_position = "top"
            cls.view.horizontal_position = "left"
        elif new_tiles[0][0] == cls.watch_tile_type:
            x = screen_x
            y = screen_y
            w = screen_width * 2 / 3
            h = screen_height * 1 / 2

            cls.view.vertical_position = "top"
            cls.view.horizontal_position = "left"
        elif new_tiles[0][1] == cls.watch_tile_type:
            x = screen_x + screen_width * 2 / 3
            y = screen_y
            w = screen_width * 1 / 3
            h = screen_height * 1 / 2

            cls.view.vertical_position = "top"
            cls.view.horizontal_position = "right"

        return x, y, w, h


@add_to_watchers
class FLIGHT_MGMT_DOWN_2_TilesWatcher(TilesWatcherBase):
    watch_tile_type = WindowTile.FLIGHT_MGMT
    screen_type = ScreenPosition.MDU_DOWN

    qml_component_path = "components/Flight_mgmt_window.qml"
    view_name = "flight_mgmt_down_2"
    view_title = "Flight Mgmt down 2 - falcon7x"

    view = None
    prev_state = [[], []]

    @classmethod
    def is_visible(cls, new_tiles):
        return new_tiles[1][0] == cls.watch_tile_type or new_tiles[1][1] == cls.watch_tile_type

    @classmethod 
    def calc_window_geometry(cls, screen_x, screen_y, screen_width, screen_height, new_tiles):
        if new_tiles[1][0] == cls.watch_tile_type and new_tiles[1][1] == cls.watch_tile_type:
            x = screen_x
            y = screen_y + screen_height * 1 / 2
            w = screen_width
            h = screen_height * 1 / 2

            cls.view.vertical_position = "top"
            cls.view.horizontal_position = "left"
        elif new_tiles[1][0] == cls.watch_tile_type:
            x = screen_x
            y = screen_y + screen_height * 1 / 2
            w = screen_width * 2 / 3
            h = screen_height * 1 / 2

            cls.view.vertical_position = "bottom"
            cls.view.horizontal_position = "left"
        elif new_tiles[1][1] == cls.watch_tile_type:
            x = screen_x + screen_width * 2 / 3
            y = screen_y + screen_height * 1 / 2
            w = screen_width * 1 / 3
            h = screen_height * 1 / 2

            cls.view.vertical_position = "bottom"
            cls.view.horizontal_position = "right"

        return x, y, w, h


@add_to_watchers
class FLIGHT_MGMT_UP_1_TilesWatcher(FLIGHT_MGMT_DOWN_1_TilesWatcher):
    screen_type = ScreenPosition.MDU_UP

    view_name = "flight_mgmt_up_1"
    view_title = "SYNOPTIC up 1 - falcon7x"

    view = None
    prev_state = [[], []]


@add_to_watchers
class FLIGHT_MGMT_UP_2_TilesWatcher(FLIGHT_MGMT_DOWN_2_TilesWatcher):
    screen_type = ScreenPosition.MDU_UP

    view_name = "flight_mgmt_up_2"
    view_title = "SYNOPTIC up 2 - falcon7x"

    view = None
    prev_state = [[], []]
