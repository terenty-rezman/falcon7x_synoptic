

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick

Item {
    id: self
    width: 45
    height: 19

    // visible: true
    property int value: 22
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
        id: dash_1
        x: 4
        y: 9
        width: 7
        height: 2
        color: "#ffbf00"
        border.color: "#00000000"
        border.width: 0
        visible: false
    }

    Rectangle {
        id: dash_2
        x: 14
        y: 9
        width: 7
        height: 2
        color: "#ffbf00"
        border.color: "#00000000"
        border.width: 0
        visible: false
    }

    Text {
        id: numbers
        x: 0
        y: 0
        width: 23
        height: 19
        visible: true
        color: "#cc00cc"
        text: self.value
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
    }

    Text {
        id: celsius
        x: 21
        y: 0
        width: 23
        height: 19
        visible: true
        color: "#ffffff"
        text: qsTr("°C")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
    }

    Text {
        id: percent
        x: 21
        y: 0
        width: 23
        height: 19
        visible: true
        color: "#ffffff"
        text: qsTr("%")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
    }
    property int state: 1

    states: [
        State {
            name: "auto"
            when: self.state === 1
            PropertyChanges {
                target: numbers
                color: "#cc00cc"
            }
            PropertyChanges {
                target: celsius
                visible: true
            }
            PropertyChanges {
                target: percent
                visible: false
            }
            PropertyChanges {
                target: dash_1
                visible: false
            }
            PropertyChanges {
                target: dash_1
                visible: false
            }
        },
        State {
            name: "man"
            when: self.state === 2
            PropertyChanges {
                target: numbers
                color: "#00ff00"
            }
            PropertyChanges {
                target: celsius
                visible: false
            }
            PropertyChanges {
                target: percent
                visible: true
            }
            PropertyChanges {
                target: dash_1
                visible: false
            }
            PropertyChanges {
                target: dash_1
                visible: false
            }
        },
        State {
            name: "auto_fail"
            when: self.state === 3
            PropertyChanges {
                target: numbers
                visible: false
            }
            PropertyChanges {
                target: celsius
                visible: false
            }
            PropertyChanges {
                target: percent
                visible: false
            }
            PropertyChanges {
                target: dash_1
                visible: true
            }
            PropertyChanges {
                target: dash_1
                visible: true
            }
        }
    ]
}
