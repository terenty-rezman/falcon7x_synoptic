

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
    width: 342
    height: 193
    visible: true

    color: Constants.backgroundColor

    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/CAS/cas.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }

    CAS_line {
        objectName: "cas_line_1"
        id: rectangle1
        x: 5
        y: 1
    }

    CAS_line {
        objectName: "cas_line_2"
        id: rectangle2
        x: 5
        y: 20
    }

    CAS_line {
        objectName: "cas_line_3"
        id: rectangle3
        x: 5
        y: 39
    }

    CAS_line {
        objectName: "cas_line_4"
        id: rectangle4
        x: 5
        y: 58
    }

    CAS_line {
        objectName: "cas_line_5"
        id: rectangle5
        x: 5
        y: 77
    }

    CAS_line {
        objectName: "cas_line_6"
        id: rectangle6
        x: 5
        y: 96
    }

    CAS_line {
        objectName: "cas_line_7"
        id: rectangle7
        x: 5
        y: 115
    }

    CAS_line {
        objectName: "cas_line_8"
        id: rectangle8
        x: 5
        y: 134
    }

    CAS_line {
        objectName: "cas_line_9"
        id: rectangle9
        x: 5
        y: 153
    }

    CAS_line {
        objectName: "cas_line_10"
        id: rectangle10
        x: 5
        y: 172
    }
}
