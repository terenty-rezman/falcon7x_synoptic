import QtQuick 2.15
import QtQuick.Controls.Material 

import "../js/helpers.mjs" as Helpers

MenuItem {
    id: control
    text: "INAV"
    width: 120

    background: Rectangle {
        color: control.pressed ? "#00ff00" :"#00cccc"
        anchors.fill: parent
        border.width: 2
        border.color: "#009999"

        BlueBorder { cyan_color: "#fff" }
    }

    contentItem: Text {
        anchors.fill: parent
        text: parent.text
        color: "#fff"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 18
        font.bold: true
        font.family: "Helvetica"
    }
}
