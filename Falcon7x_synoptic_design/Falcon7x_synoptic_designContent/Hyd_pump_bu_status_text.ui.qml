import QtQuick

Text {
    id: self

    property int state: 4

    width: 50
    height: 21
    text: qsTr("- - - -")
    color: "#6fa533"
    font.family: "Arial"
    font.letterSpacing: 0.2
    font.pixelSize: 18
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter

    states: [
        State {
            when: self.state == 0

            PropertyChanges {
                target: self
                text: "OFF"
                color: "#d2b60c"
            }
        },

        State {
            when: self.state == 1

            PropertyChanges {
                target: self
                text: "AUTO"
                color: "#6fa533"
            }
        },

        State {
            when: self.state == 2

            PropertyChanges {
                target: self
                text: "ON"
                color: "#d2b60c"
            }
        },

        State {
            when: self.state == 3

            PropertyChanges {
                target: self
                text: "TEST"
                color: "#d2b60c"
            }
        },

        State {
            when: self.state == 4

            PropertyChanges {
                target: self
                text: "- - - -"
                color: "#d2b60c"
            }
        }
    ]
}
