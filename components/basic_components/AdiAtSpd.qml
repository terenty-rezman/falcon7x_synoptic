import QtQuick 2.15

Rectangle {
    id: self

    property int state: 1
    property int ap_mode: 0
    property int at_enabled: 0

    color: "#55000000"
    width: 63
    height: 25
    radius: 4

    Text {
        id: text_
        text: "A/T SPD"
        anchors.centerIn: parent
        color: "#00ff00"
        font.pixelSize: 14
        font.bold: false
        font.family: "Helvetica"
    }

    states: [
        State {
            name: "on"
            when: self.ap_mode == 2 && self.at_enabled == 1

            PropertyChanges {
                target: self
                color: "#66FF66"
            }

            PropertyChanges {
                target: text_
                color: "#bb000000"
            }
        },

        State {
            when: self.ap_mode !== 2 || self.at_enabled != 1
            name: "off"

            PropertyChanges {
                target: self
                color: "#55000000"
            }

            PropertyChanges {
                target: text_
                color: "#66FF66"
            }
        }
    ]
}
