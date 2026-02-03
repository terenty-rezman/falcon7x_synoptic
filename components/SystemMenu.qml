import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts


MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton

        onClicked: (mouse) => {
            if (mouse.button === Qt.RightButton) {
                contextMenu.popup()
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

        Action {
            text: "Close Application"
            onTriggered: {
                Qt.quit() // Close the application
            }
        }
    }
}
