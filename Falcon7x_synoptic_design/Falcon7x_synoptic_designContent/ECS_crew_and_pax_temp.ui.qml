import QtQuick
import QtQuick.Controls
import Falcon7x_synoptic_design
import QtQuick.Studio.Components
import QtQuick.VectorImage
import "../../components/basic_components"

//import Falcon7x_synoptic_design 1.0
Item {
    id: self
    width: 316
    height: 190

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
        x: 158
        y: 60
        width: 3
        height: 124
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle1
        x: 158
        y: 57
        width: 45
        height: 3
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle2
        x: 265
        y: 57
        width: 45
        height: 3
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle3
        x: 282
        y: 113
        width: 25
        height: 3
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle4
        x: 161
        y: 113
        width: 25
        height: 3
        color: "#ffffff"
    }

    Rectangle {
        id: rectangle5
        x: 307
        y: 97
        width: 3
        height: 84
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle6
        x: 161
        y: 181
        width: 149
        height: 3
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle8
        x: 307
        y: 60
        width: 3
        height: 20
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle9
        x: 201
        y: 10
        width: 66
        height: 3
        color: "#ffffff"
        border.color: "#00000000"
        border.width: 0
    }

    Rectangle {
        id: rectangle10
        x: 149
        y: 41
        width: 35
        height: 3
        color: "#ffffff"
        rotation: -65
    }

    Rectangle {
        id: rectangle11
        x: 171
        y: 18
        width: 33
        height: 3
        color: "#ffffff"
        rotation: -30
    }

    Rectangle {
        id: rectangle12
        x: 284
        y: 41
        width: 35
        height: 3
        color: "#ffffff"
        rotation: 65
    }

    Rectangle {
        id: rectangle13
        x: 264
        y: 18
        width: 33
        height: 3
        color: "#ffffff"
        rotation: 30
    }

    ECS_remote {
        id: eCS_remote
        x: 186
        y: 100
    }

    ECS_temp_status {
        id: eCS_temp_status
        x: 236
        y: 24
    }

    ECS_temp_status {
        id: eCS_temp_status1
        x: 241
        y: 62
    }

    ECS_temp_status {
        id: eCS_temp_status2
        x: 230
        y: 146
        text_state: 3
    }

    ECS_temp_field {
        id: eCS_temp_field1
        x: 211
        y: 128
    }

    Text {
        id: _text12
        x: 183
        y: 24
        color: "#a8b49e"
        text: qsTr("CREW")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"

        ECS_temp_field {
            id: eCS_temp_field3
            x: 28
            y: 17
        }
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

    Text {
        id: _text14
        x: 171
        y: 62
        color: "#a8b49e"
        text: qsTr("GALLEY")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"

        ECS_temp_field {
            id: eCS_temp_field2
            x: 40
            y: 19
        }
    }
}
