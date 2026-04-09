

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Studio.Components
import "../Falcon7x_synoptic_design"

Item {
    id: self
    width: 684
    height: 342

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
        x: 10
        y: 312
        objectName: "bld_eng_hp_off_1"
        color: "#ffbf00"
        text: qsTr("HP OFF")
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.bold: false
        font.family: "Arial"
    }

    Text {
        id: _text2
        x: 305
        y: 313
        objectName: "bld_eng_hp_off_2"
        color: "#ffbf00"
        text: qsTr("HP OFF")
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text3
        x: 616
        y: 314
        objectName: "bld_eng_hp_off_3"
        color: "#ffbf00"
        text: qsTr("HP OFF")
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text4
        objectName: "bld_eng_lp_off_1"
        x: 39
        y: 164
        color: "#ffbf00"
        text: qsTr("OFF")
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text5
        x: 606
        y: 165
        objectName: "bld_eng_lp_off_3"
        color: "#ffbf00"
        text: qsTr("OFF")
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text6
        x: 354
        y: 202
        objectName: "bld_eng_lp_off_2"
        color: "#ffbf00"
        text: qsTr("OFF")
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
        font.bold: false
    }

    Text {
        id: _text8

        objectName: "bld_xbleed13_on_off"

        property int state: 2

        text: (state == 1) ? "ON" : "OFF"

        x: 367
        y: 60
        color: "#ffbf00"
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
        font.bold: false
        visible: state > 0
    }

    Text {
        id: _text9

        x: 171
        y: 60

        objectName: "bld_xbleed12_on_off"

        property int state: 2

        color: "#ffbf00"
        text: (state == 1) ? "ON" : "OFF"
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
        font.bold: false
        visible: state > 0
    }

    GroupItem {
        id: pipes
        x: 116
        y: 214

        objectName: "bld_pipe_eng_ai_1"

        property int state: 0

        Bleed_rect_pipe {
            id: bleed_pipe_4
            x: 2
            y: 0
            width: 26
            height: 5

            state: parent.state
        }

        Bleed_rect_pipe {
            id: bleed_pipe_5
            x: 0
            y: 84
            width: 28
            height: 5

            state: parent.state
        }

        Bleed_rect_pipe {
            id: bleed_pipe_1
            x: 32
            y: 9
            width: 5
            height: 17

            state: parent.state
        }

        Bleed_arc_pipe {
            id: bleed_pipe_2
            x: 19
            y: 71
            width: 18
            height: 18
            rotation: 90

            state: parent.state
        }

        Bleed_rect_pipe {
            id: bleed_pipe_3
            x: 32
            y: 57
            width: 5
            height: 23

            state: parent.state
        }

        Bleed_arc_pipe {
            id: bleed_pipe_6
            x: 19
            y: 0
            width: 18
            height: 18
            rotation: 0

            state: parent.state
        }
    }

    GroupItem {
        id: pipes1
        x: 522
        y: 181
        width: 73

        objectName: "bld_pipe_eng_ai_3"

        property int state: 0

        Bleed_rect_pipe {
            id: bleed_pipe_7
            x: 9
            y: 34
            width: 27
            height: 5

            state: parent.state
        }

        Bleed_rect_pipe {
            id: bleed_pipe_8
            x: 9
            y: 116
            width: 28
            height: 5

            state: parent.state
        }

        Bleed_rect_pipe {
            id: bleed_pipe_9
            x: 0
            y: 43
            width: 5
            height: 17

            state: parent.state
        }

        Bleed_arc_pipe {
            id: bleed_pipe_10
            x: 0
            y: 103
            width: 18
            height: 18
            rotation: 180

            state: parent.state
        }

        Bleed_rect_pipe {
            id: bleed_pipe_11
            x: 0
            y: 91
            width: 5
            height: 21
            rotation: -0.291

            state: parent.state
        }

        Bleed_arc_pipe {
            id: bleed_pipe_12
            x: 0
            y: 34
            width: 18
            height: 18
            rotation: 270

            state: parent.state
        }
    }

    GroupItem {
        x: 207
        y: 154

        objectName: "bld_pipe_eng_ai_2"

        property int state: 0

        Bleed_rect_pipe {
            id: rectangle20
            x: 0
            y: 9
            width: 5
            height: 77
            scale: 1

            state: parent.state
        }

        Bleed_arc_pipe {
            id: arc5
            x: 0
            y: 131
            width: 18
            height: 18
            rotation: 180

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle21
            x: 0
            y: 118
            width: 5
            height: 22
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle22
            x: 9
            y: 0
            width: 26
            height: 5
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle23
            x: 9
            y: 144
            width: 29
            scale: 1

            state: parent.state
        }

        Bleed_arc_pipe {
            id: arc6
            x: 0
            y: 0
            width: 18
            height: 18
            rotation: 270

            state: parent.state
        }
    }

    GroupItem {
        x: 273
        y: 251

        objectName: "bld_pipe_eng_lp_2"

        Bleed_rect_pipe {
            id: rectangle30
            x: 0
            y: 47
            width: 50
            height: 5
            scale: 1
        }

        Bleed_arc_pipe {
            id: arc7
            x: 41
            y: 34
            width: 18
            height: 18
            rotation: 90
        }

        Bleed_rect_pipe {
            id: rectangle31
            x: 54
            y: 40
            width: 5
            height: 3
            scale: 1
        }
    }

    GroupItem {
        x: 28
        y: 226

        objectName: "bld_pipe_eng_lp_1"

        property int state: 0

        Bleed_rect_pipe {
            id: rectangle1
            x: 0
            y: 0
            width: 5
            height: 33
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle3
            x: 5
            y: 23
            width: 48
            height: 5
            scale: 1

            state: parent.state
        }
    }

    GroupItem {
        x: 28
        y: 285

        objectName: "bld_pipe_eng_hp_1"

        property int state: 0

        Bleed_arc_pipe {
            id: arc1
            x: 0
            y: 0
            width: 18
            height: 18
            rotation: 180

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle8
            x: 9
            y: 13
            width: 50
            height: 5
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle9
            x: 0
            y: 5
            width: 5
            height: 4
            scale: 1

            state: parent.state
        }
    }

    GroupItem {
        x: 280
        y: 225

        objectName: "bld_pipe_eng_lp_2"

        property int state: 0

        Bleed_rect_pipe {
            id: rectangle28
            x: -8
            y: -45
            width: 9
            height: 5
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle27
            x: 47
            y: 0
            width: 5
            height: 34
            border.width: 0
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle26
            x: 0
            y: 21
            width: 47
            height: 5
            scale: 1

            state: parent.state
        }
    }

    GroupItem {
        x: 197
        y: 96

        objectName: "bld_pipe_eng_2"

        property int state: 0

        Bleed_rect_pipe {
            id: rectangle2
            x: 0
            y: 0
            width: 167
            height: 5
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle15
            x: 130
            y: 5
            width: 5
            height: 93
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle25
            x: 117
            y: 84
            width: 13
            height: 5
            scale: 1

            state: parent.state
        }
    }

    GroupItem {
        x: 28
        y: 35

        objectName: "bld_pipe_eng_1"

        property int state: 0

        Bleed_rect_pipe {
            id: rectangle6
            x: 9
            y: 61
            width: 126
            height: 5
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle19
            x: 19
            y: 0
            width: 5
            height: 61
            border.width: 0
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle
            x: 0
            y: 70
            width: 5
            height: 90
            border.width: 0
            state: parent.state
        }

        Bleed_arc_pipe {
            id: arc2
            x: 0
            y: 61
            width: 18
            height: 18
            scale: 1
            rotation: 270
            state: parent.state
        }
    }

    GroupItem {
        x: 397
        y: 35

        objectName: "bld_pipe_eng_3"

        property int state: 0

        Bleed_rect_pipe {
            id: rectangle7
            x: 0
            y: 61
            width: 240
            height: 5
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle16
            x: 39
            y: 66
            width: 5
            height: 104
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle18
            x: 222
            y: 0
            width: 5
            height: 61
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle14
            x: 95
            y: 48
            width: 5
            height: 13
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle17
            x: 117
            y: 66
            width: 5
            height: 15
            scale: 1

            state: parent.state
        }

        Bleed_arc_pipe {
            id: arc3
            x: 231
            y: 61
            width: 18
            height: 18

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle10
            x: 244
            y: 70
            width: 5
            height: 91
            scale: 1

            state: parent.state
        }
    }

    GroupItem {
        x: 594
        y: 226

        objectName: "bld_pipe_eng_lp_3"

        property int state: 0

        Bleed_rect_pipe {
            id: rectangle11
            x: 47
            y: 0
            width: 5
            height: 33
            scale: 1

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle5
            x: 0
            y: 20
            width: 47
            height: 5
            scale: 1

            state: parent.state
        }
    }

    GroupItem {
        x: 588
        y: 283

        objectName: "bld_pipe_eng_hp_3"

        property int state: 0

        Bleed_arc_pipe {
            id: arc4
            x: 40
            y: 0
            width: 18
            height: 18
            rotation: 90

            state: parent.state
        }

        Bleed_rect_pipe {
            id: rectangle13
            x: 0
            y: 13
            width: 49
            height: 5
            scale: 1

            state: parent.state
        }
    }

    states: [
        State {
            name: "valve_open"
            when: self.state === 1

            PropertyChanges {
                target: streak
                color: "#00ff00"
                visible: true
            }
            PropertyChanges {
                target: valve_inv_data
                visible: false
            }
        },
        State {
            name: "valve_closed"
            when: self.state === 2

            PropertyChanges {
                target: streak
                color: "#a8b49e"
                rotation: 90
                visible: true
            }
            PropertyChanges {
                target: valve_inv_data
                visible: false
            }
        },
        State {
            name: "valve_failed"
            when: self.state === 3

            PropertyChanges {
                target: streak
                color: "transparent"
                visible: true
            }
            PropertyChanges {
                target: valve_inv_data
                visible: false
            }
        },
        State {
            name: "valve_failed_closed"
            when: self.state === 4

            PropertyChanges {
                target: streak
                color: "#dfd229"
                rotation: 90
                visible: true
            }
            PropertyChanges {
                target: valve_inv_data
                visible: false
            }
        },
        State {
            name: "valve_failed_opened"
            when: self.state === 5

            PropertyChanges {
                target: streak
                color: "#dfd229"
                visible: true
            }
            PropertyChanges {
                target: valve_inv_data
                visible: false
            }
        },

        State {
            name: "valve_invalid_data"
            when: self.state === 6

            PropertyChanges {
                target: valve_inv_data
                visible: true
            }
            PropertyChanges {
                target: streak
                visible: false
            }
        }
    ]
}
