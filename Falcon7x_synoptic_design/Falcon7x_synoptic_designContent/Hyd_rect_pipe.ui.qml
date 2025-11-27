import QtQuick

Rectangle {
    id: self

    property int state: 0

    width: 207
    height: 5

    color: "#ffffff"

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
