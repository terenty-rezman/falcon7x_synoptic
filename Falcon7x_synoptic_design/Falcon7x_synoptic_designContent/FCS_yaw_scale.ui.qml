import QtQuick
import QtQuick.Studio.Components

Item {
    id: fcs_sfcc_num
    x: 0
    y: 0
    width: 80
    height: 80


    /*Image {
        id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
        x: -33
        y: -91
        visible: true
        source: "images/FCS.png"
        enabled: true
        fillMode: Image.PreserveAspectFit
    }*/
    Text {
        id: _text1
        x: 24
        y: 13
        color: "#555555"
        text: qsTr("YAW")
        font.letterSpacing: -0.3
        font.pixelSize: 19
        font.styleName: "Narrow"
        font.family: "Arial"
    }
    Text {
        id: _text
        x: -18
        y: 38
        width: 10
        height: 15
        color: "#555555"
        text: qsTr("L")
        font.pixelSize: 13
        font.family: "Arial"
    }

    Text {
        id: _text2
        x: 92
        y: 38
        color: "#555555"
        text: qsTr("R")
        font.letterSpacing: 0
        font.pixelSize: 13
        font.family: "Arial"
    }
    ArcItem {
        id: arc
        x: 0
        y: 3
        width: 80
        height: 80
        strokeColor: "#555555"
        rotation: 90
        fillColor: "#00000000"
        end: 180
    }
    TriangleItem {
        id: triangle
        x: 35
        y: 71
        width: 10
        height: 8
        radius: 0
        strokeColor: "#00ff0000"
        rotation: 180
        fillColor: "#00ff00"
    }

    Rectangle {
        id: rectangle2
        x: -8
        y: 43
        width: 11
        height: 3
        color: "#555555"
        border.color: "#00555555"
    }

    Rectangle {
        id: rectangle3
        x: 77
        y: 43
        width: 11
        height: 3
        color: "#555555"
        border.color: "#00555555"
    }

    Rectangle {
        id: rectangle4
        x: 35
        y: 83
        width: 10
        height: 3
        color: "#555555"
        border.color: "#00555555"
        rotation: 90
    }

    Rectangle {
        id: rectangle5
        x: 65
        y: 72
        width: 10
        height: 3
        color: "#555555"
        border.color: "#00555555"
        rotation: 45
    }

    Rectangle {
        id: rectangle6
        x: 5
        y: 72
        width: 10
        height: 3
        color: "#555555"
        border.color: "#00555555"
        rotation: -45
    }
}
