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
        objectName: "synoptic_tab_bar"
        width: parent.width
        height: parent.height / 2
        currentIndex: 2
    }
}
