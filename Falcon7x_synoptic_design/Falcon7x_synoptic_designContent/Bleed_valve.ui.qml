

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

Item {
    id: self
    width: 33
    height: 33
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
    property int state: 6

    Rectangle {
        id: streak
        x: 1
        y: 14
        width: 31
        height: 6
        color: "#00ff00"
    }
    ArcItem {
        id: arc
        x: 0
        y: 0
        width: 33
        height: 33
        strokeColor: "#00ff00"
        strokeWidth: 6
        end: 360
        fillColor: "#00000000"
    }

    Image {
        id: valve_inv_data
        x: -10
        y: 0
        source: "images/BLEED_VALVE_INVALID_DATA.svg"
        rotation: 90
        visible: false
        width: 52
        height: 33
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
                target: arc
                strokeColor: "#00ff00"
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
                target: arc
                strokeColor: "#a8b49e"
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
                target: arc
                strokeColor: "#dfd229"
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
                target: arc
                strokeColor: "#dfd229"
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
                target: arc
                strokeColor: "#dfd229"
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
            PropertyChanges {
                target: arc
                visible: false
            }
        }
    ]
}
