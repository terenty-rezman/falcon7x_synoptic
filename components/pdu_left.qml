import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls.Material 

import "basic_components"
import "../Falcon7x_synoptic_design/Falcon7x_synoptic_designContent"

Item {
    objectName: "pdu_left"

    Rectangle {
        anchors.fill: parent
        color: "#545454"
    }

    SystemMenu {}

    Adi {
        x: 0
        y: 0
        side: "left"

        width: 0.6666 * 1024
        height: 768
    }

    Item {
        x: 0.6666 * 1024
        y: 0

        width: (1 / 3) * 1024
        height: (1 / 2) * 768

        CAS_window {
            x: 0
            y: 0
        }

        EngUnderCas {
            x: 0
            y: 768 / 4
        }

        BlueBorder {}
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
