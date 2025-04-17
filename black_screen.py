from PySide6.QtQuick import QQuickView
from PySide6.QtCore import QPoint, QSettings, QRect, Qt, QUrl
from PySide6.QtQuick import QQuickView, QQuickItem

from falcon7x_core.xplane.params import Params


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


class BlackScreen(QQuickView):
    def __init__(self, window_width, window_height, name):
        self.win_width = window_width
        self.win_height = window_height
        self.mouse_pressed = False
        self.name = name
        self.screen = False
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
        if self.fullscreen:
            super().showFullScreen()
        else:
            super().show()

        # self.setFlags(self.flags() | Qt.WindowStaysOnTopHint)


class Screens:
    left_black_screen = None
    right_black_screen = None
    middle_up_black_screen = None
    middle_down_black_screen = None
    mini_black_screen = None


def create_black_screens():
    global Screens

    Screens.left_black_screen = create_black_sreen("left black screen")
    Screens.left_black_screen.show()

    Screens.right_black_screen = create_black_sreen("right black screen")
    Screens.right_black_screen.show()

    Screens.middle_up_black_screen = create_black_sreen("middle up black screen")
    Screens.middle_up_black_screen.show()

    Screens.middle_down_black_screen = create_black_sreen("middle down black screen")
    Screens.middle_down_black_screen.show()

    Screens.mini_black_screen = create_black_sreen("mini black screen")
    Screens.mini_black_screen.show()


def create_black_sreen(name):
    black_qml_url = QUrl("components/black_screen.qml")

    black_screen = BlackScreen(300, 150, name=name)
    black_screen.rootContext().setContextProperty("view", black_screen)
    black_screen.engine().addImportPath("./Falcon7x_synoptic_design")
    black_screen.setSource(black_qml_url)
    black_screen.setTitle(f"{name} - falcon7x")
    black_screen.setResizeMode(QQuickView.SizeRootObjectToView)
    black_screen.readSettings()
    # left_screen.setFlags(synoptic.flags() | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint)
    # black_screen.setFlags(black_screen.flags() | Qt.WindowStaysOnTopHint | Qt.FramelessWindowHint)

    return black_screen


def set_data_http(data):
    global black_screen_ref

    data = data.get("data") or {} 

    black_screen_ref = {
        Params["sim/custom/7x/z_left_black_screen"]: Screens.left_black_screen,
        Params["sim/custom/7x/z_right_black_screen"]: Screens.right_black_screen,
        Params["sim/custom/7x/z_middle_up_black_screen"]: Screens.middle_up_black_screen,
        Params["sim/custom/7x/z_middle_down_black_screen"]: Screens.middle_down_black_screen,
        Params["sim/custom/7x/z_mini_black_screen"]: Screens.mini_black_screen,
    }

    for dataref, screen in black_screen_ref.items():
        value = data.get(dataref)
        if value is not None:
            if value == 0:
                screen.hide();

            if value == 1:
                screen.show();
                cross = screen.rootObject().findChild(QQuickItem, "red_cross")
                cross.setProperty("visible", False)

            if value == 2:
                screen.show();
                cross = screen.rootObject().findChild(QQuickItem, "red_cross")
                cross.setProperty("visible", True)
