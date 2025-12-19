

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

//import Falcon7x_synoptic_design 1.0
Item {
    id: self
    width: 63
    height: 39
    // visible: true

    //color: Constants.backgroundColor
    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/ECS.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    property int state: 2

    Rectangle {
        id: streak
        x: 1
        y: 18
        width: 31
        height: 6
        color: "#00ff00"
    }
    ArcItem {
        id: arc
        x: 0
        y: 4
        width: 33
        height: 33
        strokeColor: "#00ff00"
        strokeWidth: 6
        end: 360
        fillColor: "#00000000"
    }

    Text {
        id: status_text
        x: 34
        y: 0
        visible: true
        color: "#ffbf00"
        text: qsTr("OFF")
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
        font.bold: false
    }

    states: [
        State {
            name: "auto"
            when: self.state === 1

            PropertyChanges {
                target: streak
                color: "#00ff00"
                visible: true
            }
            PropertyChanges {
                target: arc
                strokeColor: "#00ff00"
                visible: true
            }
            PropertyChanges {
                target: status_text
                visible: false
            }
        },
        State {
            name: "on"
            when: self.state === 2

            PropertyChanges {
                target: streak
                color: "#00ff00"
                rotation: 90
                visible: true
            }
            PropertyChanges {
                target: arc
                strokeColor: "#00ff00"
                visible: true
            }
            PropertyChanges {
                target: status_text
                visible: true
                text: qsTr("OFF")
            }
        },
        State {
            name: "off"
            when: self.state === 3

            PropertyChanges {
                target: streak
                color: "#00ff00"
                visible: true
            }
            PropertyChanges {
                target: arc
                strokeColor: "#00ff00"
                visible: true
            }
            PropertyChanges {
                target: status_text
                visible: true
                text: qsTr("ON")
            }
        }
    ]
}
