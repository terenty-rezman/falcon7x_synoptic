

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick

Item {
    id: self
    width: 156
    height: 92
    // visible: true

    //color: Constants.backgroundColor
    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/BLEED.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    Rectangle {
        id: bleed_pipe_1
        x: 75
        y: 21
        width: 6
        height: 25
        color: "#FFBF00"
        border.width: 0
    }

    Rectangle {
        id: bleed_pipe_2
        x: 65
        y: 15
        width: 26
        height: 6
        color: "#FFBF00"
    }

    Text {
        id: _text
        x: 106
        y: 63
        visible: true
        color: "#ffbf00"
        text: qsTr("LO\nPWR")
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
    }
    Image {
        id: bleed_wing
        x: 0
        y: 0
        source: "images/BLEED_WING_ON.svg"
        width: 156
        height: 59
    }
    property int wing_state: 5

    states: [
        State {
            name: "Bleed_wing_anti-icing_command_on_or_st-by"
            when: self.wing_state === 1

            PropertyChanges {
                target: bleed_pipe_1
                color: "#00ff00"
            }
            PropertyChanges {
                target: bleed_pipe_2
                color: "#00ff00"
            }
            PropertyChanges {
                target: bleed_wing
                source: "images/BLEED_WING_ON.svg"
            }
            PropertyChanges {
                target: _text
                visible: false
            }
        },
        State {
            name: "Bleed_wing_anti-icing_command_off"
            when: self.wing_state === 2

            PropertyChanges {
                target: bleed_pipe_1
                color: "#555555"
            }
            PropertyChanges {
                target: bleed_pipe_2
                color: "#555555"
            }
            PropertyChanges {
                target: bleed_wing
                source: "images/BLEED_WING_OFF.svg"
            }
            PropertyChanges {
                target: _text
                visible: false
            }
        },
        State {
            name: "Bleed_Wing_anti-icing_ON_with_valve_in_abnormal_position"
            when: self.wing_state === 3

            PropertyChanges {
                target: bleed_pipe_1
                color: "#FFBF00"
            }
            PropertyChanges {
                target: bleed_pipe_2
                color: "#FFBF00"
            }
            PropertyChanges {
                target: bleed_wing
                source: "images/BLEED_WING_FAILURE.svg"
            }
            PropertyChanges {
                target: _text
                visible: false
            }
        },
        State {
            name: "Bleed_Wing_anti-icing_command_ON_and_low_power"
            when: self.wing_state === 4

            PropertyChanges {
                target: bleed_pipe_1
                color: "#FFBF00"
            }
            PropertyChanges {
                target: bleed_pipe_2
                color: "#FFBF00"
            }
            PropertyChanges {
                target: bleed_wing
                source: "images/BLEED_WING_FAILURE.svg"
            }
            PropertyChanges {
                target: _text
                visible: true
                text: qsTr("LO\nPWR")
            }
        },
        State {
            name: "Bleed_Wing_anti-icing_command_ON_and_high_temperature"
            when: self.wing_state === 5

            PropertyChanges {
                target: bleed_pipe_1
                color: "#FFBF00"
            }
            PropertyChanges {
                target: bleed_pipe_2
                color: "#FFBF00"
            }
            PropertyChanges {
                target: bleed_wing
                source: "images/BLEED_WING_FAILURE.svg"
            }
            PropertyChanges {
                target: _text
                visible: true
                text: qsTr("HI\nPWR")
            }
        }
    ]
}
