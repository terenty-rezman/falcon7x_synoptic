import QtQuick 2.15

Item {
    id: self

    property int mode: 0
    property int target_alt_ft: 2000 

    property string text_color: (mode != 0) ? "#00ffff" : "#ff66ff"

    width: 80
    height: 58

    Image {
        source: "../svg/ADI_ASEL.svg"

        width: 80
        height: 58
    }

    AdiMagentaText {
        id: text_
        text: "FL" + Math.round(self.target_alt_ft /  100);
        anchors.centerIn: parent
        color: self.text_color
        font.pixelSize: 20
        font.bold: true
        font.family: "Helvetica"
    }

    Item {
        anchors.horizontalCenter: parent.horizontalCenter
        y: -height / 2
        height: asel_text.height
        width: asel_text.width + 6

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
