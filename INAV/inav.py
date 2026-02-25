import sys
import random

from PySide6.QtCore import QAbstractListModel, QModelIndex, Qt, Slot
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtPositioning import QGeoCoordinate


class MarkerModel(QAbstractListModel):
    # Define roles for QML access
    MarkerRoles = {
        Qt.UserRole + 1: b'position',
        Qt.UserRole + 2: b'name'
    }

    def __init__(self, parent=None):
        super().__init__(parent)
        self._coordinates = []

    def rowCount(self, parent=QModelIndex()):
        return len(self._coordinates)

    def data(self, index, role=Qt.DisplayRole):
        if not index.isValid() or index.row() >= self.rowCount():
            return None
        coordinate_data = self._coordinates[index.row()]
        if role == Qt.UserRole + 1:
            return coordinate_data['position']
        if role == Qt.UserRole + 2:
            return coordinate_data['name']
        return None

    def roleNames(self):
        return self.MarkerRoles

    @Slot(float, float, str)
    def addMarker(self, latitude, longitude, name):
        # Method to add a marker from Python (or QML using @Slot)
        coordinate = QGeoCoordinate(latitude, longitude)
        self.beginInsertRows(QModelIndex(), self.rowCount(), self.rowCount())
        self._coordinates.append({'position': coordinate, 'name': name})
        self.endInsertRows()

    def clear(self):
        """Clears all data from the model."""
        if not self._coordinates:
            return # Already empty

        # Notify view of intent to remove all rows
        self.beginRemoveRows(QModelIndex(), 0, len(self._coordinates) - 1)
        self._coordinates.clear() # Clear Python list [3, 4, 5]
        self.endRemoveRows() # Notify view that removal is done [9]
    

markerModel = MarkerModel()

