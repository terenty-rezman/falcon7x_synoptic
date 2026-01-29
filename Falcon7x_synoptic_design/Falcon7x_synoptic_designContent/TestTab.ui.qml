

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Falcon7x_synoptic_design
import QtQuick.Studio.Components
import QtQuick.VectorImage
import "../../components/basic_components"
import Falcon7x_synoptic_design 1.0

Rectangle {
    id: rectangle
    width: 684
    height: 342
    visible: true

    color: Constants.backgroundColor

    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/Test.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    Button_synoptic {
        id: cvr
        x: 25
        y: 43
        width: 139
        height: 34
        text: "CVR"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: lights
        x: 25
        y: 102
        width: 139
        height: 34
        text: "LIGHTS"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: wdshield
        x: 25
        y: 172
        width: 139
        height: 34
        text: "WDSHIELD"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: wx_radar
        x: 191
        y: 172
        width: 139
        height: 34
        text: "WX RADAR"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: rad_alt
        x: 191
        y: 102
        width: 139
        height: 34
        text: "RAD ALT"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: egpws
        x: 191
        y: 43
        width: 139
        height: 34
        text: "EGPWS"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: fcs
        x: 355
        y: 43
        width: 139
        height: 34
        text: "FCS"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: rat
        x: 355
        y: 102
        width: 139
        height: 34
        text: "RAT"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: ecs
        x: 355
        y: 172
        width: 139
        height: 34
        text: "ECS EMERG"
        font.letterSpacing: -0.59
        font.pointSize: 17
        font.bold: true
    }
    Button_synoptic {
        id: lightning
        x: 355
        y: 232
        width: 139
        height: 34
        text: "LIGHTNING"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: clr_fault
        x: 355
        y: 290
        width: 139
        height: 34
        text: "CLR FAULT"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: ice
        x: 521
        y: 43
        width: 139
        height: 34
        text: "ICE"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: tcas
        x: 521
        y: 102
        width: 139
        height: 34
        text: "TCAS"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
    Button_synoptic {
        id: servicing
        x: 521
        y: 290
        width: 139
        height: 34
        text: "SERVICING"
        font.letterSpacing: -0.59
        font.pointSize: 19
        font.bold: true
    }
}
