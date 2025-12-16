

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Studio.Components

Item {
    id: self
    width: 124
    height: 187

    // visible: true
    // color: Constants.backgroundColor
    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/BLEED.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    Image {
        id: top_inlet
        x: 34
        y: 27
        width: 35
        height: 10
        source: "images/BLEED_ENG2_INLET_TOP_ON.svg"
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: engine
        x: 30
        y: 96
        width: 42
        height: 91
        source: "images/BLEED_ENGINE_ON.svg"
        fillMode: Image.PreserveAspectFit
    }
    Text {
        id: _top_text
        x: 17
        y: -2
        color: "#ffbf00"
        text: qsTr("LO\nPRESS")
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.bold: false
        font.family: "Arial"
        visible: true
    }

    property int state: 5

    states: [
        State {
            name: "bleed_Engine 2 anti-icing_command ON"
            when: self.state === 1

            PropertyChanges {
                target: top_inlet
                source: "images/BLEED_ENG2_INLET_TOP_ON.svg"
            }
            PropertyChanges {
                target: _top_text
                visible: false
            }
        },
        State {
            name: "bleed_Engine_2_anti-icing_command_OFF"
            when: self.state === 2

            PropertyChanges {
                target: top_inlet
                source: "images/BLEED_ENG2_INLET_TOP_OFF.svg"
            }
            PropertyChanges {
                target: _top_text
                visible: false
            }
        },
        State {
            name: "bleed_Engine_2_anti-icing_command_ON_with_low_pressure"
            when: self.state === 3

            PropertyChanges {
                target: top_inlet
                source: "images/BLEED_ENG2_INLET_TOP_FAILURE.svg"
            }
            PropertyChanges {
                target: _top_text
                visible: true
                text: qsTr("LO\nPRESS")
            }
        },
        State {
            name: "bleed_Engine_2_anti-icing_command_ON_with_high_pressure"
            when: self.state === 4

            PropertyChanges {
                target: top_inlet
                source: "images/BLEED_ENG2_INLET_TOP_FAILURE.svg"
            }
            PropertyChanges {
                target: _top_text
                visible: true
                text: qsTr("HI\nPRESS")
            }
        },
        State {
            name: "bleed_Engine_2_anti-icing_command_ON_with_residual_pressure"
            when: self.state === 5

            PropertyChanges {
                target: top_inlet
                source: "images/BLEED_ENG2_INLET_TOP_FAILURE.svg"
            }
            PropertyChanges {
                target: _top_text
                visible: true
                text: qsTr("RESID\nPRESS")
            }
        }
    ]
}
