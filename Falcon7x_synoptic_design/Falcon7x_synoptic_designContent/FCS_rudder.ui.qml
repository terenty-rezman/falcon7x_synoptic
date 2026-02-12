import QtQuick
import QtQuick.Studio.Components

Item {
    id: self
    x: 0
    y: 0
    width: 51
    height: 13

    property real value: deflection / 25
    property real deflection: 20

    Rectangle {
        id: right_fill
        anchors.left: vertical_line.right
        y: 0
        width: 23 * Math.abs(self.value)
        height: 12
        color: "#00ff00"
        border.color: "#00000000"
        visible: value > 0
    }

    Rectangle {
        id: left_fill
        anchors.right: vertical_line.left
        width: 23 * Math.abs(self.value)
        height: 12
        color: "#00ff00"
        border.color: "#00000000"
        visible: value < 0
    }

    Rectangle {
        id: rectangle37
        x: 18
        y: -19
        width: 14
        height: 51
        color: "#00ffffff"
        radius: 2
        border.color: "#919b8a"
        border.width: 2
        rotation: 90
    }

    Rectangle {
        id: vertical_line
        x: 25
        y: 0
        width: 2
        height: 13
        color: "#919b8a"
        border.color: "#00000000"
    }
}
