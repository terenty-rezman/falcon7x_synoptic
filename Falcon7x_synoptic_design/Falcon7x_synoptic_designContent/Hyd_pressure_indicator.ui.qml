import QtQuick
import QtQuick.Studio.Components

Item {
    id: pressure_indicator
    width: 16
    height: 75

    Image {
        id: image
        x: 0
        y: 0
        width: 10
        height: 75
        source: "images/HYD.png"
        fillMode: Image.PreserveAspectFit
    }
    Rectangle {
        id: rectangle4
        x: 3
        y: 18
        width: 5
        height: 26
        color: "#73db0c"
        border.color: "#00000000"
        scale: 1
    }
    Rectangle {
        id: rectangle1
        x: 2
        y: 0
        width: 7
        height: 75
        color: "#00ffffff"
        border.color: "#ffffff"
        border.width: 1
        scale: 1
    }
    Rectangle {
        id: rectangle2
        x: 0
        y: 18
        width: 11
        height: 1
        color: "#c5b217"
        border.color: "#00000000"
        scale: 1
    }

    Rectangle {
        id: rectangle3
        x: 0
        y: 43
        width: 11
        height: 1
        color: "#c5b217"
        border.color: "#00000000"
        scale: 1
    }

    TriangleItem {
        id: triangle
        x: 9
        y: 30
        width: 7
        height: 7
        radius: 0
        rotation: -90
        fillColor: "#73db0c"
        strokeColor: "#00ff0000"
    }
    Text {
        id: _text10
        x: -9
        y: 79
        height: 15
        color: "#00ff00"
        text: qsTr("2900")
        font.letterSpacing: -0.1
        font.pixelSize: 12
        font.family: "Arial"
    }
    Text {
        id: _text11
        x: -5
        y: 91
        width: 26
        height: 15
        color: "#a8b49e"
        text: qsTr("PSI")
        font.letterSpacing: 0.1
        font.pixelSize: 12
        font.family: "Arial"
    }
}
