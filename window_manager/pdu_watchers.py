from copy import deepcopy

import view_helper
import backend
from window_manager.tiles import ScreenTiles, WindowTile, ScreenPosition, current_screen_tiles

from window_manager.manager import add_to_watchers, TilesWatcherBase


# @add_to_watchers
class PDU_LEFT_TilesWatcher(TilesWatcherBase):
    watch_tile_type = WindowTile.PDU
    screen_type = ScreenPosition.PDU_LEFT

    qml_component_path = "components/pdu_left.qml"
    view_name = "pdu_left"
    view_title = "PDU left - falcon7x"

    view = None
    prev_state = [[], []]

    @classmethod
    def is_visible(cls, new_tiles):
        return new_tiles[0][0] == cls.watch_tile_type

    @classmethod 
    def calc_window_geometry(cls, screen_x, screen_y, screen_width, screen_height, new_tiles):
        x = screen_x
        y = screen_y
        w = screen_width 
        h = screen_height

        cls.view.vertical_position = "top"
        cls.view.horizontal_position = "left"

        return x, y, w, h


# @add_to_watchers
class PDU_RIGHT_TilesWatcher(PDU_LEFT_TilesWatcher):
    watch_tile_type = WindowTile.PDU
    screen_type = ScreenPosition.PDU_RIGHT

    qml_component_path = "components/pdu_right.qml"
    view_name = "pdu_right"
    view_title = "PDU right - falcon7x"

    view = None
    prev_state = [[], []]
