

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Studio.Components

Item {
    id: self
    width: 124
    height: 187

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
    Rectangle {
        id: middle_inlet
        x: 38
        y: 37
        width: 28
        height: 45
        color: "#555555"
        border.color: "#555555"
        border.width: 1
    }
    Text {
        id: _duct_text
        x: 76
        y: 7
        color: "#ffbf00"
        text: qsTr("LO\nPWR")
        font.letterSpacing: 0.1
        font.pixelSize: 13
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.bold: false
        font.family: "Arial"
        visible: true
    }

    property int state: 6

    states: [
        State {
            name: "ON"
            when: self.state === 1
            PropertyChanges {
                target: middle_inlet
                color: "trasparent"
                border.color: "#00ff00"
            }
            PropertyChanges {
                target: _duct_text
                visible: false
            }
        },
        State {
            name: "OFF"
            when: self.state === 2
            PropertyChanges {
                target: middle_inlet
                color: "#555555"
                border.color: "#555555"
            }
            PropertyChanges {
                target: _duct_text
                visible: false
            }
        },
        State {
            name: "whole_green"
            when: self.state === 3
            PropertyChanges {
                target: middle_inlet
                color: "#00FF00"
                border.color: "#00FF00"
            }
            PropertyChanges {
                target: _duct_text
                visible: false
            }
        },

        State {
            name: "bleed_Engine_2_anti-icing_ON_with_S-duct_low_power"
            when: self.state === 6
            PropertyChanges {
                target: middle_inlet
                color: "#ffbf00"
                border.color: "#ffbf00"
            }
            PropertyChanges {
                target: _duct_text
                visible: true
                text: qsTr("LO\nPWR")
            }
        },
        State {
            name: "bleed_Engine_2_anti-icing_ON_with_S-duct_high_power"
            when: self.state === 7
            PropertyChanges {
                target: middle_inlet
                color: "#ffbf00"
                border.color: "#ffbf00"
            }
            PropertyChanges {
                target: _duct_text
                visible: true
                text: qsTr("HI\nPWR")
            }
        },
        State {
            name: "bleed_Engine_2_anti-icing_ON_with_S-duct_valve_in_abnormal_position"
            when: self.state === 8
            PropertyChanges {
                target: middle_inlet
                color: "#ffbf00"
                border.color: "#ffbf00"
            }
            PropertyChanges {
                target: _duct_text
                visible: false
            }
        }
    ]
}
