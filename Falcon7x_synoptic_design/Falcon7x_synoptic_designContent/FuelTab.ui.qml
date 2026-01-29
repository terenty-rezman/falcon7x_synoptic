

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
import QtQuick.Controls.Material 

import "../../components/basic_components"

Rectangle {
    id: rectangle
    width: 684
    height: 342
    visible: true

    color: Constants.backgroundColor

    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/FUEL_F8X.jpg"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    Fuel_pipes {
        id: _item
        height: 342
        width: 684
        x: 0
        y: 0
    }

    Fuel_wing_tank {
        id: fuel_wing_tank

        objectName: "fuel_tank1"
        x: 14
        y: 8
        width: 103
        height: 46

        max_fuel_weight: 5106 // kg
    }

    Fuel_Pump {
        objectName: "fuel_boost1"
        id: fuel_Pump
        x: 94
        y: 167
    }

    Fuel_Pump {
        objectName: "fuel_boost2"
        id: fuel_Pump2
        x: 319
        y: 167
    }

    Fuel_Pump {
        objectName: "fuel_boost3"
        id: fuel_Pump1
        x: 547
        y: 167
    }

    Fuel_valve {
        objectName: "fuel_xtk_13"
        id: fuel_valve
        x: 321
        y: 13

        text: "X-TK"
        arrows_visible: true
        text_above: true
    }

    Fuel_valve {
        objectName: "fuel_xtk_23"
        id: fuel_valve1
        x: 442
        y: 33

        text: "X-TK"
        arrows_visible: true
        text_above: false
    }

    Fuel_valve {
        objectName: "fuel_xtk_12"
        id: fuel_valve2
        x: 204
        y: 33

        text: "X-TK"
        arrows_visible: true
        text_above: false
    }

    Fuel_valve {
        objectName: "fuel_xbp_12"
        id: fuel_valve3
        x: 196
        y: 211

        text: "X-BP"
        arrows_visible: false
        text_above: true
    }

    Fuel_valve {
        objectName: "fuel_xbp_13"
        id: fuel_valve4
        x: 321
        y: 305

        text: "X-BP"
        arrows_visible: false
        text_above: true
    }

    Fuel_valve {
        objectName: "fuel_xbp_23"
        id: fuel_valve5
        x: 448
        y: 211

        text: "X-BP"
        arrows_visible: false
        text_above: true
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
        verticalAlignment: Text.AlignVCenter
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
        objectName: "fuel_level_t1"
        x: 120
        y: 5
        color: "#b7c2b1"
        text: qsTr("LEVEL")
        font.letterSpacing: 5.3
        font.pixelSize: 18
        font.weight: Font.Bold
        font.family: "Arial"

        property int fuel_weight: 1000

        visible: (fuel_weight * 2.20400) < 1001
    }

    Text {
        id: _text12
        objectName: "fuel_level_t3"
        x: 474
        y: 5
        color: "#b7c2b1"
        text: qsTr("LEVEL")
        font.letterSpacing: 5.3
        font.pixelSize: 18
        font.weight: Font.Bold
        font.family: "Arial"

        property int fuel_weight: 1000

        visible: (fuel_weight * 2.20400) < 1001
    }

    Text {
        id: _text13
        objectName: "fuel_level_t2"
        x: 359
        y: 53
        color: "#b7c2b1"
        text: qsTr("L\nE\nV\nE\nL")
        font.letterSpacing: 4.8
        font.pixelSize: 18
        lineHeight: 0.85
        font.weight: Font.Bold
        font.family: "Arial"

        property int fuel_weight: 1000

        visible: (fuel_weight * 2.20400) < 1000
    }

    Fuel_green_numbers {
        id: fuel_green_numbers
        objectName: "fuel_fq"
        x: 199
        y: 81

        property int value: 0

        text: (value * 2.20400).toFixed(0)
    }

    Fuel_green_numbers {
        id: fuel_green_numbers1

        objectName: "fuel_fr"

        x: 199
        y: 103

        property int value: 0

        text: (value * 2.20400).toFixed(0)
    }

    Fuel_green_numbers {
        id: fuel_green_numbers2
        objectName: "fuel_fu"

        x: 199
        y: 122

        property int value: 0

        text: (value * 2.20400).toFixed(0)
    }

    Fuel_green_numbers {
        id: fuel_green_numbers3
        objectName: "fuel_dsty"
        x: 217
        y: 143

        property int value: 0

        text: (value * 2.20400).toFixed(0)
    }

    ZoneText {
        id: fuel_fu1
        objectName: "fuel_fu1"
        x: 70
        y: 291

        anchors.right: fuel_fu1_lb.left

        property int value: 0

        state: fuel_fq1.state

        value_zones: [0, 250 / 2.2]
        state_zones: ["yellow", "green"]

        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter

        text: (value * 2.20400).toFixed(0)
    }

    ZoneText {
        id: fuel_fu2

        objectName: "fuel_fu2"

        x: 279
        y: 271

        anchors.right: fuel_fu2_lb.left

        property int value: 0

        state: fuel_fq2.state

        value_zones: [0, 250 / 2.2]
        state_zones: ["yellow", "green"]

        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter

        text: (value * 2.20400).toFixed(0)
    }

    ZoneText {
        id: fuel_fu3

        objectName: "fuel_fu3"

        x: 630
        y: 291

        anchors.right: fuel_fu3_lb.left

        property int value: 0

        state: fuel_fq3.state

        text: (value * 2.20400).toFixed(0)

        value_zones: [0, 250 / 2.2]
        state_zones: ["yellow", "green"]

        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }

    ZoneText {
        id: fuel_fq1
        objectName: "fuel_fq1"
        x: 58
        y: 119
        anchors.right: fuel_fq1_lb.left

        text: (value * 2.20400).toFixed(0)

        value_zones: [0, 250 / 2.2]
        state_zones: ["yellow", "green"]

        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }

    ZoneText {
        id: fuel_fq2
        objectName: "fuel_fq2"
        x: 448
        y: 119

        anchors.right: fuel_fq2_lb.left

        text: (value * 2.20400).toFixed(0)

        value_zones: [0, 250 / 2.2]
        state_zones: ["yellow", "green"]

        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }

    ZoneText {
        id: fuel_fq3
        objectName: "fuel_fq3"
        x: 638
        y: 121

        anchors.right: fuel_fq3_lb.left

        text: (value * 2.20400).toFixed(0)

        value_zones: [0, 250 / 2.2]
        state_zones: ["yellow", "green"]

        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
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
        id: fuel_fu2_lb
        x: 295
        y: 274
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: fuel_fq1_lb
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
        id: fuel_fu1_lb
        x: 86
        y: 294
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.weight: Font.Normal
        font.styleName: "Narrow"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: fuel_fu3_lb
        x: 645
        y: 294
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: fuel_fq3_lb
        x: 655
        y: 124
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Fuel_green_numbers {
        id: fuel_temp_indicator
        objectName: "fuel_temp"
        x: 451
        y: 144

        property int value: 0

        text: value.toFixed(0)
    }

    Text {
        id: unit
        x: 495
        y: 145
        width: 13.575
        height: 15
        color: "#a8b49e"
        text: qsTr("°C")
        font.pixelSize: 13
        font.family: "Arial"
    }

    Fuel_central_tank_level {
        id: fuel_central_tank_level

        objectName: "fuel_tank2"
        x: 320
        y: 56

        max_fuel_weight: 5708 // kg
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

    Text {
        id: fuel_fq2_lb
        x: 465
        y: 121
        color: "#828a7a"
        text: qsTr("LB")
        font.pixelSize: 13
        font.weight: Font.Normal
        font.styleName: "Narrow"
        font.family: "Arial"
        font.bold: false
    }

    Fuel_wing_tank {
        id: fuel_wing_tank1
        objectName: "fuel_tank3"
        x: 659
        y: 8
        width: 103
        height: 46
        scale: 1
        rotation: 0

        max_fuel_weight: 5125 // kg

        transform: Scale {
            origin.x: 0
            origin.y: 0
            xScale: -1
        }
    }
    Button_synoptic {
        id: c_b_button
        x: 595
        y: 167
        width: 66
        height: 47
        text: qsTr("FU\nRESET")
    }
}
