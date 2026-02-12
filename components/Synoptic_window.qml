import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"
import "../Falcon7x_synoptic_design/Falcon7x_synoptic_designContent"

Rectangle {
    property alias currentIndex: tab_bar.currentIndex

    anchors.fill: parent 
    color: "#000"

    TabBar {
        id: tab_bar

        width: 1024 * 2 / 3

        background: Rectangle {
            color: "#000000"
            height: 20
            anchors.bottom: parent.bottom
        }

        SynopticTabButton {
            id: stat_button
            text: qsTr("STAT")

            BlueBorder{}
        }

        SynopticTabButton {
            text: qsTr("ENG")
            BlueBorder{}
        }

        SynopticTabButton {
            text: qsTr("ELEC")
            BlueBorder{}
        }

        SynopticTabButton {
            text: qsTr("FUEL")
            BlueBorder{}
        }

        SynopticTabButton {
            text: qsTr("HYD")
            BlueBorder{}
        }

        SynopticTabButton {
            text: qsTr("ECS")
            BlueBorder{}
        }

        SynopticTabButton {
            text: qsTr("BLD")
            BlueBorder{}
        }

        SynopticTabButton {
            text: qsTr("FCS")
            BlueBorder{}
        }

        SynopticTabButton {
            text: qsTr("TEST")
            BlueBorder{}
        }
    }

    StackLayout {
        width: parent.width
        y: tab_bar.height

        currentIndex: tab_bar.currentIndex

        StatTab {
            id: stat_tab
        }
        
        EngTab {
            id: eng_tab
        }

        ElecTab {

        }

        FuelTab {

        }

        HydTab {

        }

        ECSTab {

        }
        
        BleedTab {
            
        }

        FCSTab {

        }

        TestTab {}

    }

    SystemMenu {}

    BlueBorder {}

    MduAviaMenu {}
}
