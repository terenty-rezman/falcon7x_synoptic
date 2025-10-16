import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {
    id: self

    property real bank_deg: 45

    anchors.fill: parent

    property int center_x: 324
    property int center_y: 222

    property bool no_slip_comp: false

    Rectangle {
        width: 684 / 2
        color: "#55ff00ff"
        visible: false
    }

    Image {
        source: "../svg/ADI_BANK_ANGLE.svg"

        width: 684
        height: 766
    }

    Image {
        Rectangle {
            anchors.fill: parent
            color: "#5500ffff"
            visible: false
        }

        Rectangle {
            color: "#FFDE21"
            width: 18
            height: 4
            x: parent.width/2 - width/2
            y: parent.height/2 - height/2 - 129
            visible: no_slip_comp
        }

        source: "../svg/ADI_BANK_ANGLE_TRIANGLE.svg"

        x: -180 + self.center_x
        y: -180 + self.center_y
        width: 360
        height: 360

        rotation: -self.bank_deg
    }
}
