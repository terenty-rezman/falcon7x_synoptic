from enum import IntEnum

from PySide6.QtQuick import QQuickView
from PySide6.QtCore import QPoint, QSettings, QRect, Qt, QUrl
from PySide6.QtQuick import QQuickView, QQuickItem

import screen_brightness_control

from falcon7x_core.xplane.params import Params
import settings as s


def strtobool (val):
    """Convert a string representation of truth to true (1) or false (0).
    True values are 'y', 'yes', 't', 'true', 'on', and '1'; false values
    are 'n', 'no', 'f', 'false', 'off', and '0'.  Raises ValueError if
    'val' is anything else.
    """
    val = val.lower()
    if val in ('y', 'yes', 't', 'true', 'on', '1'):
        return 1
    elif val in ('n', 'no', 'f', 'false', 'off', '0'):
        return 0
    else:
        raise ValueError("invalid truth value %r" % (val,))


class ScreenState(IntEnum):
    MONITOR_ENABLED = 0
    BLACK_SCREEN = 1
    RED_CROSS = 2


class Screen(QQuickView):
    def __init__(self, window_width, window_height, name, monitor_number):
        self.win_width = window_width
        self.win_height = window_height
        self.mouse_pressed = False
        self.name = name
        self.monitor_number = monitor_number
        self.last_brightness = None

        self.last_black_screen_state = None
        return super().__init__()

    def mousePressEvent(self, event):
        # Store the positions of mouse and window and
        # change the window position relative to them.
        if self.windowStates() & Qt.WindowState.WindowFullScreen:
            return 

        self.mouse_pressed = True
        self.windowPos = self.position()
        self.mousePos = QPoint(event.globalPosition().x(), event.globalPosition().y())
        super().mousePressEvent(event)

    def mouseMoveEvent(self, event):
        if self.mouse_pressed:
            global_pos = QPoint(event.globalPosition().x(), event.globalPosition().y())
            self.setPosition(self.windowPos + global_pos - self.mousePos)
        super().mouseMoveEvent(event)
    
    def mouseReleaseEvent(self, event):
        self.mouse_pressed = False
        return super().mouseReleaseEvent(event)
    
    def closeEvent(self, event):
        self.writeSettings()

    def writeSettings(self):
        settings = QSettings("settings.ini", QSettings.IniFormat)
        settings.beginGroup(self.name)
        settings.setValue("x", self.position().x())
        settings.setValue("y", self.position().y())
        settings.setValue("w", self.width())
        settings.setValue("h", self.height())
        settings.setValue("fullscreen", bool(self.windowStates() & Qt.WindowState.WindowFullScreen))
        settings.endGroup()
        settings.sync()
        
    def readSettings(self):
        settings = QSettings("settings.ini", QSettings.IniFormat)
        settings.beginGroup(self.name)
        x = int(settings.value("x", 40))
        y = int(settings.value("y", 40))
        w = int(settings.value("w", self.win_width))
        h = int(settings.value("h", self.win_height))

        self.setGeometry(QRect(x, y, w, h))
        self.setWidth(self.win_width)
        self.setHeight(self.win_height)
        self.fullscreen = strtobool(settings.value("fullscreen", "false"))
        # self.setMaximumWidth(self.win_width)
        # self.setMaximumHeight(self.win_height)
    
    def show(self):
        self.setFlags(self.flags() | Qt.WindowStaysOnTopHint)

        if self.fullscreen:
            super().showFullScreen()
        else:
            super().show()

        self.setFlags(self.flags() | Qt.WindowStaysOnTopHint)


    def set_monitor_brightness(self, brightness):
        if self.last_brightness != brightness:
            update_black_screen_state = False
            if self.last_brightness == 0 or brightness == 0:
                update_black_screen_state = True

            self.last_brightness = brightness
            screen_brightness_control.set_brightness(brightness, display=self.monitor_number)

            if update_black_screen_state:
                self.update_monitor_state()            


    def set_black_screen_state(self, state):
        if self.last_black_screen_state != state:
            self.last_black_screen_state = state
            self.update_monitor_state()


    def update_monitor_state(self):
        if self.last_brightness > 0:
            if self.last_black_screen_state == ScreenState.MONITOR_ENABLED:
                self.hide();
            elif self.last_black_screen_state == ScreenState.RED_CROSS: 
                self.show();
                cross = self.rootObject().findChild(QQuickItem, "red_cross")
                cross.setProperty("visible", True)
    
        if self.last_brightness == 0 or self.last_black_screen_state == ScreenState.BLACK_SCREEN:
                self.show();
                cross = self.rootObject().findChild(QQuickItem, "red_cross")
                cross.setProperty("visible", False)


class Screens:
    left_screen: Screen = None
    right_screen: Screen = None
    middle_up_screen: Screen = None
    middle_down_screen: Screen = None
    mini_screen: Screen = None


def create_black_screens():
    global Screens

    Screens.left_screen = create_sreen_control("left black screen", s.LEFT_MONITOR_ID)
    Screens.left_screen.show()

    Screens.right_screen = create_sreen_control("right black screen", s.RIGHT_MONITOR_ID)
    Screens.right_screen.show()

    Screens.middle_up_screen = create_sreen_control("middle up black screen", s.MIDDLE_UP_MONITOR_ID)
    Screens.middle_up_screen.show()

    Screens.middle_down_screen = create_sreen_control("middle down black screen", s.MIDDLE_DOWN_MONITOR_ID)
    Screens.middle_down_screen.show()

    Screens.mini_screen = create_sreen_control("mini black screen", s.MINI_MONITOR_ID)
    Screens.mini_screen.show()


def create_sreen_control(name, monitor_number):
    black_qml_url = QUrl("components/black_screen.qml")

    screen = Screen(300, 150, name=name, monitor_number=monitor_number)
    screen.rootContext().setContextProperty("window_name", name)
    screen.rootContext().setContextProperty("view", screen)
    screen.engine().addImportPath("./Falcon7x_synoptic_design")
    screen.setSource(black_qml_url)
    screen.setTitle(f"{name} - falcon7x")
    screen.setResizeMode(QQuickView.SizeRootObjectToView)
    screen.readSettings()
    # left_screen.setFlags(synoptic.flags() | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint)
    # black_screen.setFlags(black_screen.flags() | Qt.WindowStaysOnTopHint | Qt.FramelessWindowHint)

    return screen


black_screen_ref = None


def set_data_http_tcp(data, synoptic):
    global black_screen_ref

    data = data.get("data") or {} 

    if black_screen_ref is None:
        black_screen_ref = {
            Params["sim/custom/7x/z_left_black_screen"]: Screens.left_screen,
            Params["sim/custom/7x/z_right_black_screen"]: Screens.right_screen,
            Params["sim/custom/7x/z_middle_up_black_screen"]: Screens.middle_up_screen,
            Params["sim/custom/7x/z_middle_down_black_screen"]: Screens.middle_down_screen,
            Params["sim/custom/7x/z_mini_black_screen"]: Screens.mini_screen,
        }

    for dataref, screen in black_screen_ref.items():
        value = data.get(dataref)
        if value is not None:
            if value == 0:
                screen.set_black_screen_state(ScreenState.MONITOR_ENABLED)

            if value == 1:
                screen.set_black_screen_state(ScreenState.BLACK_SCREEN)

            if value == 2:
                screen.set_black_screen_state(ScreenState.RED_CROSS)


brightness_screen_ref = None

def set_data_http_udp(data):
    global brightness_screen_ref

    data = data.get("data") or {} 

    if brightness_screen_ref is None:
        brightness_screen_ref = {
            Params["sim/custom/7x/z_left_screen_brightness"]: Screens.left_screen,
            Params["sim/custom/7x/z_right_screen_brightness"]: Screens.right_screen,
            Params["sim/custom/7x/z_up_screen_brightness"]: Screens.middle_up_screen,
            Params["sim/custom/7x/z_down_screen_brightness"]: Screens.middle_down_screen,
            Params["sim/custom/7x/z_mini_screen_brightness"]: Screens.mini_screen
        }

    for dataref, screen in brightness_screen_ref.items():
        value = data.get(dataref)
        if value is not None:
            screen.set_monitor_brightness(value)


# save initial brightness
screen_initial_brightness = screen_brightness_control.get_brightness()

def restore_brightness():
    global screen_initial_brightness

    for i, b in enumerate(screen_initial_brightness):
        screen_brightness_control.set_brightness(b, display=i)
