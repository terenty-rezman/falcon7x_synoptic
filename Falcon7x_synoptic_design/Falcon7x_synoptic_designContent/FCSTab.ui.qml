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

    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: -1
    //     visible: true
    //     source: "images/FCS.png"
    //     fillMode: Image.PreserveAspectFit
    // }
    FCS_elev_strip {
        objectName: "fcs_lh_elev"
        id: fCS_elev_strip
        x: 393
        y: 169
    }

    FCS_elev_strip {
        objectName: "fcs_rh_elev"
        id: fCS_elev_strip1
        x: 528
        y: 169
    }
    FCS_control_surf_label {
        objectName: "fcs_rudder_text"
        id: fCS_control_surf_label4
        x: 442
        y: 264
        width: 53
        height: 17
        text: "RUDDER"
        fontSize: 12
    }

    FCS_rudder {
        objectName: "fcs_rudder"
        id: fCS_rudder1
        x: 443
        y: 289
    }

    FCS_control_surf_label {
        objectName: "fcs_rh_ail_text"
        id: fCS_control_surf_label1
        x: 611
        y: 125
        text: "RH AIL"
    }

    FCS_control_surf_label {
        objectName: "fcs_lh_spoil_text"
        id: fCS_control_surf_label2
        x: 342
        y: 98
        width: 66
        height: 18
        text: "LH SPOIL"
    }

    FCS_control_surf_label {
        objectName: "fcs_rh_spoil_text"
        id: fCS_control_surf_label3
        x: 537
        y: 99
        width: 68
        height: 18
        text: "RH SPOIL"
    }
    FCS_control_surf_label {
        objectName: "fcs_lh_ail_text"
        id: fCS_control_surf_label
        x: 283
        y: 125
        text: "LH AIL"
    }

    FCS_ail_strip {
        objectName: "fcs_lh_ail"
        id: fCS_ail_elev_strip
        x: 299
        y: 69
    }

    FCS_ail_strip {
        objectName: "fcs_rh_ail"
        id: fCS_ail_elev_strip1
        x: 627
        y: 69
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
        objectName: "fcs_mfcc"
        id: fCS_mfcc_frame
        x: 21
        y: 78
    }

    FCS_roll_scale {
        id: fCS_roll_scale
        objectName: "fcs_roll"
        x: 25
        y: 199
    }

    FCS_sfcc_frame {
        id: fCS_sfcc_frame1
        objectName: "fcs_sfcc"
        x: 20
        y: 137
    }

    FCS_yaw_scale {
        id: fCS_yaw_scale1
        objectName: "fcs_yaw"
        x: 154
        y: 196
    }

    FCS_pitch_scale {
        objectName: "fcs_pitch"
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
        color: "#919b8a"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle20
        x: 259
        y: 84
        width: 28
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
        rotation: 90
    }

    Rectangle {
        id: rectangle21
        x: 269
        y: 48
        width: 172
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
        rotation: -15.5
    }

    Rectangle {
        id: rectangle22
        x: 500
        y: 48
        width: 172
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
        rotation: 15.5
    }

    Rectangle {
        id: rectangle23
        x: 641
        y: 97
        width: 27
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle26
        x: 654
        y: 84
        width: 28
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
        rotation: 90
    }

    Rectangle {
        id: rectangle27
        x: 365
        y: 201
        width: 28
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
    }
    FCS_control_surf_label {
        objectName: "fcs_lh_elev_text"
        id: fCS_ail_elev2
        x: 371
        y: 217
        width: 60
        height: 18
        text: "LH ELEV"
        fontSize: 13
    }
    FCS_control_surf_label {
        objectName: "fcs_rh_elev_text"
        id: fCS_ail_elev3
        x: 506
        y: 217
        width: 60
        height: 18
        text: "RH ELEV"
        fontSize: 13
    }

    Rectangle {
        id: rectangle29
        x: 349
        y: 186
        width: 32
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
        rotation: 90
    }

    Rectangle {
        id: rectangle30
        x: 363
        y: 159
        width: 80
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
        rotation: -17.1
    }

    Rectangle {
        id: rectangle31
        x: 495
        y: 159
        width: 80
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
        rotation: 17.1
    }

    Rectangle {
        id: rectangle32
        x: 542
        y: 201
        width: 31
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle34
        x: 556
        y: 186
        width: 32
        height: 2
        color: "#919b8a"
        border.color: "#00000000"
        rotation: 90
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

    FCS_spoil_strip {
        id: fCS_spoil
        objectName: "fcs_lh_spoil"
        x: 364
        y: 49
    }

    FCS_spoil_strip {
        objectName: "fcs_rh_spoil"
        id: fCS_spoil1
        x: 563
        y: 49
    }

    Text {
        id: _text3
        x: 285
        y: 185
        color: "#ffffff"
        text: qsTr("PITCH")
        font.letterSpacing: 1.3
        font.pixelSize: 17
        font.styleName: "Narrow"
        font.family: "Arial"
    }

    FCS_slats_spoil_status {
        id: fCS_slats_spoil_status
        x: 275
        y: 33
        rotation: -15
    }

    FCS_slats_spoil_status {
        id: fCS_slats_spoil_status1
        x: 332
        y: 17
        rotation: -15
    }

    FCS_slats_spoil_status {
        id: fCS_slats_spoil_status2
        x: 387
        y: 2
        rotation: -15
    }

    FCS_slats_spoil_status {
        id: fCS_slats_spoil_status3
        x: 510
        y: 2
        rotation: 15
    }

    FCS_slats_spoil_status {
        id: fCS_slats_spoil_status4
        x: 565
        y: 17
        rotation: 15
    }

    FCS_slats_spoil_status {
        id: fCS_slats_spoil_status5
        x: 622
        y: 34
        rotation: 15
    }
}
