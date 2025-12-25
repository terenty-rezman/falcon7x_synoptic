import QtQuick
import QtQuick.Controls
import Falcon7x_synoptic_design
import QtQuick.Studio.Components
import QtQuick.VectorImage
import "../../components/basic_components"

//import Falcon7x_synoptic_design 1.0
Item {
    id: self
    width: 66
    height: 199

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
        x: 47
        y: 19
        width: 14
        height: 176
        color: "#00ffffff"
        border.color: "#00ff00"
        border.width: 2
    }

    Rectangle {
        id: rectangle1
        x: 47
        y: 0
        width: 14
        height: 21
        color: "#00ffffff"
        border.color: "#ffbf00"
        border.width: 2
    }

    Rectangle {
        id: rectangle2
        x: 45
        y: 18
        width: 18
        height: 3
        color: "#ffbf00"
        border.color: "#ffbf00"
        border.width: 0
    }

    TriangleItem {
        id: triangle
        x: 34
        y: 99
        width: 15
        height: 15
        radius: 0
        fillColor: "#00ff00"
        strokeWidth: 0
        rotation: 90

        Text {
            id: _text
            x: -16
            y: 24
            color: "#00ff00"
            text: qsTr("4.9")
            font.letterSpacing: 0.3
            font.pixelSize: 19
            rotation: -90
            font.styleName: "Полужирный"
            font.family: "Arial"
        }

        Text {
            id: _text1
            x: 6
            y: 25
            color: "#ffffff"
            text: qsTr("psi")
            font.letterSpacing: -0.1
            font.pixelSize: 19
            font.styleName: "Полужирный"
            font.family: "Arial"
            rotation: -90
        }
    }
}
