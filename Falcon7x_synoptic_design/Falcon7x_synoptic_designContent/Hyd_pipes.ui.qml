import QtQuick
import QtQuick.Studio.Components
import QtCharts

Item {
    id: _item
    width: 684
    height: 342

    // color: "black"
    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/HYD.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    Hyd_rect_pipe {
        objectName: "hyd_pipe_b3"
        id: rectangle9
        x: 413
        y: 55
        width: 19
        height: 5
    }

    Hyd_big_text {
        objectName: "hyd_text_om_slats"

        id: _text1
        x: 128
        y: 218
        width: 96
        height: 78

        text: qsTr("O M SLATS\nLH ELEV\nLH AIL\nRUDDER")
    }

    Hyd_big_text {
        objectName: "hyd_text_rh_ail"
        id: _text5
        x: 460
        y: 245
        width: 63
        height: 19
        text: qsTr("RH AIL")
    }

    Hyd_big_text {
        id: _text6
        objectName: "hyd_text_rh_elev"
        x: 452
        y: 293
        width: 84
        height: 19
        text: qsTr("RH ELEV")
    }

    Hyd_big_text {
        objectName: "hyd_text_spoilers"
        id: _text7
        x: 586
        y: 256
        width: 84
        height: 19
        text: qsTr("SPOILERS")
    }

    Rectangle {
        objectName: "hyd_accum"
        id: rectangle
        x: 386
        y: 193
        width: 11
        height: 20
        color: "#00ff00"
        radius: 5
        border.color: "#297921"
    }

    Hyd_rect_pipe {
        id: rectangle7

        objectName: "hyd_pipe_a3"

        x: 100
        y: 55
        width: 20
        height: 5
    }

    Hyd_rect_pipe {
        id: rectangle60

        objectName: "hyd_pipe_a1"

        x: 75
        y: 55
        width: 20
        height: 5
    }

    Hyd_rect_pipe {
        objectName: "hyd_pipe_b2"
        id: rectangle62
        x: 387
        y: 55
        width: 21
        height: 5
    }

    GroupItem {

        objectName: "hyd_pipe_a1a3"
        x: 95
        y: 55

        property int state: 0

        Hyd_big_text {
            id: _text
            x: 33
            y: 72
            width: 75
            height: 78
            text: qsTr("BRAKE 1\nI SLATS\nGEARS\nNWS")

            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle53
            x: 350
            y: 234

            width: 97
            height: 3

            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle54
            x: 347
            y: 234
            width: 3
            height: 28

            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle24
            x: 0
            y: 0
            width: 5
            height: 251

            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle8
            x: 4
            y: 107
            width: 22
            height: 5

            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle34
            x: 132
            y: 67
            width: 3
            height: 81

            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle10
            x: 4
            y: 246
            width: 343
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle12
            x: 4
            y: 209
            width: 21
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle22
            x: 28
            y: 157
            width: 107
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle31
            x: 25
            y: 157
            width: 3
            height: 85
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle23
            x: 28
            y: 67
            width: 107
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle32
            x: 25
            y: 67
            width: 3
            height: 84
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle33
            x: 28
            y: 148
            width: 107
            height: 3
            state: parent.state
        }
    }

    GroupItem {
        objectName: "hyd_pipe_b2b3"

        x: 123
        y: 97

        property int state: 0

        Hyd_rect_pipe {
            id: rectangle29
            x: 285
            y: -42
            width: 5
            height: 47

            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle14
            x: 289
            y: 156
            width: 30
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle26
            x: 285
            y: 5
            width: 5
            height: 162
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle15
            x: 107
            y: 167
            width: 183
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle16
            x: 248
            y: 146
            width: 37
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle17
            x: 269
            y: 113
            width: 16
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle18
            x: 248
            y: 52
            width: 37
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle21
            x: 0
            y: 197
            width: 107
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle30
            x: 104
            y: 118
            width: 3
            height: 79
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle35
            x: 121
            y: 68
            width: 127
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle36
            x: 118
            y: 26
            width: 127
            height: 3
            state: parent.state
        }

        Hyd_big_text {
            id: _text2
            x: 123
            y: 29
            width: 96
            height: 41
            text: qsTr("FLAPS\nAB")

            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle43
            x: 120
            y: 159
            width: 125
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle44
            x: 117
            y: 134
            width: 131
            height: 3
            state: parent.state
        }

        Hyd_big_text {
            id: _text4
            x: 123
            y: 138
            width: 31
            height: 19
            text: qsTr("T/R")

            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle45
            x: 117
            y: 137
            width: 3
            height: 25
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle46
            x: 245
            y: 137
            width: 3
            height: 25
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle49
            x: 322
            y: 144
            width: 97
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle50
            x: 319
            y: 144
            width: 3
            height: 28
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle37
            x: 118
            y: 28
            width: 3
            height: 43
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle38
            x: 245
            y: 26
            width: 3
            height: 42
            state: parent.state
        }
    }

    GroupItem {
        x: 445
        y: 75

        property int state: 0

        objectName: "hyd_pipe_c2"

        Hyd_rect_pipe {
            id: rectangle11
            x: 97
            y: 226
            width: 26
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle25
            x: 123
            y: 0
            width: 5
            height: 231
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle13
            x: 97
            y: 178
            width: 26
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle20
            x: 128
            y: 189
            width: 6
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle47
            x: 0
            y: 191
            width: 97
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle48
            x: 94
            y: 169
            width: 3
            height: 22
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle51
            x: 0
            y: 239
            width: 97
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle52
            x: 94
            y: 217
            width: 3
            height: 22
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle57
            x: 137
            y: 177
            width: 98
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle58
            x: 134
            y: 177
            width: 3
            height: 28
            state: parent.state
        }
    }

    GroupItem {
        x: 582
        y: 255

        objectName: "hyd_pipe_ebha"

        property int state: 0

        Hyd_rect_pipe {
            id: rectangle55
            x: 0
            y: 22
            width: 98
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle56
            x: 95
            y: 0
            width: 3
            height: 22
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle61
            x: 19
            y: 25
            width: 5
            height: 11
            state: parent.state
        }
    }

    GroupItem {
        objectName: "hyd_pipe_brake2"
        x: 244
        y: 181

        property int state: 0

        Hyd_rect_pipe {
            id: rectangle39
            x: 0
            y: 40
            width: 127
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle42
            x: 124
            y: 0
            width: 3
            height: 43
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle59
            x: 127
            y: 29
            width: 21
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle40
            x: -3
            y: -2
            width: 130
            height: 3
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle41
            x: -3
            y: 0
            width: 3
            height: 43
            state: parent.state
        }

        Hyd_big_text {
            id: _text3
            x: 1
            y: 1
            width: 122
            height: 40
            text: qsTr("BRAKE 2\nPARK BRAKE")

            state: parent.state
        }
    }

    GroupItem {
        objectName: "hyd_pipe_bu"
        x: 302
        y: 75

        property int state: 0

        Hyd_rect_pipe {
            id: rectangle19
            x: 0
            y: 22
            width: 106
            height: 5
            state: parent.state
        }

        Hyd_rect_pipe {
            id: rectangle27
            x: 0
            y: 0
            width: 5
            height: 22
            state: parent.state
        }
    }
}
