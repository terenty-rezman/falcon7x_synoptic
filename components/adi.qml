import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"

Rectangle {
    id: self

    anchors.fill: parent
    color: "#C8761B"

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton

        onClicked: (mouse) => {
            if (mouse.button === Qt.RightButton) {
                contextMenu.popup()
            }
        }
    }

    Menu {
        id: contextMenu

        // Close Action
        Action {
            text: "Close Window"
            onTriggered: {
                Qt.quit() // Close the application
            }
        }
    }

    Horizon {
        objectName: "adi_horizon"
    }

    AdiBankTop {
        objectName: "adi_bank"
    }

    AdiAlt {
        objectName: "adi_alt"
        x: 547
        y: 74
    }

    AdiSpeed {
        objectName: "adi_airspeed"
        x: 32
        y: 74
    }
    
    AdiHeading {
        objectName: "adi_heading"
        x: 324
        y: 621
    }

    AdiVerticalSpeed {
        objectName: "adi_vertical_speed"
        x: 637
        y: 100
    }

    AdiWhiteText {
        text: "UTC"
        x: 6
        y: 496
    }

    AdiGreenText {
        text: "00:00"
        x: 51
        y: 496
    }

    AdiWhiteText {
        text: "ET"
        x: 6
        y: 521
    }

    AdiWhiteText {
        text: "00:00"
        x: 51
        y: 521
    }
}
