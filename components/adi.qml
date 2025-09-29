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

    AdiGear {
        objectName: "adi_gear"
        x: 542
        y: 417
    }

    AdiPitch {
        objectName: "adi_pitch"
        x: 631
        y: 413
    }


    AdiWhiteText {
        text: "UTC"
        x: 6
        y: 496
    }

    AdiGreenText {
        objectName: "adi_current_time"
        property int hours: 0
        property int minutes: 0
        text: lead_zero(hours) + ":" + lead_zero(minutes)
        x: 51
        y: 496

        function lead_zero(number) {
            if (number < 10) {
                return "0" + number;
            }
            else {
                return number;
            }
        }
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
