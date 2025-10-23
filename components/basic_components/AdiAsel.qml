import QtQuick 2.15

Rectangle {
    id: self

    property int mode: 0
    property int target_alt_ft: 2000 

    property string text_color: (mode != 0) ? "#00ffff" : "#ff66ff"

    color: "transparent"
    width: 80
    height: 55
    radius: 4
    border.color: "#55ffffff";
    border.width: 2

    AdiMagentaText {
        id: text_
        text: "FL" + Math.round(self.target_alt_ft /  100);
        anchors.centerIn: parent
        color: self.text_color
        font.pixelSize: 20
        font.bold: true
        font.family: "Helvetica"
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        y: -height / 2
        height: asel_text.height
        width: asel_text.width + 6
        color: "#5887f6"

        AdiMagentaText {
            id: asel_text
            text: "ASEL"
            anchors.centerIn: parent
            color: self.text_color
            font.pixelSize: 16
            font.bold: true
            font.family: "Helvetica"
        }
    }
}
