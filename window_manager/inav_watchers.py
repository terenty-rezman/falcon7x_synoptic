from copy import deepcopy

import view_helper
import backend
from window_manager.tiles import ScreenTiles, WindowTile, ScreenPosition, screen_tiles

from window_manager.manager import add_to_watchers, TilesWatcherBase


@add_to_watchers
class INAV_DOWN_TilesWatcher(TilesWatcherBase):
    watch_tile_type = WindowTile.INAV
    screen_type = ScreenPosition.MDU_DOWN

    qml_component_path = "components/INAV_window.qml"
    view_name = "inav_down"
    view_title = "INAV down - falcon7x"

    view = None
    prev_state = [[], []]

    @classmethod
    def is_visible(cls, new_tiles):
        return new_tiles[0][0] == cls.watch_tile_type or new_tiles[1][0] == cls.watch_tile_type

    @classmethod 
    def calc_window_geometry(cls, screen_x, screen_y, screen_width, screen_height, new_tiles):
        if new_tiles[0][0] == cls.watch_tile_type and new_tiles[1][0] == cls.watch_tile_type:
            x = screen_x
            y = screen_y
            w = screen_width * 2 / 3
            h = screen_height
        elif new_tiles[0][0] == cls.watch_tile_type:
            x = screen_x
            y = screen_y
            w = screen_width * 2 / 3
            h = screen_height * 1 / 2
        else:
            x = screen_x
            y = screen_y + screen_height * 1/ 2
            w = screen_width * 2 / 3
            h = screen_height * 1 / 2

        return x, y, w, h


@add_to_watchers
class INAV_UP_TilesWatcher(INAV_DOWN_TilesWatcher):
    watch_tile_type = WindowTile.INAV
    screen_type = ScreenPosition.MDU_UP

    qml_component_path = "components/INAV_window.qml"
    view_name = "inav_up"
    view_title = "INAV up - falcon7x"

    view = None
    prev_state = [[], []]
