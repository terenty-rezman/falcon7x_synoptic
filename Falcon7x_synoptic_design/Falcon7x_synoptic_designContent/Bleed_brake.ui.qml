

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick

Item {
    id: self
    width: 103
    height: 31
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
        x: 49
        y: 2
        width: 5
        height: 12
        color: "#FFBF00"
        border.width: 0
    }

    Rectangle {
        id: bleed_pipe_2
        x: 35
        y: 14
        width: 33
        height: 5
        color: "#FFBF00"
    }

    Image {
        id: img_brakes
        x: 0
        y: 0
        source: "images/BLEED_BRAKE_OFF.svg"
        width: 103
        height: 30
    }

    // Bleed_valve {
    //     id: bleed_valve
    //     x: 36
    //     y: -31
    //     rotation: 90
    //     state: 1
    // }

    // Text {
    //     id: _text
    //     x: 574
    //     y: 169
    //     color: "#ffbf00"
    //     text: qsTr("LO\nPWR")
    //     font.pixelSize: 13
    //     horizontalAlignment: Text.AlignHCenter
    //     lineHeight: 0.9
    //     font.family: "Arial"
    // }
    property int brake_state: 3

    states: [
        State {
            name: "bleed_brake_heating_off"
            when: self.brake_state === 1

            PropertyChanges {
                target: bleed_pipe_1
                color: "#555555"
            }
            PropertyChanges {
                target: bleed_pipe_2
                color: "#555555"
            }
            PropertyChanges {
                target: img_brakes
                source: "images/BLEED_BRAKE_OFF.svg"
            }
            // PropertyChanges {
            //     target: bleed_valve
            //     state: 2
            // }
        },
        State {
            name: "bleed_brake_heating_on"
            when: self.brake_state === 2

            PropertyChanges {
                target: bleed_pipe_1
                color: "#00ff00"
            }
            PropertyChanges {
                target: bleed_pipe_2
                color: "#00ff00"
            }
            PropertyChanges {
                target: img_brakes
                source: "images/BLEED_BRAKE_ON.svg"
            }
        },
        State {
            name: "bleed_brake_heating_failure"
            when: self.brake_state === 3

            PropertyChanges {
                target: bleed_pipe_1
                color: "#FFBF00"
            }
            PropertyChanges {
                target: bleed_pipe_2
                color: "#FFBF00"
            }
            PropertyChanges {
                target: img_brakes
                source: "images/BLEED_BRAKE_FAILURE.svg"
            }
        }
    ]
}
