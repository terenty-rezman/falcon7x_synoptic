import QtQuick
import QtQuick.Studio.Components

Item {
    id: _item
    width: 684
    height: 342


    /* Image {
        id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
        x: 0
        y: 0
        visible: false
        source: "images/FUEL_F8X.jpg"
        enabled: true
        fillMode: Image.PreserveAspectFit
    }*/
    GroupItem {
        objectName: "fuel_pipe_t1t3"

        property int state: 3

        Fuel_rect_pipe {
            x: 116
            y: 25
            width: 207
            height: 5

            state: parent.state
        }

        Fuel_rect_pipe {
            x: 349
            y: 25
            width: 208
            height: 5

            state: parent.state
        }
    }

    GroupItem {
        objectName: "fuel_pipe_t1t2"

        property int state: 0

        Fuel_rect_pipe {
            id: rectangle6
            x: 116
            y: 45
            width: 89
            height: 5

            state: parent.state
        }

        Fuel_rect_pipe {
            id: rectangle
            x: 232
            y: 45
            width: 51
            height: 5

            state: parent.state
        }

        Fuel_rect_pipe {
            id: rectangle1
            x: 288
            y: 55
            width: 5
            height: 85

            state: parent.state
        }

        Fuel_arc_pipe {
            id: arc
            x: 273
            y: 45
            width: 20
            height: 20
            rotation: 0

            state: parent.state
        }

        Fuel_arc_pipe {
            id: arc1
            x: 288
            y: 130
            width: 20
            height: 20

            rotation: 180

            state: parent.state
        }

        Fuel_rect_pipe {
            id: rectangle2
            x: 298
            y: 145
            width: 22
            height: 5

            state: parent.state
        }
    }

    GroupItem {
        objectName: "fuel_pipe_t2t3"
        x: 353
        y: 45

        property int state: 1

        Fuel_rect_pipe {
            id: rectangle9
            x: 117
            y: 0
            width: 87
            height: 5

            state: parent.state
        }

        Fuel_rect_pipe {
            id: rectangle3
            x: 0
            y: 100
            width: 25
            height: 5

            state: parent.state
        }

        Fuel_rect_pipe {
            id: rectangle5
            x: 40
            y: 0
            width: 50
            height: 5

            state: parent.state
        }

        Fuel_rect_pipe {
            id: rectangle4
            x: 30
            y: 10
            width: 5
            height: 85

            state: parent.state
        }

        Fuel_arc_pipe {
            id: arc2
            x: 15
            y: 85
            width: 20
            height: 20
            rotation: 90

            state: parent.state
        }

        Fuel_arc_pipe {
            id: arc3
            x: 30
            y: 0
            width: 20
            height: 20
            rotation: -90

            state: parent.state
        }
    }

    Rectangle {
        id: rectangle10
        x: 561
        y: 53
        width: 5
        height: 113
        color: "#ffffff"
        border.color: "#ffffff"
        rotation: 0
    }

    Rectangle {
        id: rectangle11
        x: 561
        y: 200
        width: 5
        height: 28
        color: "#ffffff"
        border.color: "#ffffff"
        rotation: 0
    }

    Rectangle {
        id: rectangle14
        x: 476
        y: 223
        width: 90
        height: 5
        color: "#ffffff"
        border.color: "#ffffff"
    }

    Rectangle {
        id: rectangle15
        x: 224
        y: 223
        width: 225
        height: 5
        color: "#ffffff"
        border.color: "#ffffff"
    }

    Rectangle {
        id: rectangle16
        x: 108
        y: 223
        width: 89
        height: 5
        color: "#ffffff"
        border.color: "#ffffff"
    }

    Rectangle {
        id: rectangle17
        x: 108
        y: 201
        width: 5
        height: 27
        color: "#ffffff"
        border.color: "#ffffff"
        rotation: 0
    }

    Rectangle {
        id: rectangle20
        x: 108
        y: 223
        width: 5
        height: 89
        color: "#ffffff"
        border.color: "#ffffff"
        rotation: 0
    }

    ArcItem {
        id: arc6
        x: 108
        y: 302
        width: 20
        height: 20
        strokeWidth: 5
        strokeColor: "#4dd34b"
        rotation: 180
        fillColor: "#00000000"
    }

    ArcItem {
        id: arc7
        x: 546
        y: 302
        width: 20
        height: 20
        strokeWidth: 5
        strokeColor: "#4dd34b"
        rotation: 90
        fillColor: "#00000000"
    }

    Rectangle {
        id: rectangle21
        x: 118
        y: 317
        width: 204
        height: 5
        color: "#ffffff"
        border.color: "#ffffff"
    }

    Rectangle {
        id: rectangle22
        x: 350
        y: 317
        width: 206
        height: 5
        color: "#ffffff"
        border.color: "#ffffff"
    }

    Rectangle {
        id: rectangle23
        x: 561
        y: 223
        width: 5
        height: 89
        color: "#ffffff"
        border.color: "#ffffff"
        rotation: 0
    }

    Rectangle {
        id: rectangle24
        x: 108
        y: 53
        width: 5
        height: 113
        color: "#ffffff"
        border.color: "#ffffff"
        rotation: 0
    }

    ArcItem {
        id: arc8
        x: 638
        y: 245
        width: 20
        height: 20
        strokeWidth: 4
        strokeColor: "#4dd34b"
        rotation: 0
        fillColor: "#00000000"
    }

    Rectangle {
        id: rectangle26
        x: 654
        y: 255
        width: 4
        height: 9
        color: "#ffffff"
        border.color: "#ffffff"
        rotation: 0
    }

    ArcItem {
        id: arc9
        x: 588
        y: 245
        width: 20
        height: 20
        strokeWidth: 4
        strokeColor: "#4dd34b"
        rotation: -90
        fillColor: "#00000000"
    }

    Rectangle {
        id: rectangle27
        x: 588
        y: 255
        width: 4
        height: 9
        color: "#ffffff"
        border.color: "#ffffff"
        rotation: 0
    }

    Rectangle {
        id: rectangle28
        x: 598
        y: 249
        width: 50
        height: 0
        color: "#ffffff"
        border.color: "#ffffff"
    }

    Rectangle {
        id: rectangle40
        x: 334
        y: 155
        width: 5
        height: 11
        color: "#ffffff"
        border.color: "#ffffff"
        rotation: 0
    }

    Rectangle {
        id: rectangle41
        x: 334
        y: 201
        width: 5
        height: 29
        color: "#ffffff"
        border.color: "#ffffff"
        rotation: 0
    }

    Text {
        id: _text
        x: 38
        y: 249
        width: 55
        height: 16
        color: "#4dd34b"
        text: qsTr("ENG 1")
        font.letterSpacing: 0.9
        font.pixelSize: 17
        font.family: "Arial"
    }

    Text {
        id: _text1
        x: 233
        y: 249
        width: 55
        height: 16
        color: "#4dd34b"
        text: qsTr("ENG 2")
        font.letterSpacing: 1
        font.pixelSize: 17
        font.family: "Arial"
    }

    Text {
        id: _text2
        x: 396
        y: 249
        width: 55
        height: 16
        color: "#4dd34b"
        text: qsTr("APU")
        font.letterSpacing: 1.4
        font.pixelSize: 17
        font.family: "Arial"
    }

    Text {
        id: _text3
        x: 599
        y: 249
        width: 55
        height: 16
        color: "#4dd34b"
        text: qsTr("ENG 3")
        font.letterSpacing: 0.8
        font.pixelSize: 17
        font.family: "Arial"
    }

    GroupItem {
        x: 223
        y: 220

        Rectangle {
            id: rectangle34
            x: 66
            y: 35
            width: 4
            height: 10
            color: "#ffffff"
            border.color: "#ffffff"
            rotation: 0
        }

        ArcItem {
            id: arc14
            x: 50
            y: 25
            width: 20
            height: 20
            strokeWidth: 4
            strokeColor: "#4dd34b"
            rotation: 0
            fillColor: "#00000000"
        }

        Rectangle {
            id: rectangle35
            x: 10
            y: 25
            width: 50
            height: 4
            color: "#ffffff"
            border.color: "#ffffff"
        }

        ArcItem {
            id: arc15
            x: 0
            y: 25
            width: 20
            height: 20
            strokeWidth: 4
            strokeColor: "#4dd34b"
            rotation: -90
            fillColor: "#00000000"
        }

        Rectangle {
            id: rectangle36
            x: 0
            y: 35
            width: 4
            height: 10
            color: "#ffffff"
            border.color: "#ffffff"
            rotation: 0
        }

        ArcItem {
            id: arc18
            x: 96
            y: 0
            width: 20
            height: 20
            strokeWidth: 5
            strokeColor: "#4dd34b"
            rotation: 90
            fillColor: "#00000000"
        }

        Rectangle {
            id: rectangle42
            x: 42
            y: 15
            width: 64
            height: 5
            color: "#ffffff"
            border.color: "#ffffff"
        }

        ArcItem {
            id: arc20
            x: 32
            y: 15
            width: 20
            height: 20
            strokeWidth: 5
            strokeColor: "#4dd34b"
            rotation: -90
            fillColor: "#00000000"
        }
    }

    GroupItem {
        x: 334
        y: 220

        Rectangle {
            id: rectangle37
            x: 111
            y: 35
            width: 4
            height: 10
            color: "#ffffff"
            border.color: "#ffffff"
            rotation: 0
        }

        Rectangle {
            id: rectangle38
            x: 45
            y: 35
            width: 4
            height: 10
            color: "#ffffff"
            border.color: "#ffffff"
            rotation: 0
        }

        Rectangle {
            id: rectangle39
            x: 55
            y: 25
            width: 50
            height: 4
            color: "#ffffff"
            border.color: "#ffffff"
        }

        ArcItem {
            id: arc16
            x: 95
            y: 25
            width: 20
            height: 20
            strokeWidth: 4
            strokeColor: "#4dd34b"
            rotation: 0
            fillColor: "#00000000"
        }

        ArcItem {
            id: arc17
            x: 45
            y: 25
            width: 20
            height: 20
            strokeWidth: 4
            strokeColor: "#4dd34b"
            rotation: -90
            fillColor: "#00000000"
        }

        ArcItem {
            id: arc19
            x: 0
            y: 0
            width: 20
            height: 20
            strokeWidth: 5
            strokeColor: "#4dd34b"
            rotation: 180
            fillColor: "#00000000"
        }

        Rectangle {
            id: rectangle43
            x: 10
            y: 15
            width: 63
            height: 5
            color: "#ffffff"
            border.color: "#ffffff"
        }

        ArcItem {
            id: arc21
            x: 63
            y: 15
            width: 20
            height: 20
            strokeWidth: 5
            strokeColor: "#4dd34b"
            rotation: 0
            fillColor: "#00000000"
        }
    }

    GroupItem {
        x: 565
        y: 223

        Rectangle {
            id: rectangle12
            x: 0
            y: 0
            width: 51
            height: 5
            color: "#ffffff"
            border.color: "#ffffff"
        }

        ArcItem {
            id: arc4
            x: 41
            y: 0
            width: 20
            height: 20
            strokeWidth: 5
            strokeColor: "#4dd34b"
            rotation: 0
            fillColor: "#00000000"
        }

        Rectangle {
            id: rectangle13
            x: 56
            y: 10
            width: 5
            height: 13
            color: "#ffffff"
            border.color: "#ffffff"
            rotation: 0
        }

        Rectangle {
            id: rectangle25
            x: 33
            y: 22
            width: 50
            height: 4
            color: "#ffffff"
            border.color: "#ffffff"
        }

        ArcItem {
            id: arc10
            x: 73
            y: 22
            width: 20
            height: 20
            strokeWidth: 4
            strokeColor: "#4dd34b"
            rotation: 0
            fillColor: "#00000000"
        }

        Rectangle {
            id: rectangle29
            x: 89
            y: 32
            width: 4
            height: 10
            color: "#ffffff"
            border.color: "#ffffff"
            rotation: 0
        }

        ArcItem {
            id: arc11
            x: 23
            y: 22
            width: 20
            height: 20
            strokeWidth: 4
            strokeColor: "#4dd34b"
            rotation: -90
            fillColor: "#00000000"
        }

        Rectangle {
            id: rectangle30
            x: 23
            y: 32
            width: 4
            height: 10
            color: "#ffffff"
            border.color: "#ffffff"
            rotation: 0
        }
    }

    GroupItem {
        x: 27
        y: 223

        ArcItem {
            id: arc5
            x: 32
            y: 0
            width: 20
            height: 20
            strokeWidth: 5
            strokeColor: "#4dd34b"
            rotation: -90
            fillColor: "#00000000"
        }

        Rectangle {
            id: rectangle18
            x: 41
            y: 0
            width: 45
            height: 5
            color: "#ffffff"
            border.color: "#ffffff"
        }

        Rectangle {
            id: rectangle19
            x: 32
            y: 10
            width: 5
            height: 14
            color: "#ffffff"
            border.color: "#ffffff"
            rotation: 0
        }

        Rectangle {
            id: rectangle31
            x: 0
            y: 32
            width: 4
            height: 10
            color: "#ffffff"
            border.color: "#ffffff"
            rotation: 0
        }

        Rectangle {
            id: rectangle32
            x: 66
            y: 32
            width: 4
            height: 10
            color: "#ffffff"
            border.color: "#ffffff"
            rotation: 0
        }

        ArcItem {
            id: arc12
            x: 0
            y: 22
            width: 20
            height: 20
            strokeWidth: 4
            strokeColor: "#4dd34b"
            rotation: -90
            fillColor: "#00000000"
        }

        ArcItem {
            id: arc13
            x: 50
            y: 22
            width: 20
            height: 20
            strokeWidth: 4
            strokeColor: "#4dd34b"
            rotation: 0
            fillColor: "#00000000"
        }

        Rectangle {
            id: rectangle33
            x: 10
            y: 22
            width: 50
            height: 4
            color: "#ffffff"
            border.color: "#ffffff"
        }
    }
}
