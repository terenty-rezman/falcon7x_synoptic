import QtQuick
import QtQuick.Studio.Components

Item {
    id: self
    x: 0
    y: 0
    width: 14

    property real value: (ail_def / 25)

    property real ail_def: 25 // [-25 25]

    height: 50

    Rectangle {
        id: bottom_fill
        x: 2
        anchors.top: horizontal_line.bottom

        width: 10
        color: "#00ff00"
        border.color: "#00000000"

        height: Math.abs(self.value) * 23
        visible: value > 0
    }

    Rectangle {
        id: top_fill
        x: 2
        anchors.bottom: horizontal_line.top

        width: 10
        color: "#00ff00"
        border.color: "#00000000"

        height: Math.abs(self.value) * 23
        visible: value < 0
    }

    Rectangle {
        x: 0
        y: 0
        width: 14
        height: 50
        color: "#00ffffff"
        radius: 2
        border.color: "#919b8a"
        border.width: 2
    }

    Rectangle {
        id: horizontal_line
        x: 0
        y: 24
        width: 14
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
    }
}
