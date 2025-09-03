from PySide6.QtQuick import QQuickView
from PySide6.QtCore import QPoint, QSettings, QRect


class View(QQuickView):
    def __init__(self, window_name, window_width, window_height):
        self.win_width = window_width
        self.win_height = window_height
        self.mouse_pressed = False
        self.window_name = window_name 
        return super().__init__()

    def mousePressEvent(self, event):
        # Store the positions of mouse and window and
        # change the window position relative to them.
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

