

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

    Image {
        id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
        x: 0
        y: 0
        visible: true
        source: "images/ECS.png"
        enabled: true
        fillMode: Image.PreserveAspectFit
    }
    Rectangle {
        id: rectangle1
        x: 7
        y: 247
        width: 97
        height: 4
        color: "#a8b49e"
        border.width: 0
    }

    ECS_oxygen_status {
        id: eCS_oxygen_status
        x: 2
        y: 51
        text_state: 3

        Rectangle {
            id: rectangle2
            x: 102
            y: -45
            width: 4
            height: 335
            color: "#a8b49e"
            border.width: 0
        }
    }

    ECS_vol_qty {
        id: eCS_vol_qty
        x: 50
        y: 210
    }

    ECS_vol_qty {
        id: eCS_vol_qty1
        x: 48
        y: 166
        value: "3100"
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
        x: 8
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
        id: _text20
        x: 86
        y: 211
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
}
