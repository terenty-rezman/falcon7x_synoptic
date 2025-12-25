import QtQuick
import QtQuick.Controls
import Falcon7x_synoptic_design
import QtQuick.Studio.Components
import QtQuick.VectorImage
import "../../components/basic_components"

//import Falcon7x_synoptic_design 1.0
Item {
    id: self
    width: 97
    height: 38

    // visible: true
    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     width: 684
    //     height: 342
    //     visible: true
    //     source: "images/ECS.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 97
        height: 38
        color: "#a8b49e"
        radius: 2
    }
    Rectangle {
        id: rectangle1
        x: 9
        y: 19
        width: 63
        height: 14
        color: "#000000"
        border.width: 0
    }
    Text {
        id: _text
        x: 7
        y: 3
        color: "#ffffff"
        text: qsTr("LDG ELEV")
        font.letterSpacing: -0.8
        font.pixelSize: 16
        font.family: "Arial"
    }
    Text {
        id: _text2
        x: 12
        y: 19
        width: 55
        height: 14
        color: "#00ff00"
        text: qsTr("220")
        font.letterSpacing: -0.2
        font.pixelSize: 17
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.weight: Font.Thin
        font.family: "SegoeUI"
    }
    Text {
        id: _text1
        x: 78
        y: 18
        color: "#ffffff"
        text: qsTr("ft")
        font.letterSpacing: 0.1
        font.pixelSize: 15
        font.family: "Arial"
    }
}
