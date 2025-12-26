

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick

Item {
    id: self
    width: 83
    height: 35

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
    Text {
        id: top_text
        x: -12
        y: 0
        width: 104
        height: 19
        visible: true
        color: "#00ff00"
        text: qsTr("NORMAL")
        font.letterSpacing: 0.5
        font.pixelSize: 17
        horizontalAlignment: Text.AlignHCenter
        lineHeight: 0.9
        leftPadding: 4
        font.family: "Arial"
    }

    Text {
        id: _text15
        x: 16
        y: 15
        color: "#a8b49e"
        text: qsTr("PACK")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignTop
        font.weight: Font.Medium
        font.styleName: "Обычный"
        font.family: "Arial"
    }
    property int text_state: 1

    states: [
        State {
            name: "normal"
            when: self.text_state === 1
            PropertyChanges {
                target: top_text
                color: "#00ff00"
                text: qsTr("NORMAL")
            }
        },
        State {
            name: "pax_off"
            when: self.text_state === 2
            PropertyChanges {
                target: top_text
                color: "#ffbf00"
                text: qsTr("PAX OFF")
            }
        },
        State {
            name: "crew_off"
            when: self.text_state === 3
            PropertyChanges {
                target: top_text
                color: "#ffbf00"
                text: qsTr("CREW OFF")
            }
        },
        State {
            name: "backup"
            when: self.text_state === 4
            PropertyChanges {
                target: top_text
                color: "#ffbf00"
                text: qsTr("BACKUP")
            }
        },
        State {
            name: "emerg"
            when: self.text_state === 5
            PropertyChanges {
                target: top_text
                color: "#ffbf00"
                text: qsTr("EMERG")
            }
        }
    ]
}
