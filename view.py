from PySide6.QtQuick import QQuickView
from PySide6.QtCore import QPoint, QSettings, QRect, QEvent, Qt, QDateTime, Property, Signal
from PySide6.QtGui import QCursor, QMouseEvent, QGuiApplication
import PySide6.QtTest as QtTest
import backend


class View(QQuickView):
    @Property(QPoint)
    def mouse_global_click_pos(self):
        return self.mouse_global_pos

    current_window_tile_changed = Signal()

    @Property(str, notify=current_window_tile_changed)
    def current_window_tile(self):
        return self.current_tile
    
    @current_window_tile.setter
    def current_window_tile(self, value: str):
        if value != self.current_tile:
            self.current_tile = value
            self.current_window_tile_changed.emit()

    def __init__(self, window_name, window_width, window_height):
        super().__init__()
        self.win_width = window_width
        self.win_height = window_height
        self.mouse_pressed = False
        self.window_name = window_name 
        self.current_tile = "UNDEFINED"
        
        # if window_name == "mdu_up":
        #     self.startTimer(5000)
    
    def timerEvent(self, arg__1):
        self.send_mouse_event()
        return super().timerEvent(arg__1)

    def mousePressEvent(self, event: QMouseEvent):
        self.mouse_global_pos = QPoint(event.globalPosition().x(), event.globalPosition().y())

        if event.button() == Qt.MouseButton.LeftButton:
            self.mouse_pressed = True
            self.windowPos = self.position()
            self.mousePos = self.mouse_global_pos

        super().mousePressEvent(event)

    def mouseMoveEvent(self, event):
        if self.mouse_pressed:
            global_pos = QPoint(event.globalPosition().x(), event.globalPosition().y())
            self.setPosition(self.windowPos + global_pos - self.mousePos)
        super().mouseMoveEvent(event)
    
    def mouseReleaseEvent(self, event):
        if event.button() == Qt.MouseButton.LeftButton:
            self.mouse_pressed = False
        return super().mouseReleaseEvent(event)
    
    def closeEvent(self, event):
        self.writeSettings()

    def writeSettings(self):
        settings = QSettings("settings.ini", QSettings.IniFormat)
        settings.beginGroup(self.window_name)
        settings.setValue("x", self.position().x())
        settings.setValue("y", self.position().y())
        settings.setValue("w", self.width())
        settings.setValue("h", self.height())
        settings.endGroup()
        
    def readSettings(self):
        settings = QSettings("settings.ini", QSettings.IniFormat)
        settings.beginGroup(self.window_name)
        x = int(settings.value("x", 40))
        y = int(settings.value("y", 40))
        w = int(settings.value("w", self.win_width))
        h = int(settings.value("h", self.win_height))

        self.setGeometry(QRect(x, y, w, h))
        self.setWidth(self.win_width)
        self.setHeight(self.win_height)
        self.setMaximumWidth(self.win_width)
        self.setMaximumHeight(self.win_height)
    
    def send_mouse_event(self):
        global_pos = QCursor.pos()  
        local_pos = self.mapFromGlobal(global_pos)
        QtTest.QTest.mouseClick(self, Qt.MouseButton.RightButton, Qt.KeyboardModifier.AltModifier, local_pos)
