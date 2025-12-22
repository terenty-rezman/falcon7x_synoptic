import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"
import "../Falcon7x_synoptic_design/Falcon7x_synoptic_designContent"

Item {
    objectName: "pdu_right"

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
        x: 1024 * 1 / 3
        y: 0
        side: "right"

        width: 684
        height: 768
    }

    EngUnderCas {
        x: 0
        y: 768 / 4
    }

    PDUsys {
        x: 0
        y: 768 / 2
    }

    Text {
        text: "right"
        color: "#fff"
        anchors.right: parent.right
    }
}
