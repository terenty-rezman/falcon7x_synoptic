

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
    //     source: "images/BLEED.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    Bleed_nacelles {
        id: bleed_nacelles
        x: 240
        y: 163
    }

    Bleed_wing {
        id: bleed_wing
        x: 417
        y: 4
    }

    Bleed_brake {
        id: bleed_brake
        x: 465
        y: 144
    }

    Bleed_valve {
        id: bleed_valve
        x: 164
        y: 82
    }

    Bleed_valve {
        id: bleed_valve1
        x: 364
        y: 82
    }

    Bleed_valve {
        id: bleed_valve2
        x: 14
        y: 194
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve3
        x: 14
        y: 258
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve4
        x: 134
        y: 239
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve5
        x: 193
        y: 239
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve6
        x: 281
        y: 167
    }
    Bleed_valve {
        id: bleed_valve7
        x: 313
        y: 193
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve8
        x: 313
        y: 258
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve9
        x: 422
        y: 204
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve10
        x: 508
        y: 239
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve11
        x: 627
        y: 258
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve12
        x: 627
        y: 194
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve13
        x: 500
        y: 114
        rotation: 90
    }

    Bleed_valve {
        id: bleed_valve14
        x: 478
        y: 50
        rotation: 90
    }

    Bleed_apu {
        id: bleed_apu
        x: 424
        y: 249
    }

    Bleed_pax {
        id: bleed_pax1
        x: 599
        y: 11
        height: 25
        text: "CREW"
    }

    Text {
        id: _text
        x: 282
        y: 275
        color: "#a8b49e"
        text: qsTr("HP2")
        font.letterSpacing: -1.1
        font.pixelSize: 17
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text1
        x: 285
        y: 227
        color: "#a8b49e"
        text: qsTr("LP2")
        font.letterSpacing: -1.2
        font.pixelSize: 17
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text4
        x: 282
        y: 275
        color: "#a8b49e"
        text: qsTr("HP2")
        font.letterSpacing: -1.1
        font.pixelSize: 17
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text5
        x: 599
        y: 277
        color: "#a8b49e"
        text: qsTr("HP3")
        font.letterSpacing: -1.1
        font.pixelSize: 17
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text2
        x: 601
        y: 225
        color: "#a8b49e"
        text: qsTr("LP3")
        font.letterSpacing: -1.2
        font.pixelSize: 17
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text3
        x: 44
        y: 225
        width: 31
        height: 23
        color: "#a8b49e"
        text: qsTr("LP1")
        font.letterSpacing: -1.4
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Sicret PERSONAL Light"
    }

    Text {
        id: _text7
        x: 51
        y: 279
        color: "#a8b49e"
        text: qsTr("HP1")
        font.letterSpacing: -0.1
        font.pixelSize: 22
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Sicret PERSONAL Light"
    }

    Text {
        id: _text8
        x: 160
        y: 119
        color: "#a8b49e"
        text: qsTr("XBLEED")
        font.letterSpacing: -0.2
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text9
        x: 361
        y: 119
        color: "#a8b49e"
        text: qsTr("XBLEED")
        font.letterSpacing: -0.2
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    Text {
        id: _text6
        x: 156
        y: 136
        width: 46
        height: 20
        color: "#555555"
        text: qsTr("1 ↔ 2")
        font.letterSpacing: -1.5
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Text {
        id: _text10
        x: 358
        y: 136
        width: 46
        height: 20
        color: "#a8b49e"
        text: qsTr("2 ↔ 3")
        font.letterSpacing: -1.6
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }

    Bleed_pax {
        id: bleed_pax
        x: 28
        y: 8
        text: "PAX"
    }

    Bleed_pipes {
        id: bleed_pipes
        x: 0
        y: 0

        Text {
            id: _text11
            x: 160
            y: 119
            color: "#555555"
            text: qsTr("XBLEED")
            font.letterSpacing: -1.2
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 0.9
            font.styleName: "Narrow Bold"
            font.family: "Arial"
        }

        Text {
            id: _text12
            x: 361
            y: 119
            color: "#555555"
            text: qsTr("XBLEED")
            font.letterSpacing: -1.2
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            lineHeight: 0.9
            font.styleName: "Narrow Bold"
            font.family: "Arial"
        }

        Bleed_inlet_1 {
            id: bleed_inlet_1
            x: 81
            y: 180
        }

        Bleed_inlet_3 {
            id: bleed_inlet_3
            x: 521
            y: 180
        }

        Bleed_inlet_2 {
            id: bleed_inlet_2
            x: 207
            y: 125
        }
    }

    Text {
        id: _text13
        x: 358
        y: 136
        width: 46
        height: 20
        color: "#555555"
        text: qsTr("2 ↔ 3")
        font.letterSpacing: -1.5
        font.pixelSize: 14
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }
}
