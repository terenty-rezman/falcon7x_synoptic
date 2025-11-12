import QtQuick

Rectangle {
    id: self

    property int state: 0

    width: 207
    height: 5

    color: "#ffffff"
    border.color: "#ffffff"

    border.width: 1

    states: [
        State {
            when: self.state == 0

            PropertyChanges {
                target: self
                color: "#555555"
                border.color: "#555555"
            }
        },

        State {
            when: self.state == 1

            PropertyChanges {
                target: self
                color: "#00ff00"
                border.color: "#00ff00"
            }
        },

        State {
            when: self.state == 2

            PropertyChanges {
                target: self
                color: "#d2b60c"
                border.color: "#d2b60c"
            }
        },

        State {
            when: self.state == 3

            PropertyChanges {
                target: self
                color: "#000"
                border.color: "#555555"
            }
        }
    ]
}
