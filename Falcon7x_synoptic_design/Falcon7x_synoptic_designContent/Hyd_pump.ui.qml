import QtQuick

Image {
    id: self
    x: 287
    y: 39
    width: 37
    height: 37
    source: "images/HYD_PUMP_INVALID_DATA_37_37.svg"

    property int state: 0

    states: [
        State {
            when: self.state == 0

            PropertyChanges {
                target: self
                source: "images/HYD_PUMP_NOT_RUNNING_37_37.svg"
            }
        },

        State {
            when: self.state == 1

            PropertyChanges {
                target: self
                source: "images/HYD_PUMP_RUNNING_37_37.svg"
            }
        },

        State {
            when: self.state == 2

            PropertyChanges {
                target: self
                source: "images/HYD_PUMP_FAILED_37_37.svg"
            }
        },

        State {
            when: self.state == 3

            PropertyChanges {
                target: self
                source: "images/HYD_PUMP_INVALID_DATA_37_37.svg"
            }
        }
    ]
}
