
import QtQuick 2.15

Item {
    id: apu_n1

    property int n1: 0
    property int t5: 0

    Text {
        text: "APU N1"
        color: "#FFFFFF"
        font.pixelSize: 18
        // font.bold: true
    }

    Text {
        x: 65
        width: 27
        text: apu_n1.n1
        color: "#00FC00"
        font.pixelSize: 18
        // font.bold: true
        horizontalAlignment: Text.AlignRight
    }

    Text {
        x: 95
        text: "% T5"
        color: "#FFFFFF"
        font.pixelSize: 18
        // font.bold: true
    }

    Text {
        x: 139
        width: 32
        text: apu_n1.t5
        color: "#00FC00"
        font.pixelSize: 18
        // font.bold: true
        horizontalAlignment: Text.AlignRight
    }

    Text {
        x: 177
        text: "°C"
        color: "#FFFFFF"
        font.pixelSize: 18
        // font.bold: true
    }
}
