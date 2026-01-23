import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"
import "../Falcon7x_synoptic_design/Falcon7x_synoptic_designContent"

Item {
    objectName: "pdu_left"

    Rectangle {
        anchors.fill: parent
        color: "#545454"
    }

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

    Adi {
        x: 0
        y: 0
        side: "left"

        width: 0.6666 * 1024
        height: 768
    }

    EngUnderCas {
        x: 2 / 3 * 1024
        y: 768 / 4
    }

    CAS_window {
        x: 0.6666 * 1024
        y: 0
    }

    PDUsys {
        x: 1024 * 2 / 3
        y: 768 / 2
    }

    Text {
        text: "left"
        color: "#fff"
    }
}
