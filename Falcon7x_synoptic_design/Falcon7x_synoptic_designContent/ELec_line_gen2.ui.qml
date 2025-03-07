import QtQuick

Item {
    id: self

    property int state: 0

    property string green: "#00ff00"
    property string yellow: "#d2b60c"

    Rectangle {
        id: rectangle1
        x: 489
        y: 76
        width: 32
        height: 4
        color: "#00ff00"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle2
        x: 517
        y: 80
        width: 4
        height: 3
        color: "#00ff00"
        border.color: "#00000000"
    }

    states: [
        State {
            name: "on"
            when: self.state === 1

            PropertyChanges {
                target: rectangle1
                color: self.green
            }

            PropertyChanges {
                target: rectangle2
                color: self.green
            }
        },

        State {
            name: "off"
            when: self.state === 0

            PropertyChanges {
                target: rectangle1
                color: self.yellow
            }

            PropertyChanges {
                target: rectangle2
                color: self.yellow
            }
        }
    ]
}
