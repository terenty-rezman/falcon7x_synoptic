

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick

Item {
    id: self
    width: 53
    height: 19

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
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 53
        height: 19
        color: "#ffbf00"
        visible: false
    }
    Text {
        id: _text
        x: 2
        y: 0
        width: 50
        height: 19
        visible: true
        color: "#00ff00"
        text: qsTr("AUTO")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignLeft
        lineHeight: 0.9
        font.family: "Arial"
    }
    property int text_state: 1

    states: [
        State {
            name: "auto"
            when: self.text_state === 1
            PropertyChanges {
                target: _text
                color: "#00ff00"
                text: qsTr("AUTO")
                font.letterSpacing: -0.3
                font.pixelSize: 18
            }
            PropertyChanges {
                target: rectangle
                visible: false
            }
        },
        State {
            name: "man"
            when: self.text_state === 2
            PropertyChanges {
                target: _text
                color: "#ffbf00"
                text: qsTr("MAN")
                font.letterSpacing: -0.3
                font.pixelSize: 18
            }
            PropertyChanges {
                target: rectangle
                visible: false
            }
        },
        State {
            name: "auto_fail"
            when: self.text_state === 3
            PropertyChanges {
                target: _text
                color: "#000000"
                text: qsTr("AUTO")
                font.letterSpacing: -0.3
                font.pixelSize: 18
            }
            PropertyChanges {
                target: rectangle
                visible: true
            }
        }
    ]
}
