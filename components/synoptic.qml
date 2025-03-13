import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"
import "../Falcon7x_synoptic_design/Falcon7x_synoptic_designContent"

Item {
    TabBar {
        id: tab_bar
        width: parent.width

        background: Rectangle {
            color: "#000000"
            height: 20
            anchors.bottom: parent.bottom
        }

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

        ElecTab {

        }
    }
}
