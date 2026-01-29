import QtQuick
import QtQuick.Studio.Components

Item {
    id: self
    x: 0
    y: 0
    width: 15
    height: 44

    property real value: deflection / 40

    property real deflection: 2

    Rectangle {
        id: fill
        x: 2
        y: 2
        width: 11
        height: (40 * self.value)
        color: "#00ff00"
        border.color: "#00000000"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 2
    }

    Rectangle {
        id: rectangle39
        x: 0
        y: 0
        width: 15
        height: 44
        color: "#00ffffff"
        radius: 2
        border.color: "#919b8a"
        border.width: 2
    }
}
