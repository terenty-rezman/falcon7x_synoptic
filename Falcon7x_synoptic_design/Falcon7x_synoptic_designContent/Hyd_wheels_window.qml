import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components
import QtQuick.Controls.Material 

import "../../components/basic_components"

Item {
    id: self

    width: 305
    height: 146

    property int left_main_gear_psi_11_n: 7
    property int left_main_gear_psi_12_n: 169
    property int left_main_gear_C_11_n: 030
    property int left_main_gear_C_12_n: 035
    property int right_main_gear_psi_11_n: 168
    property int right_main_gear_psi_12_n: 171
    property int right_main_gear_C_11_n: 040
    property int right_main_gear_C_12_n: 035
    property int nose_gear_psi_11_n: 160
    property int nose_gear_psi_12_n: 164

    // Image {
    //     id: image
    //     x: 0
    //     y: 0
    //     width: 684
    //     height: 342
    //     source: "images/HYD_wheels.png"
    //     fillMode: Image.PreserveAspectFit
    // }
    function lead_zero(number) {
                    if (number < 100 && number >= 10) {
                        return "0" + number;
                    }
                    else if (number < 10){
                        return "00" + number;
                    }
                    else{
                        return number;
                    }
                }

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 305
        height: 146
        color: "#6e716b"
        radius: 8
        border.color: "#919a8a"
        border.width: 5
    }

    Button {
        id: button
        onClicked: self.visible = false
        x: 270
        y: 8
        width: 23
        height: 25
        text: qsTr("✕")
        rotation: 0
        rightPadding: 0
        leftPadding: 0
        bottomPadding: 0
        topPadding: 0
        bottomInset: 0
        topInset: 0
        font.pointSize: 13
        font.wordSpacing: 0
        font.styleName: "Обычный"
        font.family: "Arial"
        font.bold: false
        background: Rectangle {
            implicitWidth: 66
            implicitHeight: 57
            color: "#6b6b6b"
            border.color: "#9faea4"
            border.width: 1
            radius: 2
        }
    }
    Text {
        id: _text
        x: 111
        y: 15
        color: "#ffffff"
        text: qsTr("NOSE GEAR")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.family: "Arial"
        font.styleName: "Narrow Bold"
        font.bold: false
    }

    Text {
        id: _text1
        x: 9
        y: 75
        color: "#ffffff"
        text: qsTr("LEFT")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text2
        x: 52
        y: 75
        color: "#ffffff"
        text: qsTr("MAIN")
        font.letterSpacing: -0.2
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text3
        x: 96
        y: 75
        color: "#ffffff"
        text: qsTr("GEAR")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text4
        x: 169
        y: 75
        color: "#ffffff"
        text: qsTr("RIGHT")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text5
        x: 219
        y: 75
        color: "#ffffff"
        text: qsTr("MAIN")
        font.letterSpacing: -0.2
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text6
        x: 263
        y: 75
        color: "#ffffff"
        text: qsTr("GEAR")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text7
        x: 108
        y: 93
        color: "#ffffff"
        text: qsTr("PSI")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text8
        x: 275
        y: 93
        color: "#ffffff"
        text: qsTr("PSI")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text9
        x: 192
        y: 34
        color: "#ffffff"
        text: qsTr("PSI")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text10
        x: 110
        y: 110
        width: 17.7
        color: "#ffffff"
        text: qsTr("℃")
        font.letterSpacing: -0.3
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text11
        x: 277
        y: 110
        width: 17.7
        color: "#ffffff"
        text: qsTr("℃")
        font.letterSpacing: -0.3
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text12
        x: 43
        y: 93
        color: "#ffffff"
        text: qsTr("/")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text13
        x: 43
        y: 110
        color: "#ffffff"
        text: qsTr("/")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text14
        x: 210
        y: 93
        color: "#ffffff"
        text: qsTr("/")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text15
        x: 210
        y: 110
        color: "#ffffff"
        text: qsTr("/")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text16
        x: 147
        y: 34
        color: "#ffffff"
        text: qsTr("/")
        font.letterSpacing: -0.3
        font.pixelSize: 15
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: left_main_gear_psi_11
        x: 13
        y: 94
        color: "#ffffff"
        text: lead_zero(left_main_gear_psi_11_n)
        font.letterSpacing: 0.4
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: left_main_gear_psi_12
        x: 56
        y: 94
        color: "#ffffff"
        text: lead_zero(left_main_gear_psi_12_n)
        font.letterSpacing: 0.4
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: left_main_gear_C_11
        x: 13
        y: 111
        color: "#ffffff"
        text: lead_zero(left_main_gear_C_11_n)
        font.letterSpacing: 0.4
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }
    Text {
        id: left_main_gear_C_12
        x: 56
        y: 111
        color: "#ffffff"
        text: lead_zero(left_main_gear_C_12_n)
        font.letterSpacing: 0.4
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: right_main_gear_psi_11
        x: 177
        y: 94
        color: "#ffffff"
        text: lead_zero(right_main_gear_psi_11_n)
        font.letterSpacing: 0.4
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: right_main_gear_psi_12
        x: 227
        y: 94
        color: "#ffffff"
        text: lead_zero(right_main_gear_psi_12_n)
        font.letterSpacing: 0.4
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: right_main_gear_C_11
        x: 177
        y: 111
        color: "#ffffff"
        text: lead_zero(right_main_gear_C_11_n)
        font.letterSpacing: 0.4
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: right_main_gear_C_12
        x: 227
        y: 111
        color: "#ffffff"
        text: lead_zero(right_main_gear_C_12_n)
        font.letterSpacing: 0.4
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: nose_gear_psi_11
        x: 114
        y: 34
        color: "#ffffff"
        text: lead_zero(nose_gear_psi_11_n)
        font.letterSpacing: 0.4
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: nose_gear_psi_12
        x: 160
        y: 34
        color: "#ffffff"
        text: lead_zero(nose_gear_psi_12_n)
        font.letterSpacing: 0.4
        font.pixelSize: 14
        font.styleName: "Narrow Bold"
        font.family: "Arial"
        font.bold: false
    }
}
