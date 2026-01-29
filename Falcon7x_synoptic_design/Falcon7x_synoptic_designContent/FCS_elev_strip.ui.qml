import QtQuick
import QtQuick.Studio.Components

Item {
    id: self
    x: 0
    y: 0
    width: 14

    property real deflection: 10
    property real value: self.deflection / 10

    height: 43

    Rectangle {
        id: bottom_fill
        x: 2
        anchors.top: horizontal_line.bottom
        width: 10
        height: 19 * Math.abs(self.value)
        color: "#00ff00"
        border.color: "#00000000"
        visible: value > 0
    }

    Rectangle {
        id: top_fill
        x: 2
        anchors.bottom: horizontal_line.top
        width: 10
        height: 19 * Math.abs(self.value)
        color: "#00ff00"
        border.color: "#00000000"

        visible: value < 0
    }

    Rectangle {
        id: rectangle28
        x: 0
        y: 0
        width: 14
        height: 43
        color: "#00ffffff"
        radius: 2
        border.color: "#919b8a"
        border.width: 2
    }

    Rectangle {
        id: horizontal_line
        x: 0
        y: 21
        width: 14
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
    }
}
