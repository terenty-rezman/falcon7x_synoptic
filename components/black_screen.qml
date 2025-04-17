import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    color: "#000000"

    Image {
        objectName: "red_cross"
        source: "svg/RED_CROSS.svg"
        anchors.fill: parent
        sourceSize: Qt.size(parent.width,parent.height)
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
                view.close()
            }
        }

        Action {
            text: "Show Fullscreen"
            onTriggered: {
                view.showFullScreen()
            }
        }

        Action {
            text: "Show Normal"
            onTriggered: {
                view.showNormal()
            }
        }
    }
}
