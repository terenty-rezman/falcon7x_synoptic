import QtQuick
import QtQuick.Studio.Components

Item {
    id: fcs_sfcc_num
    x: 0
    y: 0
    width: 80
    height: 130


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
        id: _text2
        x: 58
        y: 27
        color: "#555555"
        text: qsTr("0")
        font.letterSpacing: 0
        font.pixelSize: 19
        font.family: "Arial"
    }
    TriangleItem {
        id: triangle
        x: 29
        y: 53
        width: 10
        height: 9
        radius: 0
        strokeColor: "#00ff0000"
        rotation: 90
        fillColor: "#00ff00"
    }

    Rectangle {
        id: rectangle3
        x: 34
        y: 22
        width: 11
        height: 2
        color: "#555555"
        border.color: "#00555555"
    }

    Text {
        id: _text3
        x: 58
        y: 56
        color: "#555555"
        text: qsTr("4")
        font.letterSpacing: 0
        font.pixelSize: 19
        font.family: "Arial"
    }

    Text {
        id: _text4
        x: 58
        y: 84
        color: "#555555"
        text: qsTr("8")
        font.letterSpacing: 0
        font.pixelSize: 19
        font.family: "Arial"
    }
    Rectangle {
        id: rectangle12
        x: 38
        y: 77
        width: 18
        height: 5
        color: "#00ff00"
        border.color: "#00555555"
    }
    Rectangle {
        id: rectangle4
        x: 34
        y: 121
        width: 11
        height: 2
        color: "#555555"
        border.color: "#00555555"
    }

    Rectangle {
        id: rectangle5
        x: -6
        y: 72
        width: 100
        height: 2
        color: "#555555"
        border.color: "#00555555"
        rotation: 90
    }

    Rectangle {
        id: rectangle6
        x: 45
        y: 36
        width: 10
        height: 2
        color: "#555555"
        border.color: "#00555555"
    }

    Rectangle {
        id: rectangle7
        x: 45
        y: 64
        width: 10
        height: 2
        color: "#555555"
        border.color: "#00555555"
    }

    Rectangle {
        id: rectangle8
        x: 45
        y: 93
        width: 10
        height: 2
        color: "#555555"
        border.color: "#00555555"
    }

    Rectangle {
        id: rectangle9
        x: 45
        y: 50
        width: 7
        height: 2
        color: "#555555"
        border.color: "#00555555"
    }

    Rectangle {
        id: rectangle10
        x: 45
        y: 78
        width: 7
        height: 2
        color: "#555555"
        border.color: "#00555555"
    }

    Rectangle {
        id: rectangle11
        x: 45
        y: 107
        width: 7
        height: 2
        color: "#555555"
        border.color: "#00555555"
    }

    Text {
        id: _text5
        x: 9
        y: 14
        color: "#555555"
        text: qsTr("NO")
        font.letterSpacing: -1.6
        font.pixelSize: 15
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text6
        x: 10
        y: 114
        color: "#555555"
        text: qsTr("NU")
        font.letterSpacing: -1.6
        font.pixelSize: 15
        font.styleName: "Narrow"
        font.family: "Arial"
    }
}
