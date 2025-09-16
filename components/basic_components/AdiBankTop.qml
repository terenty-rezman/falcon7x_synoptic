import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {
    id: self

    property real bank_deg: 45

    width: 360 
    height: 360 

    Rectangle {
        width: self.width
        height: self.height
        color: "#55ffffff"
        x: -180
        y: -180
        visible: false
    }

    Image {
        source: "../svg/ADI_BANK_ANGLE.svg"

        x: -180
        y: -180
        width: self.width
        height: self.height
    }

    Image {
        source: "../svg/ADI_BANK_ANGLE_TRIANGLE.svg"

        x: -180
        y: -180
        width: self.width
        height: self.height

        rotation: -self.bank_deg

    }
}
