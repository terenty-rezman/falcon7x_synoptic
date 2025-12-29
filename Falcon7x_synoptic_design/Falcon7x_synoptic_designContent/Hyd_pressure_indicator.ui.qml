import QtQuick
import QtQuick.Studio.Components

import "../../components/basic_components"

Item {
    id: self

    width: 16
    height: 75

    property real psi: 1000

    property real max_psi: 4000
    property real low_level: 1800
    property real high_level: 3300

    // Image {
    //     id: image
    //     x: 0
    //     y: 0
    //     width: 10
    //     height: 75
    //     source: "images/HYD.png"
    //     fillMode: Image.PreserveAspectFit
    // }
    Rectangle {
        id: scale_item
        x: 2
        y: 0
        width: 7
        height: 75
        color: "#00ffffff"
        border.color: "#ffffff"
        border.width: 1
        scale: 1

        Rectangle {
            id: rectangle4
            x: 1
            anchors.top: high_level_line.bottom
            anchors.bottom: low_level_line.bottom
            width: 5
            color: "#73db0c"
            border.color: "#00000000"
            scale: 1

            visible: !top_rect.visible && !bottom_rect.visible
        }

        Rectangle {
            id: bottom_rect
            x: 1
            anchors.top: low_level_line.bottom
            anchors.bottom: scale_item.bottom

            width: 5

            color: "#c5b217"
            border.color: "#00000000"
            z: -1
            visible: self.psi < self.low_level
        }

        Rectangle {
            id: top_rect
            x: 1
            anchors.top: scale_item.top
            anchors.bottom: high_level_line.bottom

            width: 5

            color: "#c5b217"
            border.color: "#00000000"
            z: -1

            visible: self.psi > self.high_level
        }

        Rectangle {
            id: high_level_line
            x: -2
            y: scale_item.height - self.high_level / self.max_psi * scale_item.height
            width: 11
            height: 1
            color: "#c5b217"
            border.color: "#00000000"
            scale: 1
        }

        Rectangle {
            id: low_level_line
            x: -2
            y: scale_item.height - self.low_level / self.max_psi * scale_item.height
            width: 11
            height: 1
            color: "#c5b217"
            border.color: "#00000000"
            scale: 1
        }

        TriangleItem {
            id: triangle
            x: 9
            y: scale_item.height - self.psi / self.max_psi * scale_item.height
            width: 7
            height: 7
            radius: 0
            rotation: -90
            fillColor: (self.low_level < self.psi
                        && self.psi < self.high_level) ? "#73db0c" : "#c5b217"
            strokeColor: "transparent"
            transformOrigin: "Left"
        }
    }

    ZoneText {
        id: _text10
        y: 77
        anchors.horizontalCenter: scale_item.horizontalCenter

        color: "#00ff00"
        value: self.psi
        font.letterSpacing: -0.1
        font.pixelSize: 12
        font.family: "Arial"

        value_zones: [0, self.low_level, self.high_level]
        state_zones: ["yellow", "green", "yellow"]

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.horizontalCenterOffset: 0
    }
    Text {
        id: _text11
        x: -5
        y: 91
        width: 26
        height: 15
        color: "#a8b49e"
        text: qsTr("PSI")
        font.letterSpacing: 0.1
        font.pixelSize: 12
        font.family: "Arial"
    }
}
