import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    color: "#000000"

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

    Synoptic {
        id: synoptic_1
        width: 2 * parent.width / 3 
        height: parent.height / 2
        currentIndex: 4
    }

    Synoptic {
        id: synoptic_2
        y: parent.height / 2
        width: 2 * parent.width / 3
        height: parent.height / 2
        currentIndex: 3
    }

    Text {
        text: "up"
        color: "#fff"
        anchors.right: parent.right
    }
}
