

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
    Text {
        id: numbers
        x: 0
        y: 0
        width: 23
        height: 19
        visible: true
        color: "#00ff00"
        text: "30"
        font.letterSpacing: -0.5
        font.pixelSize: 19
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
    }

    Text {
        id: celsius
        x: 20
        y: 0
        width: 23
        height: 19
        visible: true
        color: "#ffffff"
        text: qsTr("°C")
        font.letterSpacing: -0.3
        font.pixelSize: 19
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        font.family: "Arial"
    }

    property int state: 1

    states: [
        State {
            name: "green"
            when: self.state === 1
            PropertyChanges {
                target: numbers
                color: "#00ff00"
            }
        },
        State {
            name: "amber"
            when: self.state === 2
            PropertyChanges {
                target: numbers
                color: "#ffbf00"
            }
        }
    ]
}
