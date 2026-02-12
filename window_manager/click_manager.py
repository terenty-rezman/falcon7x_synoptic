from copy import deepcopy

from PySide6.QtGui import QGuiApplication, QCursor, QScreen
from PySide6.QtCore import QObject, Slot, Property, Signal, QPoint, QRect
import PySide6.QtCore as QtCore

from window_manager.tiles import WindowTile, current_screen_tiles, default_screen_tiles


class ClickManager(QObject):
    def __init__(self, tile_watchers, Watcher):
        self.tile_watchers = tile_watchers
        self.Watcher = Watcher
        self.screen_tiles = current_screen_tiles

        super().__init__()

    @Slot(QObject, str, QPoint, result=None)
    def menu_item_clicked(self, view, clicked_item, global_mouse_pos):
        global current_screen_tiles

        screen: QScreen = view.screen()
        screen_rect = screen.availableGeometry()

        i, j = self.calc_quadrant(global_mouse_pos, screen_rect)
        screen_type = None

        for w in self.tile_watchers:
            if w.view == view:
                screen_type = w.screen_type
                break
        
        old_matrix = deepcopy(current_screen_tiles[screen_type])
        screen_matrix = current_screen_tiles[screen_type]

        match clicked_item:
            case "FULL INAV":
                screen_matrix[0][0] = WindowTile.INAV
                screen_matrix[0][1] = WindowTile.INAV
                screen_matrix[1][0] = WindowTile.INAV
                screen_matrix[1][1] = WindowTile.INAV
            case "INAV":
                screen_matrix[i][j] = WindowTile.INAV
            case "FLIGHT MGMT":
                screen_matrix[i][j] = WindowTile.FLIGHT_MGMT
            case "SYNOPTIC":
                screen_matrix[i][j] = WindowTile.SYNOPTIC
            case "AVIONICS":
                screen_matrix[i][j] = WindowTile.AVIONICS
            case "WPT LIST":
                screen_matrix[i][j] = WindowTile.WPT_LIST

                if j == 0:
                    # if click on 2/3 occupy whole 2/3
                    screen_matrix[0][0] = WindowTile.WPT_LIST
                    screen_matrix[1][0] = WindowTile.WPT_LIST
                
                if j == 1:
                    # go full screen if click on right side and 2/3 is already showing
                    if old_matrix[i][j] != WindowTile.WPT_LIST:
                        if self.is_tile_23_screen(screen_matrix, WindowTile.WPT_LIST):
                            screen_matrix[0][1] = WindowTile.WPT_LIST
                            screen_matrix[1][1] = WindowTile.WPT_LIST
            case "CHECKLIST":
                screen_matrix[i][j] = WindowTile.CHECKLIST
            
        # if wpt list not fullscreen and in any right side some wpt list tiles hanging
        if not self.is_tile_fullscreen(screen_matrix, WindowTile.WPT_LIST):
            # if 2/3 right side must be free from WPT_LIST
            if self.is_tile_23_screen(screen_matrix, WindowTile.WPT_LIST):
                if screen_matrix[0][1] == WindowTile.WPT_LIST:
                    screen_matrix[0][1] = WindowTile.FLIGHT_MGMT
                if screen_matrix[1][1] == WindowTile.WPT_LIST:
                    screen_matrix[1][1] = WindowTile.FLIGHT_MGMT
            else:
                # if not 2/3 left side should be free from WPT_LIST
                if screen_matrix[0][0] == WindowTile.WPT_LIST:
                    screen_matrix[0][0] = default_screen_tiles[screen_type][0][0]
                elif screen_matrix[1][0] == WindowTile.WPT_LIST:
                    screen_matrix[1][0] = default_screen_tiles[screen_type][1][0]


        # if tiles left after leaving fullscreen INAV
        # replace it with default tile
        if not self.is_tile_fullscreen(screen_matrix, WindowTile.INAV):
            # if not full screen right side should contain no INAV
            if screen_matrix[0][1] == WindowTile.INAV:
                screen_matrix[0][1] = default_screen_tiles[screen_type][0][1] 

            if screen_matrix[1][1] == WindowTile.INAV:
                screen_matrix[1][1] = default_screen_tiles[screen_type][1][1] 

        self.Watcher.update()


    @staticmethod
    def calc_quadrant(global_mouse_pos, screen_rect): 
        i, j = 0, 0

        sl = screen_rect.left()
        st = screen_rect.top()
        sw = screen_rect.width()
        sh = screen_rect.height()

        if QRect(sl, st, sw * 2/3, sh * 1/2).contains(global_mouse_pos):
            i = 0
            j = 0
        elif QRect(sl + sw * 2/3, st, sw * 1/3, sh * 1/2).contains(global_mouse_pos):
            i = 0
            j = 1
        elif QRect(sl, st + sh * 1/2, sw * 2/3, sh * 1/2).contains(global_mouse_pos):
            i = 1
            j = 0
        elif QRect(sl + sw * 2/3, st + sh * 1/2, sw * 1/3, sh * 1/2).contains(global_mouse_pos):
            i = 1
            j = 1
        else:
            raise Exception("CANT BE!")
        
        return i, j

    @staticmethod
    def is_tile_fullscreen(screen_matrix, tile): 
        if  screen_matrix[0][0] == screen_matrix[0][1] == screen_matrix[1][0] == screen_matrix[1][1] == tile:
            return True
        return False

    @staticmethod
    def is_tile_23_screen(screen_matrix, tile): 
        if  screen_matrix[0][0] == screen_matrix[1][0] == tile:
            return True
        return False


click_manager = None

def get_click_manager(tile_watchers, Watcher):
    global click_manager

    if click_manager is None:
        click_manager = ClickManager(tile_watchers, Watcher)
    
    return click_manager
