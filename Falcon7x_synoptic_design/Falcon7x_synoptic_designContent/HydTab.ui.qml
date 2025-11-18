

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

    //color: Constants.backgroundColor
    Image {
        id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
        x: 0
        y: 0
        visible: true
        source: "images/HYD.png"
        enabled: true
        fillMode: Image.PreserveAspectFit

        Text {
            id: _text6
            x: 620
            y: 293
            width: 55
            height: 20
            color: "#a8b49e"
            text: qsTr("EBHA")
            font.letterSpacing: -0.7
            font.pixelSize: 20
            font.family: "Arial"
        }

        Text {
            id: _text7
            x: 637
            y: 194
            width: 26
            height: 15
            color: "#a8b49e"
            text: qsTr("QTY")
            font.letterSpacing: 0.1
            font.pixelSize: 12
            font.family: "Arial"
        }

        Text {
            id: _text8
            x: 494
            y: 194
            width: 26
            height: 15
            color: "#a8b49e"
            text: qsTr("QTY")
            font.letterSpacing: 0.1
            font.pixelSize: 12
            font.family: "Arial"
        }

        Text {
            id: _text9
            x: 12
            y: 194
            width: 26
            height: 15
            color: "#a8b49e"
            text: qsTr("QTY")
            font.letterSpacing: 0.1
            font.pixelSize: 12
            font.family: "Arial"
        }
    }
    Hyd_temp_indicator {
        id: hyd_temp_indicator2
        x: 598
        y: 49
    }

    Hyd_pump {
        id: hyd_pump6
        x: 591
        y: 291
        width: 26
        height: 26
    }
    Hyd_pump {
        id: hyd_pump1
        x: 350
        y: 39
    }

    Hyd_pump {
        id: hyd_pump2
        x: 432
        y: 39
    }

    Hyd_pump {
        id: hyd_pump3
        x: 552
        y: 39
    }

    Hyd_pump {
        id: hyd_pump4
        x: 119
        y: 39
    }

    Hyd_pump {
        id: hyd_pump5
        x: 38
        y: 39
    }

    Hyd_Hydraulic_level_indicator {
        id: hyd_Hydraulic_level_indicator
        x: 639
        y: 117
    }

    Hyd_Hydraulic_level_indicator {
        id: hyd_Hydraulic_level_indicator1
        x: 497
        y: 117
    }

    Hyd_Hydraulic_level_indicator {
        id: hyd_Hydraulic_level_indicator2
        x: 14
        y: 115
    }

    Hyd_pressure_indicator {
        id: hyd_pressure_indicator
        x: 468
        y: 115
    }

    Hyd_pressure_indicator {
        id: hyd_pressure_indicator1
        x: 611
        y: 115
    }

    Hyd_pressure_indicator {
        id: hyd_pressure_indicator2
        x: 57
        y: 114
    }

    Hyd_pump_status_text {
        id: hyd_pump_status_text
        x: 32
        y: 15

        Hyd_pipes {
            id: hyd_pipes
            x: -32
            y: -15
        }
    }

    Hyd_pump_status_text {
        id: hyd_pump_status_text1
        x: 114
        y: 15
    }

    Hyd_pump_status_text {
        id: hyd_pump_status_text2
        x: 344
        y: 15

        Hyd_temp_indicator {
            id: hyd_temp_indicator1
            x: 49
            y: 20
        }
    }

    Hyd_pump_status_text {
        id: hyd_pump_status_text3
        x: 426
        y: 15
    }

    Hyd_pump_status_text {
        id: hyd_pump_status_text4
        x: 544
        y: 15
    }

    Hyd_pump_status_text {
        id: hyd_pump_status_text5
        x: 279
        y: 15
        text: "AUTO"
    }

    Hyd_temp_indicator {
        id: hyd_temp_indicator
        x: 80
        y: 35
    }
    Hyd_pump {
        id: hyd_pump
        x: 286
        y: 39
    }

    Text {
        id: _text
        x: 21
        y: 71
        color: "#a8b49e"
        text: qsTr("A1")
        font.letterSpacing: 0.9
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: _text1
        x: 150
        y: 71
        color: "#a8b49e"
        text: qsTr("A3")
        font.letterSpacing: 0.9
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: _text2
        x: 333
        y: 71
        color: "#a8b49e"
        text: qsTr("B2")
        font.letterSpacing: 0.9
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: _text3
        x: 467
        y: 71
        color: "#a8b49e"
        text: qsTr("B3")
        font.letterSpacing: 0.9
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: _text4
        x: 584
        y: 71
        color: "#a8b49e"
        text: qsTr("C2")
        font.letterSpacing: 0.9
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }

    Text {
        id: _text5
        x: 247
        y: 47
        color: "#a8b49e"
        text: qsTr("B/U")
        font.letterSpacing: 0.2
        font.pixelSize: 19
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Полужирный"
        font.family: "Arial"
    }
}
