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

    SystemMenu{}

    Adi {
        x: 1024 * 1 / 3
        y: 0
        side: "right"

        width: 1024 * (2 / 3)
        height: 768
    }

    EngUnderCas {
        x: 0
        y: 768 / 4
    }

    CAS_window {
        x: 0
        y: 0
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
