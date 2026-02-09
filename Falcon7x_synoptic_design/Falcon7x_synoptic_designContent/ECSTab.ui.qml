

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
import Falcon7x_synoptic_design 1.0

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
    //     source: "images/ECS.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    ECS_landing_field_elev {
        id: eCS_landing_field_elev
        x: 457
        y: 40
    }

    ECS_NORM_FL {
        id: eCS_NORM_FL
        x: 368
        y: 41
    }

    ECS_cabin_scale {
        id: eCS_cabin_scale
        x: 362
        y: 94
    }

    ECS_valve {
        id: eCS_valve
        x: 217
        y: 266
    }

    ECS_low_cabin_rate_sel {
        id: eCS_low_cabin_rate_sel
        x: 584
        y: 40
    }
    Rectangle {
        id: rectangle1
        x: 7
        y: 248
        width: 97
        height: 2
        color: "#a8b49e"
        border.width: 0
    }

    ECS_oxygen_status {
        id: eCS_oxygen_status
        x: 2
        y: 51
        text_state: 3
    }
    Rectangle {
        id: rectangle2
        x: 105
        y: 6
        width: 2
        height: 335
        color: "#a8b49e"
        border.width: 0
    }

    ECS_vol_qty {
        id: eCS_vol_qty
        objectName: "ecs_o2_volume"
        property int o2_liter: 1200
        x: 51
        y: 209
        width: 37
        height: 19
        text: (o2_liter / 31).toFixed(0)
    }

    ECS_vol_qty {
        id: eCS_vol_qty1
        objectName: "ecs_o2_volume"
        property int o2_liter: 0

        x: 48
        y: 166
        width: 43
        height: 19
        text: o2_liter
    }

    Text {
        id: _text9
        x: 598
        y: 310
        color: "#a8b49e"
        text: qsTr("RATE")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text10
        x: 479
        y: 310
        color: "#a8b49e"
        text: qsTr("ALTITUDE")
        font.letterSpacing: -0.4
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text11
        x: 372
        y: 310
        color: "#a8b49e"
        text: qsTr("△PCAB")
        font.letterSpacing: -0.7
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text12
        x: 297
        y: 310
        color: "#a8b49e"
        text: qsTr("CREW")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text13
        x: 247
        y: 310
        color: "#a8b49e"
        text: qsTr("ECS")
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
        x: 174
        y: 310
        color: "#a8b49e"
        text: qsTr("XBLEED")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text15
        x: 115
        y: 310
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
        id: _text16
        x: 12
        y: 13
        color: "#a8b49e"
        text: qsTr("OXYGEN")
        font.letterSpacing: -0.7
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text17
        x: 7
        y: 210
        color: "#a8b49e"
        text: qsTr("QTY:")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text18
        x: 400
        y: 10
        color: "#a8b49e"
        text: qsTr("PRESSURIZATION")
        font.letterSpacing: 0.4
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"

        ECS_pressure_status {
            id: eCS_pressure_status
            x: 184
            y: 0
            text_state: 1
        }
    }

    Text {
        id: _text19
        x: 95
        y: 166
        color: "#a8b49e"
        text: qsTr("l")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: qty_percent_text
        x: 89
        y: 209
        color: "#a8b49e"
        text: qsTr("%")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Rectangle {
        id: rectangle3
        x: 353
        y: 6
        width: 2
        height: 335
        color: "#a8b49e"
        border.width: 0
    }

    Text {
        id: _text21
        x: 1
        y: 291
        color: "#a8b49e"
        text: qsTr("HUMID:")
        font.letterSpacing: -0.3
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"

        ECS_humid_status {
            id: eCS_humid_status
            x: 58
            y: 0
            text_state: 1
        }
    }

    ECS_crew_and_pax_temp {
        id: eCS_crew_and_pax_temp
        x: 0
        y: 0

        ECS_pipes {
            id: eCS_pipes
            x: 0
            y: 1

            ECS_pack {
                id: eCS_pack
                x: 194
                y: 219
                text_state: 1
            }
        }
    }

    Text {
        id: _text22
        x: 7
        y: 166
        color: "#a8b49e"
        text: qsTr("VOL:")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    ECSAlt {
        objectName: "adi_alt"
        x: 485
        y: 95
        width: 67
        height: 197
        visible: true
    }

    ECSVerticalSpeed {
        x: 576
        y: 94
    }
}
