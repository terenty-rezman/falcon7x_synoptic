import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"
import "../Falcon7x_synoptic_design/Falcon7x_synoptic_designContent"

Rectangle {
    anchors.fill: parent 
    color: "#000"

    Text {
        anchors.centerIn: parent
        color: "#aaa"
        text: "FLIGHT MGMT\nunder development"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    SystemMenu {}

    BlueBorder {}
    
    MduAviaMenu {}
}
