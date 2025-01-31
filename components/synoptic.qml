import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"


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

    TabBar {
        id: tab_bar
        width: parent.width

        SynopticTabButton {
            id: stat_button
            text: qsTr("STAT")
        }

        SynopticTabButton {
            text: qsTr("ENG")
        }

        SynopticTabButton {
            text: qsTr("ELEC")
        }

        SynopticTabButton {
            text: qsTr("FUEL")
        }

        SynopticTabButton {
            text: qsTr("HYD")
        }

        SynopticTabButton {
            text: qsTr("ECS")
        }

        SynopticTabButton {
            text: qsTr("BLD")
        }

        SynopticTabButton {
            text: qsTr("FCS")
        }

        SynopticTabButton {
            text: qsTr("TEST")
        }
    }

    StackLayout {
        width: parent.width
        y: tab_bar.height

        currentIndex: tab_bar.currentIndex

        Item {
            id: stat_tab
        }
        
        EngTab {
            id: eng_tab
        }
    }
}
