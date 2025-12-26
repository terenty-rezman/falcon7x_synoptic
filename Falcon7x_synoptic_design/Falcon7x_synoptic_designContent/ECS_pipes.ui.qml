import QtQuick
import QtQuick.Controls
import Falcon7x_synoptic_design
import QtQuick.Studio.Components
import QtQuick.VectorImage
import "../../components/basic_components"

//import Falcon7x_synoptic_design 1.0
Item {
    id: self
    width: 346
    height: 308

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
    TriangleItem {
        id: triangle
        x: 127
        y: 201
        width: 17
        height: 17
        radius: 0
        fillColor: "#00ff00"
        strokeColor: "#00ff0000"
        strokeWidth: 0
    }

    TriangleItem {
        id: triangle1
        x: 323
        y: 201
        width: 17
        height: 17
        radius: 0
        strokeWidth: 0
        strokeColor: "#00ff0000"
        fillColor: "#00ff00"
    }

    TriangleItem {
        id: triangle2
        x: 295
        y: 188
        width: 17
        height: 17
        radius: 0
        rotation: 90
        strokeWidth: 0
        strokeColor: "#00ff0000"
        fillColor: "#00ff00"
    }

    TriangleItem {
        id: triangle3
        x: 161
        y: 230
        width: 17
        height: 17
        radius: 0
        strokeWidth: 0
        strokeColor: "#00ff0000"
        rotation: 90
        fillColor: "#00ff00"
    }

    TriangleItem {
        id: triangle4
        x: 157
        y: 188
        width: 17
        height: 17
        radius: 0
        strokeWidth: 0
        strokeColor: "#00ff0000"
        rotation: -90
        fillColor: "#00ff00"
    }

    TriangleItem {
        id: triangle5
        x: 289
        y: 230
        width: 17
        height: 17
        radius: 0
        strokeWidth: 0
        strokeColor: "#00ff0000"
        rotation: -90
        fillColor: "#00ff00"
    }

    ECS_temp_field_pipes {
        id: eCS_temp_field_pipes
        x: 302
        y: 25
    }

    ECS_temp_field_pipes {
        id: eCS_temp_field_pipes1
        x: 284
        y: 80
    }

    ECS_temp_field_pipes {
        id: eCS_temp_field_pipes2
        x: 114
        y: 114
    }

    Rectangle {
        id: rectangle
        x: 133
        y: 134
        width: 5
        height: 168
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle4
        x: 138
        y: 285
        width: 80
        height: 5
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Text {
        id: _text13
        x: 194
        y: 146
        color: "#a8b49e"
        text: qsTr("PAX")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Rectangle {
        id: rectangle14
        x: 250
        y: 285
        width: 79
        height: 5
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle15
        x: 329
        y: 45
        width: 5
        height: 257
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle9
        x: 138
        y: 194
        width: 191
        height: 5
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0

        Rectangle {
            id: rectangle1
            x: 41
            y: 24
            width: 109
            height: 40
            color: "#00ffffff"
            border.color: "#00ff00"
            border.width: 2
        }
    }

    Rectangle {
        id: rectangle10
        x: 138
        y: 134
        width: 31
        height: 5
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle11
        x: 298
        y: 101
        width: 31
        height: 5
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle12
        x: 298
        y: 45
        width: 31
        height: 5
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle13
        x: 138
        y: 236
        width: 41
        height: 5
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle16
        x: 288
        y: 236
        width: 41
        height: 5
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }
}
