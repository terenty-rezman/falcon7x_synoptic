

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

Item {
    id: rectangle
    width: 340
    height: 382

    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: false
    //     source: "images/PDU/PDU_part.jpg"
    //     fillMode: Image.PreserveAspectFit
    // }
    ZoneText {
        id: fuel_fu1
        objectName: "fuel_fu1"
        x: 98
        y: 125

        anchors.right: fq1_anch.left
        anchors.rightMargin: 4

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
        x: 98
        y: 125

        anchors.right: fq2_anch.left
        anchors.rightMargin: 4

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
        x: 98
        y: 117
        height: 35

        anchors.right: fq3_anch.left
        anchors.rightMargin: 4

        property int value: 0

        state: fuel_fq3.state

        value_zones: [0, 250 / 2.2]
        state_zones: ["yellow", "green"]

        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter

        text: (value * 2.20400).toFixed(0)
    }

    Item {
        id: fq1_anch
        x: 112
        y: 146
        height: 20
        width: 3
    }

    ZoneText {
        id: fuel_fq1
        objectName: "fuel_fq1"
        x: 97
        y: 145
        anchors.right: fq1_anch.left

        text: (value * 2.20400).toFixed(0)

        value_zones: [0, 250 / 2.2]
        state_zones: ["yellow", "green"]

        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }

    Item {
        id: fq2_anch
        x: 216
        y: 146
        height: 20
        width: 2
    }

    ZoneText {
        id: fuel_fq2
        objectName: "fuel_fq2"
        x: 135
        y: 145
        anchors.right: fq2_anch.left

        text: (value * 2.20400).toFixed(0)

        value_zones: [0, 250 / 2.2]
        state_zones: ["yellow", "green"]

        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }

    Item {
        id: fq3_anch
        x: 319
        y: 146
        height: 20
        width: 2
    }

    ZoneText {
        id: fuel_fq3
        objectName: "fuel_fq3"
        x: 135
        y: 145
        anchors.right: fq3_anch.left

        text: (value * 2.20400).toFixed(0)

        value_zones: [0, 250 / 2.2]
        state_zones: ["yellow", "green"]

        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }

    MappedValueText {
        objectName: "eng_ff_1"

        precision: 0
        map_args: [0, 1]
        map_vals: [0, 7936]

        y: 5

        anchors.right: fq1_anch.left
        anchors.rightMargin: 4
        horizontalAlignment: Text.AlignRight

        font.pixelSize: 16
        font.bold: false
    }

    MappedValueText {
        objectName: "eng_ff_2"

        precision: 0
        map_args: [0, 1]
        map_vals: [0, 7936]

        y: 5

        anchors.right: fq2_anch.left
        anchors.rightMargin: 4

        font.pixelSize: 16
        font.bold: false
        horizontalAlignment: Text.AlignRight
    }

    MappedValueText {
        objectName: "eng_ff_3"

        precision: 0
        map_args: [0, 1]
        map_vals: [0, 7936]

        y: 5

        anchors.right: fq3_anch.left
        anchors.rightMargin: 4

        font.pixelSize: 16
        font.bold: false
        horizontalAlignment: Text.AlignRight
    }

    FCS_yaw_scale {
        objectName: "fcs_yaw_trim"
        id: fCS_yaw_scale
        x: 146
        y: 210
    }

    FCS_roll_scale {
        objectName: "fcs_roll_trim"
        id: fCS_roll_scale
        x: 20
        y: 210
    }

    FCS_pitch_scale {
        objectName: "fcs_pitch_trim"
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
        color: "#fff"
        text: qsTr("FF")
        font.letterSpacing: -0.3
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text18
        x: 6
        y: 45
        width: 36
        height: 17
        color: "#fff"
        text: qsTr("OIL")
        font.letterSpacing: 1
        font.pixelSize: 16
        horizontalAlignment: Text.AlignLeft
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
        color: "#fff"
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
        color: "#fff"
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
        color: "#fff"
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
        color: "#fff"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text16
        x: 319
        y: 147
        color: "#fff"
        text: qsTr("LB")
        font.pixelSize: 13
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text3
        x: 324
        y: 207
        color: "#fff"
        text: qsTr("P\nI\nT\nC\nH")
        font.letterSpacing: 1.3
        font.pixelSize: 18
        lineHeight: 0.65
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    EngOilPdu {
        objectName: "eng_oil1"
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
        color: "#fff"
        text: qsTr("PPH")
        font.letterSpacing: -0.3
        font.pixelSize: 10
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    EngOilPdu {
        objectName: "eng_oil2"
        x: 163
        y: 31
        width: 100
    }

    EngOilPdu {
        objectName: "eng_oil3"
        x: 268
        y: 31
        width: 100
    }

    Rectangle {
        id: rectangle1
        x: 1
        y: 120
        width: 339
        height: 1
        color: "#fff"
        border.width: 0
    }

    Rectangle {
        id: rectangle2
        x: 1
        y: 168
        width: 339
        height: 1
        color: "#fff"
        border.width: 0
    }

    Rectangle {
        id: rectangle3
        x: 1
        y: 337
        width: 339
        height: 1
        color: "#fff"
        border.width: 0
    }

    ApuN1T5Pdu {
        objectName: "eng_apun1t5"
        x: 0

        y: 347
    }

    BlueBorder{}

    AviaMenuArea { 
        menu: pages_menu

        AviaMenu {
            id: pages_menu

            AviaMenuItem {
                text: "ENG-TRM-FUEL"
            }

            AviaMenuItem {
                text: "RADIOS"
            }

            AviaMenuItem {
                text: "ATC DTLK"
            }

            AviaMenuItem {
                text: "SENSORS"
            }

            AviaMenuItem {
                text: "TRAFFIC"
            }
        }
    }
}
