
import QtQuick 2.15

Item {
    id: self

    property int n1: 0
    property int t5: 0
    property int master_on: 0

    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: -344
    //     visible: true
    //     source: "../../Falcon7x_synoptic_design/Falcon7x_synoptic_designContent/images/PDU/PDU_part.jpg"
    //     fillMode: Image.PreserveAspectFit
    // }

    Text {
        x: 8
        y: 0
        text: "APU"
        color: "#FFFFFF"
        font.pixelSize: 18
        // font.bold: true
    }

    Text {
        x: 146
        y: 0
        width: 38
        height: 24
        text: self.n1
        color: "#00FC00"
        font.pixelSize: 18
        // font.bold: true
        horizontalAlignment: Text.AlignRight
        visible: self.master_on == 1
    }

    Text {
        x: 231
        y: 0
        text: " T5"
        color: "#FFFFFF"
        font.pixelSize: 18
        // font.bold: true
    }

    Text {
        x: 273
        y: 0
        width: 32
        text: self.t5
        color: "#00FC00"
        font.pixelSize: 18
        // font.bold: true
        horizontalAlignment: Text.AlignRight
        visible: self.master_on == 1
    }

    Text {
        x: 316
        y: 0
        text: "°C"
        color: "#FFFFFF"
        font.pixelSize: 18
        // font.bold: true
    }

    Text {
        x: 116
        y: 0
        color: "#ffffff"
        text: "N1"
        font.pixelSize: 18
    }

    Text {
        x: 190
        y: 0
        color: "#ffffff"
        text: "%"
        font.pixelSize: 18
    }
}
