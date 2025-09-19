import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"

Rectangle {
    id: self

    anchors.fill: parent
    color: "#DD8618"

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
    
    AdiHeading {
        objectName: "adi_heading"
        x: 324
        y: 621
    }
}
