

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
    width: 72
    height: 132

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
    Text {
        id: _text1
        x: 16
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
    Image {
        id: inlet
        x: 4
        y: 33
        source: "images/BLEED_ENG_1_3_INLET_FAILURE.svg"
        width: 34
        height: 7
    }

    Image {
        id: engine
        x: 0
        y: 41
        width: 42
        height: 91
        source: "images/BLEED_ENGINE_OFF.svg"
        fillMode: Image.PreserveAspectFit
    }
    property int state: 6

    states: [
        State {
            name: "bleed_Engine_anti-icing_command_ON"
            when: self.state === 1

            PropertyChanges {
                target: inlet
                source: "images/BLEED_ENG_1_3_INLET_ON.svg"
            }
            PropertyChanges {
                target: engine
                source: "images/BLEED_ENGINE_ON.svg"
            }
            PropertyChanges {
                target: _text1
                visible: false
            }
        },
        State {
            name: "bleed_Engine_anti-icing_command_OFF"
            when: self.state === 2

            PropertyChanges {
                target: inlet
                source: "images/BLEED_ENG_1_3_INLET_OFF.svg"
            }
            PropertyChanges {
                target: engine
                source: "images/BLEED_ENGINE_ON.svg"
            }
            PropertyChanges {
                target: _text1
                visible: false
            }
        },
        State {
            name: "bleed_Engine_stopped"
            when: self.state === 3

            PropertyChanges {
                target: inlet
                source: "images/BLEED_ENG_1_3_INLET_OFF.svg"
            }
            PropertyChanges {
                target: engine
                source: "images/BLEED_ENGINE_OFF.svg"
            }
            PropertyChanges {
                target: _text1
                visible: false
            }
        },
        State {
            name: "bleed_LOW_PRESSURE_Engine_anti-icing_command"
            when: self.state === 4

            PropertyChanges {
                target: inlet
                source: "images/BLEED_ENG_1_3_INLET_FAILURE.svg"
            }
            PropertyChanges {
                target: engine
                source: "images/BLEED_ENGINE_ON.svg"
            }
            PropertyChanges {
                target: _text1
                visible: true
                text: qsTr("LO\nPRESS")
            }
        },
        State {
            name: "bleed_High_PRESSURE_Engine_anti-icing_command"
            when: self.state === 5

            PropertyChanges {
                target: inlet
                source: "images/BLEED_ENG_1_3_INLET_FAILURE.svg"
            }
            PropertyChanges {
                target: engine
                source: "images/BLEED_ENGINE_ON.svg"
            }
            PropertyChanges {
                target: _text1
                visible: true
                text: qsTr("HI\nPRESS")
            }
        },
        State {
            name: "bleed_RESIDUAL_PRESSURE_Engine_anti-icing_command"
            when: self.state === 6

            PropertyChanges {
                target: inlet
                source: "images/BLEED_ENG_1_3_INLET_FAILURE.svg"
            }
            PropertyChanges {
                target: engine
                source: "images/BLEED_ENGINE_ON.svg"
            }
            PropertyChanges {
                target: _text1
                visible: true
                text: qsTr("RESID\nPRESS")
            }
        }
    ]
}
