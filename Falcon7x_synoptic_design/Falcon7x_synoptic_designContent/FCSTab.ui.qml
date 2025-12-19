import QtQuick
import QtQuick.Controls
import Falcon7x_synoptic_design
import QtQuick.Studio.Components
import QtQuick.VectorImage
import "../../components/basic_components"

Rectangle {
    id: rectangle
    width: 684
    height: 342
    visible: true

    color: Constants.backgroundColor

    Image {
        id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
        x: 0
        y: -1
        visible: true
        source: "images/FCS.png"
        enabled: true
        fillMode: Image.PreserveAspectFit
    }
    FCS_sfcc_frame {
        id: fCS_sfcc_frame
        x: 20
        y: 137
    }

    Text {
        id: _text1
        x: 43
        y: 209
        color: "#555555"
        text: qsTr("ROLL")
        font.letterSpacing: -0.3
        font.pixelSize: 19
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    ArcItem {
        id: arc
        x: 25
        y: 199
        width: 80
        height: 80
        rotation: 90
        end: 180
        strokeColor: "#555555"
        fillColor: "#00000000"
    }
    Rectangle {
        id: rectangle2
        x: 17
        y: 239
        width: 12
        height: 3
        color: "#555555"
        border.color: "#00555555"
    }

    Rectangle {
        id: rectangle3
        x: 101
        y: 239
        width: 12
        height: 3
        color: "#555555"
        border.color: "#00555555"
    }

    Rectangle {
        id: rectangle4
        x: 60
        y: 279
        width: 10
        height: 3
        color: "#555555"
        border.color: "#00555555"
        rotation: 90
    }

    Rectangle {
        id: rectangle5
        x: 90
        y: 268
        width: 10
        height: 3
        color: "#555555"
        border.color: "#00555555"
        rotation: 45
    }

    Rectangle {
        id: rectangle6
        x: 30
        y: 268
        width: 10
        height: 3
        color: "#555555"
        border.color: "#00555555"
        rotation: -45
    }

    FCS_yaw_scale {
        id: fCS_yaw_scale
        x: 154
        y: 196
    }

    FCS_pitch_scale {
        id: fCS_pitch_scale
        x: 266
        y: 190
    }

    Rectangle {
        id: rectangle1
        x: 272
        y: 97
        width: 27
        height: 2
        color: "#555555"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle7
        x: 299
        y: 70
        width: 14
        height: 50
        color: "#00ffffff"
        radius: 2
        border.color: "#555555"
        border.width: 2
    }

    Rectangle {
        id: rectangle8
        x: 299
        y: 94
        width: 14
        height: 2
        color: "#555555"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle9
        x: 259
        y: 84
        width: 28
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: 90
    }

    Rectangle {
        id: rectangle10
        x: 269
        y: 48
        width: 172
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: -15.5
    }

    Rectangle {
        id: rectangle11
        x: 500
        y: 48
        width: 172
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: 15.5
    }

    Text {
        id: _text
        x: 45
        y: 23
        color: "#c3cdbc"
        text: qsTr("FCS MODE")
        font.letterSpacing: -0.2
        font.pixelSize: 18
        font.styleName: "Narrow"
        font.family: "Arial"
    }
    FCS_fcs_mode {
        id: fCS_fcs_mode
        x: 52
        y: 45
    }

    FCS_mfcc_frame {
        id: fCS_mfcc_frame
        x: 21
        y: 78
    }

    FCS_roll_scale {
        id: fCS_roll_scale
        x: 25
        y: 199
    }

    FCS_sfcc_frame {
        id: fCS_sfcc_frame1
        x: 20
        y: 137
    }

    Text {
        id: _text2
        x: 43
        y: 209
        color: "#555555"
        text: qsTr("ROLL")
        font.letterSpacing: -0.3
        font.pixelSize: 19
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    FCS_yaw_scale {
        id: fCS_yaw_scale1
        x: 154
        y: 196
    }

    FCS_pitch_scale {
        id: fCS_pitch_scale1
        x: 266
        y: 190
    }

    Rectangle {
        id: rectangle17
        x: 272
        y: 97
        width: 27
        height: 2
        color: "#555555"
        border.color: "#00000000"

        FCS_ail_elev {
            id: fCS_ail_elev
            x: 10
            y: -2
        }
    }

    Rectangle {
        id: rectangle18
        x: 299
        y: 70
        width: 14
        height: 50
        color: "#00ffffff"
        radius: 2
        border.color: "#555555"
        border.width: 2
    }

    Rectangle {
        id: rectangle19
        x: 299
        y: 94
        width: 14
        height: 2
        color: "#555555"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle20
        x: 259
        y: 84
        width: 28
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: 90
    }

    Rectangle {
        id: rectangle21
        x: 269
        y: 48
        width: 172
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: -15.5
    }

    Rectangle {
        id: rectangle22
        x: 500
        y: 48
        width: 172
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: 15.5
    }

    Rectangle {
        id: rectangle23
        x: 641
        y: 97
        width: 27
        height: 2
        color: "#555555"
        border.color: "#00000000"
    }
    FCS_ail_elev {
        id: fCS_ail_elev1
        x: 611
        y: 95
    }
    Rectangle {
        id: rectangle24
        x: 627
        y: 70
        width: 14
        height: 50
        color: "#00ffffff"
        radius: 2
        border.color: "#555555"
        border.width: 2
    }

    Rectangle {
        id: rectangle25
        x: 627
        y: 94
        width: 14
        height: 2
        color: "#555555"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle26
        x: 654
        y: 84
        width: 28
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: 90
    }

    Rectangle {
        id: rectangle27
        x: 365
        y: 201
        width: 28
        height: 2
        color: "#555555"
        border.color: "#00000000"
    }
    FCS_ail_elev {
        id: fCS_ail_elev2
        x: 377
        y: 191
    }

    FCS_ail_elev {
        id: fCS_ail_elev3
        x: 511
        y: 191
    }
    Rectangle {
        id: rectangle28
        x: 393
        y: 169
        width: 14
        height: 43
        color: "#00ffffff"
        radius: 2
        border.color: "#555555"
        border.width: 2
    }

    Rectangle {
        id: rectangle29
        x: 349
        y: 186
        width: 32
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: 90
    }

    Rectangle {
        id: rectangle30
        x: 363
        y: 159
        width: 80
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: -17.1
    }

    Rectangle {
        id: rectangle31
        x: 495
        y: 159
        width: 80
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: 17.1
    }

    Rectangle {
        id: rectangle32
        x: 542
        y: 201
        width: 31
        height: 2
        color: "#555555"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle33
        x: 528
        y: 169
        width: 14
        height: 43
        color: "#00ffffff"
        radius: 2
        border.color: "#555555"
        border.width: 2
    }

    Rectangle {
        id: rectangle34
        x: 556
        y: 186
        width: 32
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: 90
    }

    Rectangle {
        id: rectangle35
        x: 528
        y: 190
        width: 14
        height: 2
        color: "#555555"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle36
        x: 393
        y: 190
        width: 14
        height: 2
        color: "#555555"
        border.color: "#00000000"
    }
    FCS_rudder {
        id: fCS_rudder
        x: 442
        y: 265
    }
    Rectangle {
        id: rectangle37
        x: 461
        y: 270
        width: 14
        height: 51
        color: "#00ffffff"
        radius: 2
        border.color: "#555555"
        border.width: 2
        rotation: 90
    }

    Rectangle {
        id: rectangle38
        x: 462
        y: 295
        width: 13
        height: 2
        color: "#555555"
        border.color: "#00000000"
        rotation: 90
    }

    Rectangle {
        id: rectangle39
        x: 364
        y: 50
        width: 15
        height: 44
        color: "#00ffffff"
        radius: 2
        border.color: "#555555"
        border.width: 2
    }

    Rectangle {
        id: rectangle40
        x: 563
        y: 50
        width: 15
        height: 44
        color: "#00ffffff"
        radius: 2
        border.color: "#555555"
        border.width: 2
    }

    FCS_slats_spoil_extended {
        id: fCS_slats_spoil_extended
        x: 276
        y: 46
        rotation: -15
    }

    FCS_slats_spoil_extended {
        id: fCS_slats_spoil_extended1
        x: 333
        y: 30
        rotation: -15
    }

    FCS_slats_spoil_extended {
        id: fCS_slats_spoil_extended2
        x: 389
        y: 15
        rotation: -15
    }

    FCS_slats_spoil_extended {
        id: fCS_slats_spoil_extended3
        x: 509
        y: 14
        rotation: 15
    }

    FCS_slats_spoil_extended {
        id: fCS_slats_spoil_extended4
        x: 563
        y: 29
        rotation: 15
    }

    FCS_slats_spoil_extended {
        id: fCS_slats_spoil_extended5
        x: 621
        y: 45
        rotation: 15
    }

    FCS_spoil {
        id: fCS_spoil
        x: 341
        y: 69
    }

    FCS_spoil {
        id: fCS_spoil1
        x: 540
        y: 69
    }

    Text {
        id: _text3
        x: 285
        y: 185
        color: "#555555"
        text: qsTr("PITCH")
        font.letterSpacing: 1.3
        font.pixelSize: 17
        font.styleName: "Narrow"
        font.family: "Arial"
    }
}
