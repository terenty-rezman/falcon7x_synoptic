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
        TriangleItem {
            id: triangle
            x: 67
            y: 36
            width: 10
            height: 8
            radius: 0
            fillColor: "#00ff00"
            strokeColor: "#00ff0000"
            rotation: 90
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
            x: 271
            y: 62
            width: 67
            height: 2
            color: "#555555"
            border.color: "#00000000"
            rotation: -15
        }
    }
    FCS_mfcc_frame {
        id: fCS_mfcc_frame
        x: 21
        y: 78
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
}
