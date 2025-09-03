import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"

Rectangle {
    anchors.fill: parent
    color: "#545454"

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

    EngUnderCas {
        id: eng_under_cas
    }
}
