import QtQuick

Image {
    id: self
    source: "images/BLEED_VALVE_OPERATING.svg"
    fillMode: Image.PreserveAspectFit
    width: 28
    height: 57

    property int state: 1

    states: [
        State {
            name: "operating"
            when: self.state === 1

            PropertyChanges {
                target: self
                source: "images/BLEED_VALVE_OPERATING.svg"
            }
        },

        State {
            name: "stopped"
            when: self.state === 0

            PropertyChanges {
                target: self
                source: "images/BLEED_VALVE_STOPPED.svg"
            }
        },

        State {
            name: "invalid_data"
            when: self.state === 2

            PropertyChanges {
                target: self
                source: "images/BLEED_VALVE_INVALID_DATA.svg"
            }
        }
    ]
}
