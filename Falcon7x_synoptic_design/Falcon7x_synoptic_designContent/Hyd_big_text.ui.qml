import QtQuick

Text {
    id: self

    property int state: 0

    width: 75
    height: 78

    text: qsTr("BRAKE 1\nI SLATS\nGEARS\nNWS")

    color: "#555555"
    font.letterSpacing: 0.3
    font.pixelSize: 18
    lineHeight: 0.9
    font.family: "Arial"

    states: [
        State {
            when: self.state == 0

            PropertyChanges {
                target: self
                color: "#555555"
            }
        },

        State {
            when: self.state == 1

            PropertyChanges {
                target: self
                color: "#00ff00"
            }
        },

        State {
            when: self.state == 2

            PropertyChanges {
                target: self
                color: "#d2b60c"
            }
        }
    ]
}
