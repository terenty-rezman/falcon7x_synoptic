

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Falcon7x_synoptic_design
import QtQuick.Studio.Components
import QtQuick.VectorImage
import "../../components/basic_components"
import "../../components"
import Falcon7x_synoptic_design 1.0

Rectangle {
    id: rectangle
    width: 340
    height: 382
    visible: true

    // color: Constants.backgroundColor
    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/PDU/PDU_part.jpg"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    Fuel_green_numbers {
        id: fuel_green_numbers6
        x: 68
        y: 9
    }

    Fuel_green_numbers {
        id: fuel_green_numbers7
        x: 171
        y: 9
    }

    Fuel_green_numbers {
        id: fuel_green_numbers8
        x: 275
        y: 9
    }

    Fuel_green_numbers {
        id: fuel_green_numbers
        x: 66
        y: 127
    }

    Fuel_green_numbers {
        id: fuel_green_numbers1
        x: 66
        y: 147
    }

    Fuel_green_numbers {
        id: fuel_green_numbers2
        x: 170
        y: 127
    }

    Fuel_green_numbers {
        id: fuel_green_numbers3
        x: 170
        y: 147
    }

    Fuel_green_numbers {
        id: fuel_green_numbers4
        x: 273
        y: 127
    }

    Fuel_green_numbers {
        id: fuel_green_numbers5
        x: 273
        y: 147
    }

    FCS_yaw_scale {
        id: fCS_yaw_scale
        x: 146
        y: 210
    }

    FCS_roll_scale {
        id: fCS_roll_scale
        x: 20
        y: 210
    }

    FCS_pitch_scale {
        id: fCS_pitch_scale
        x: 249
        y: 177
    }

    Text {
        id: _text17
        x: 7
        y: 10
        width: 19
        height: 17
        color: "#a8b49e"
        text: qsTr("FF")
        font.letterSpacing: -0.3
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    ECS_NORM_FL {
        id: eCS_NORM_FL
        x: 360
        y: -68
    }

    Text {
        id: _text18
        x: 1
        y: 45
        width: 36
        height: 17
        color: "#a8b49e"
        text: qsTr("OIL")
        font.letterSpacing: 1
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text19
        x: -2
        y: 128
        width: 36
        height: 17
        color: "#a8b49e"
        text: qsTr("FU")
        font.letterSpacing: -0.3
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text20
        x: -2
        y: 148
        width: 36
        height: 17
        color: "#a8b49e"
        text: qsTr("FQ")
        font.letterSpacing: -0.3
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text21
        x: 10
        y: 174
        width: 36
        height: 17
        color: "#a8b49e"
        text: qsTr("TRIMS")
        font.letterSpacing: -0.3
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text15
        x: 319
        y: 128
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text16
        x: 319
        y: 147
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text3
        x: 324
        y: 207
        color: "#a8b49e"
        text: qsTr("P\nI\nT\nC\nH")
        font.letterSpacing: 1.3
        font.pixelSize: 18
        lineHeight: 0.65
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    EngOil {
        x: 61
        y: 31
        width: 100
    }

    Text {
        id: _text22
        x: 319
        y: 11
        width: 19
        height: 17
        color: "#a8b49e"
        text: qsTr("PPH")
        font.letterSpacing: -0.3
        font.pixelSize: 10
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }
    EngOil {
        x: 163
        y: 31
        width: 100
    }
    EngOil {
        x: 268
        y: 31
        width: 100
    }

    Rectangle {
        id: rectangle1
        x: 1
        y: 120
        width: 339
        height: 4
        color: "#a8b49e"
        border.width: 0
    }

    Rectangle {
        id: rectangle2
        x: 1
        y: 168
        width: 339
        height: 4
        color: "#a8b49e"
        border.width: 0
    }

    Rectangle {
        id: rectangle3
        x: 1
        y: 337
        width: 339
        height: 4
        color: "#a8b49e"
        border.width: 0
    }
}
