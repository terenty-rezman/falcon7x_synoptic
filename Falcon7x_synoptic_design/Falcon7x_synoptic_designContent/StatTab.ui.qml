

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
import QtQuick.Layouts
import "../../components/basic_components"
import Falcon7x_synoptic_design 1.0

Rectangle {
    id: rectangle
    width: 684
    height: 342
    visible: true
    color: "black"

    // Image {
    //     id: im2
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/STAT/stat_h.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    //     opacity: 1
    // }
    Rectangle {
        id: rectangle1
        x: 259
        y: 109
        width: 425
        height: 2
        color: "#ffffff"
        border.color: "#ffffff"
        border.width: 0
    }
    TabBar {
        id: tab_bar
        x: 3
        y: 71

        background: Rectangle {
            color: "#000000"
            height: 20
            width: 0

            // anchors.bottom: parent.bottom
        }
        SynopticTabButton {
            id: stat_button
            text: qsTr("OPS")
            height: 24
            width: 127

            BlueBorder {}
        }

        SynopticTabButton {
            text: qsTr("FAULT")
            height: 24
            width: 127
            BlueBorder {}
        }
    }

    StackLayout {
        y: 109
        width: parent.width
        height: 233

        currentIndex: tab_bar.currentIndex

        Item {
            id: stat_tab
        }

        Item {
            id: eng_tab
        }
    }

    Text {
        id: _text
        x: 54
        y: 6
        color: "#ffffff"
        text: qsTr("HYDA")
        font.letterSpacing: -1.4
        font.pixelSize: 20
        font.styleName: "Narrow Bold"
        font.family: "Arial"
    }

    Text {
        id: _text1
        x: 120
        y: 6
        color: "#ffffff"
        text: qsTr("HYDB")
        font.letterSpacing: -1.4
        font.pixelSize: 20
        font.styleName: "Narrow Bold"
        font.family: "Arial"
    }

    Text {
        id: _text2
        x: 186
        y: 6
        color: "#ffffff"
        text: qsTr("HYDC")
        font.letterSpacing: -1.4
        font.pixelSize: 20
        font.styleName: "Narrow Bold"
        font.family: "Arial"
    }

    Text {
        id: _text3
        x: 6
        y: 31
        color: "#ffffff"
        text: qsTr("QTY")
        font.letterSpacing: -1.1
        font.pixelSize: 20
        font.styleName: "Narrow Bold"
        font.family: "Arial"
    }

    Text {
        id: _text4
        x: 6
        y: 55
        color: "#ffffff"
        text: qsTr("PRS")
        font.letterSpacing: -1.1
        font.pixelSize: 20
        font.styleName: "Narrow Bold"
        font.family: "Arial"
    }

    Text {
        id: _text5
        x: 228
        y: 35
        color: "#ffffff"
        text: qsTr("%")
        font.letterSpacing: -1.1
        font.pixelSize: 14
        font.styleName: "Полужирный"
        font.family: "Tahoma"
    }

    Text {
        id: _text6
        x: 229
        y: 59
        color: "#ffffff"
        text: qsTr("PSI")
        font.letterSpacing: -1.1
        font.pixelSize: 14
        font.styleName: "Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text7
        x: 279
        y: 30
        color: "#ffffff"
        text: qsTr("BAT  1")
        font.letterSpacing: -1
        font.pixelSize: 21
        font.styleName: "Narrow Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text8
        x: 278
        y: 55
        color: "#ffffff"
        text: qsTr("GEN  1")
        font.letterSpacing: -1.5
        font.pixelSize: 21
        font.styleName: "Narrow Bold"
        font.family: "Tahoma"

        Rectangle {
            id: rectangle2
            x: -19
            y: -55
            width: 2
            height: 110
            color: "#ffffff"
            border.color: "#ffffff"
            border.width: 0
        }

        Rectangle {
            id: rectangle3
            x: 292
            y: -56
            width: 2
            height: 110
            color: "#ffffff"
            border.color: "#ffffff"
            border.width: 0
        }

        Rectangle {
            id: rectangle4
            x: 403
            y: -56
            width: 3
            height: 110
            color: "#ffffff"
            border.color: "#ffffff"
            border.width: 0
            visible: false
        }

        Rectangle {
            id: rectangle6
            x: -19
            y: 54
            width: 2
            height: 233
            color: "#ffffff"
            border.color: "#ffffff"
            border.width: 0
        }

        Rectangle {
            id: rectangle8
            x: -278
            y: -56
            width: 2
            height: 343
            color: "#ffffff"
            border.color: "#ffffff"
            border.width: 0
            visible: false
        }
    }

    Text {
        id: _text9
        x: 278
        y: 81
        color: "#ffffff"
        text: qsTr("GEN  3")
        font.letterSpacing: -1.5
        font.pixelSize: 21
        font.styleName: "Narrow Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text10
        x: 269
        y: 6
        color: "#ffffff"
        text: qsTr("LH ESS")
        font.letterSpacing: 0.6
        font.pixelSize: 20
        font.styleName: "Narrow Bold"
        font.family: "Arial"
    }

    Text {
        id: _text11
        x: 424
        y: 6
        color: "#ffffff"
        text: qsTr("RH ESS")
        font.letterSpacing: 0.6
        font.pixelSize: 20
        font.styleName: "Narrow Bold"
        font.family: "Arial"
    }

    Text {
        id: _text12
        x: 435
        y: 30
        color: "#ffffff"
        text: qsTr("BAT  2")
        font.letterSpacing: -1
        font.pixelSize: 21
        font.styleName: "Narrow Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text13
        x: 433
        y: 57
        color: "#ffffff"
        text: qsTr("GEN  2")
        font.letterSpacing: -1.5
        font.pixelSize: 21
        font.styleName: "Narrow Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text14
        x: 579
        y: 6
        color: "#ffffff"
        text: qsTr("CAB ALT")
        font.letterSpacing: 0.2
        font.pixelSize: 20
        font.styleName: "Narrow Bold"
        font.family: "Arial"
    }

    Text {
        id: _text15
        x: 577
        y: 58
        color: "#ffffff"
        text: qsTr("OXY")
        font.letterSpacing: 0.2
        font.pixelSize: 20
        font.styleName: "Narrow Bold"
        font.family: "Arial"
    }

    Text {
        id: _text16
        x: 394
        y: 36
        color: "#ffffff"
        text: qsTr("A")
        font.letterSpacing: -1.1
        font.pixelSize: 14
        font.styleName: "Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text17
        x: 394
        y: 61
        color: "#ffffff"
        text: qsTr("A")
        font.letterSpacing: -1.1
        font.pixelSize: 14
        font.styleName: "Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text18
        x: 394
        y: 88
        color: "#ffffff"
        text: qsTr("A")
        font.letterSpacing: -1.1
        font.pixelSize: 14
        font.styleName: "Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text19
        x: 552
        y: 36
        color: "#ffffff"
        text: qsTr("A")
        font.letterSpacing: -1.1
        font.pixelSize: 14
        font.styleName: "Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text20
        x: 552
        y: 61
        color: "#ffffff"
        text: qsTr("A")
        font.letterSpacing: -1.1
        font.pixelSize: 14
        font.styleName: "Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text21
        x: 394
        y: 7
        color: "#ffffff"
        text: qsTr("v")
        font.letterSpacing: -1.1
        font.pixelSize: 17
        font.styleName: "Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text22
        x: 552
        y: 9
        color: "#ffffff"
        text: qsTr("v")
        font.letterSpacing: -1.1
        font.pixelSize: 17
        font.styleName: "Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text23
        x: 652
        y: 36
        color: "#ffffff"
        text: qsTr("FT")
        font.letterSpacing: -1.1
        font.pixelSize: 14
        font.styleName: "Bold"
        font.family: "Tahoma"
    }

    Text {
        id: _text24
        x: 652
        y: 88
        color: "#ffffff"
        text: qsTr("L")
        font.letterSpacing: -1.1
        font.pixelSize: 14
        font.styleName: "Bold"
        font.family: "Tahoma"
    }

    Rectangle {
        id: rectangle7
        x: 0
        y: 340
        width: 684
        height: 2
        color: "#ffffff"
        border.color: "#ffffff"
        border.width: 0
        visible: false
    }

    Stat_bat_amps {
        id: stat_bat_amps
        objectName: "elec_current_bat_1"
        x: 339
        y: 33
    }

    Stat_bat_amps {
        id: stat_bat_amps1
        objectName: "elec_current_bat_2"
        x: 496
        y: 33
    }

    Stat_gen_amps {
        id: stat_gen_amps
        objectName: "elec_current_gen_1"
        x: 339
        y: 58
    }

    Stat_gen_amps {
        id: stat_gen_amps1
        objectName: "elec_current_gen_3"
        x: 339
        y: 84
    }

    Stat_gen_amps {
        id: stat_gen_amps2
        objectName: "elec_current_gen_2"
        x: 496
        y: 59
    }

    Stat_bat_volt {
        id: stat_bat_volt
        objectName: "elec_left_voltage"
        x: 339
        y: 7
    }

    Stat_bat_volt {
        id: stat_bat_volt1
        objectName: "elec_right_voltage"
        x: 498
        y: 7
    }

    Stat_hyd_pressure {
        id: stat_hyd_pressure
        objectName: "hyd_psi_1"
        x: 50
        y: 57
    }

    Stat_hyd_pressure {
        id: stat_hyd_pressure1
        objectName: "hyd_psi_2"
        x: 115
        y: 57
    }

    Stat_hyd_pressure {
        id: stat_hyd_pressure2
        objectName: "hyd_psi_3"
        x: 179
        y: 57
    }

    Stat_hyd_qty {
        id: stat_hyd_qty
        objectName: "hyd_qty_1"
        x: 45
        y: 32
    }
    Stat_hyd_qty {
        id: stat_gen_amps4
        objectName: "hyd_qty_2"
        x: 112
        y: 32
    }
    Stat_hyd_qty {
        id: stat_gen_amps5
        objectName: "hyd_qty_3"
        x: 174
        y: 32
    }

    Text {
        id: stat_gen_amps6
        objectName: "ecs_cabin_alt"
        property int alt_ft: 1500
        x: 598
        y: 32
        color: "#00ff00"
        width: 51
        height: 22
        text: alt_ft
        font.pixelSize: 20
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.family: "Arial"
        rightPadding: 3
    }

    Text {
        id: stat_gen_amps7
        x: 598
        y: 84
        objectName: "ecs_o2_volume"
        property int o2_liter: 3100
        color: "#00ff00"
        width: 51
        height: 22
        text: o2_liter
        font.pixelSize: 20
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.family: "Arial"
        rightPadding: 3
    }
}
