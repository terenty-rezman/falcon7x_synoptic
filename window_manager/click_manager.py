from PySide6.QtGui import QGuiApplication, QCursor, QScreen
from PySide6.QtCore import QObject, Slot, Property, Signal, QPoint, QRect
import PySide6.QtCore as QtCore

from window_manager.tiles import WindowTile, screen_tiles


class ClickManager(QObject):
    def __init__(self, tile_watchers, Watcher):
        self.tile_watchers = tile_watchers
        self.Watcher = Watcher
        self.screen_tiles = screen_tiles

        super().__init__()

    @Slot(QObject, str, QPoint, result=None)
    def menu_item_clicked(self, view, clicked_item, global_mouse_pos):
        global screen_tiles

        screen: QScreen = view.screen()
        screen_rect = screen.availableGeometry()

        i, j = self.calc_quadrant(global_mouse_pos, screen_rect)
        screen_type = None

        for w in self.tile_watchers:
            if w.view == view:
                screen_type = w.screen_type
                break
        
        screen_matrix = screen_tiles[screen_type]

        match clicked_item:
            case "INAV":
                screen_matrix[i][j] = WindowTile.INAV
            case "SYNOPTIC":
                screen_matrix[i][j] = WindowTile.SYNOPTIC
            case "AVIONICS":
                screen_matrix[i][j] = WindowTile.AVIONICS
            case "WPT LIST":
                screen_matrix[i][j] = WindowTile.WPT_LIST
                if j == 0:
                    screen_matrix[0][0] = WindowTile.WPT_LIST
                    screen_matrix[1][0] = WindowTile.WPT_LIST

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


click_manager = None

def get_click_manager(tile_watchers, Watcher):
    global click_manager

    if click_manager is None:
        click_manager = ClickManager(tile_watchers, Watcher)
    
    return click_manager
