

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

Rectangle {
    id: rectangle
    width: 684
    height: 342
    visible: true

    color: Constants.backgroundColor

    Image {
        id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
        x: 0
        y: 0
        visible: false
        source: "images/FUEL_F8X.jpg"
        enabled: true
        fillMode: Image.PreserveAspectFit
    }

    Fuel_pipes {
        id: _item
        height: 342
        width: 684
        x: 0
        y: 0
    }

    Fuel_Pump {
        id: fuel_Pump
        x: 94
        y: 167
    }

    Fuel_Pump {
        id: fuel_Pump1
        x: 547
        y: 167
    }

    Fuel_Pump {
        id: fuel_Pump2
        x: 319
        y: 167
    }

    Fuel_valve {
        id: fuel_valve
        x: 321
        y: 13
        width: 30
        height: 30
        source: "images/FUEL_VALVE_CLOSED_31_31.svg"
    }

    Fuel_valve {
        id: fuel_valve1
        x: 442
        y: 33
    }

    Fuel_valve {
        id: fuel_valve2
        x: 204
        y: 33
    }

    Fuel_valve {
        id: fuel_valve3
        x: 196
        y: 211
    }

    Fuel_valve {
        id: fuel_valve4
        x: 321
        y: 305
    }

    Fuel_valve {
        id: fuel_valve5
        x: 448
        y: 211
    }

    Text {
        id: _text
        x: 163
        y: 81
        color: "#a8b49e"
        text: qsTr("FQ:")
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.styleName: "Полужирный"
        font.family: "Arial"
        font.weight: Font.Medium
    }

    Text {
        id: _text1
        x: 163
        y: 103
        color: "#a8b49e"
        text: qsTr("FR:")
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: _text2
        x: 163
        y: 122
        color: "#a8b49e"
        text: qsTr("FU:")
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: _text3
        x: 163
        y: 143
        color: "#a8b49e"
        text: qsTr("DSTY:")
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Rectangle {
        id: rectangle1
        x: 33
        y: 87
        width: 46
        height: 23
        color: "#95a291"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle2
        x: 424
        y: 87
        width: 46
        height: 23
        color: "#95a291"
        border.color: "#00000000"
    }

    Text {
        id: _text5
        x: 429
        y: 90
        color: "#ffffff"
        text: qsTr("FQ2")
        font.letterSpacing: 1.6
        font.pixelSize: 16
        font.family: "Arial"
    }

    Text {
        id: _text6
        x: 38
        y: 90
        color: "#ffffff"
        text: qsTr("FQ1")
        font.letterSpacing: 1.6
        font.pixelSize: 16
        font.family: "Arial"
    }

    Text {
        id: _text4
        x: 412
        y: 144
        color: "#a8b49e"
        text: qsTr("TEMP:")
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Rectangle {
        id: rectangle3
        x: 613
        y: 87
        width: 46
        height: 23
        color: "#95a291"
        border.color: "#00000000"
    }

    Text {
        id: _text7
        x: 618
        y: 90
        color: "#ffffff"
        text: qsTr("FQ3")
        font.letterSpacing: 1.6
        font.pixelSize: 16
        font.family: "Arial"
    }

    Text {
        id: _text9
        x: 208
        y: 271
        color: "#a8b49e"
        text: qsTr("FU2")
        font.letterSpacing: 0.4
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: _text10
        x: 46
        y: 271
        color: "#a8b49e"
        text: qsTr("FU1")
        font.letterSpacing: 0.4
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: _text11
        x: 605
        y: 271
        color: "#a8b49e"
        text: qsTr("FU3")
        font.letterSpacing: 0.4
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: _text8
        x: 120
        y: 5
        color: "#b7c2b1"
        text: qsTr("LEVEL")
        font.letterSpacing: 5.3
        font.pixelSize: 18
        font.weight: Font.Bold
        font.family: "Arial"
    }

    Text {
        id: _text12
        x: 477
        y: 5
        color: "#b7c2b1"
        text: qsTr("LEVEL")
        font.letterSpacing: 5.3
        font.pixelSize: 18
        font.weight: Font.Bold
        font.family: "Arial"
    }

    Text {
        id: _text13
        x: 359
        y: 57
        color: "#b7c2b1"
        text: qsTr("L\nE\nV\nE\nL")
        font.letterSpacing: 4.8
        font.pixelSize: 18
        lineHeight: 0.85
        font.weight: Font.Bold
        font.family: "Arial"
    }

    Fuel_green_numbers {
        id: fuel_green_numbers
        x: 199
        y: 81

        Fuel_green_numbers {
            id: fuel_green_numbers1
            x: 0
            y: 21
        }
    }

    Fuel_green_numbers {
        id: fuel_green_numbers2
        x: 199
        y: 122
    }

    Fuel_green_numbers {
        id: fuel_green_numbers3
        x: 216
        y: 144
    }

    Fuel_green_text_bigger {
        id: fuel_green_text_bigger
        x: 35
        y: 291
    }

    Fuel_green_text_bigger {
        id: fuel_green_text_bigger1
        x: 248
        y: 271
    }

    Fuel_green_text_bigger {
        id: fuel_green_text_bigger2
        x: 594
        y: 291
    }

    Fuel_green_text_bigger {
        id: fuel_green_text_bigger3
        x: 27
        y: 119
    }

    Fuel_green_text_bigger {
        id: fuel_green_text_bigger4
        x: 418
        y: 119
    }

    Fuel_green_text_bigger {
        id: fuel_green_text_bigger5
        x: 608
        y: 121
    }

    Text {
        id: _text14
        x: 244
        y: 84
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text15
        x: 244
        y: 104
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text16
        x: 244
        y: 124
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text17
        x: 295
        y: 275
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text18
        x: 75
        y: 121
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.weight: Font.Normal
        font.bold: false
        font.family: "Arial"
    }

    Text {
        id: _text19
        x: 86
        y: 295
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.weight: Font.Normal
        font.styleName: "Narrow"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text20
        x: 645
        y: 295
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text21
        x: 655
        y: 123
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Fuel_temp_indicator {
        id: fuel_temp_indicator
        x: 469
        y: 144
    }
    Fuel_central_tank_level {
        id: fuel_central_tank_level
        x: 320
        y: 81
    }
    Rectangle {
        id: rectangle6
        x: 320
        y: 140
        width: 32
        height: 1
        color: "#fbf704"
        border.color: "#00000000"
    }
    Rectangle {
        id: rectangle4
        x: 319
        y: 56
        width: 34
        height: 99
        color: "#00ffffff"
        border.color: "#ffffff"
        border.width: 2
    }
}
