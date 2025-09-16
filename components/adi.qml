import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"

Rectangle {
    id: self

    anchors.fill: parent
    color: "#FF9A00"

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

    AdiBankTop 
    {
        objectName: "adi_bank"
        x: self.width / 2
        y: self.height / 4 + 30
    }
}
