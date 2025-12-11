import QtQuick

Image {
    id: self
    source: "images/BLEED_APU_OPERATING.svg"
    fillMode: Image.PreserveAspectFit
    width: 28
    height: 57

    property int state: 1

    Rectangle {
        id: rectangle
        x: 12
        y: -13
        width: 5
        height: 13
        color: "#ffbf00"
        border.color: "#ffbf00"
    }

    states: [
        State {
            name: "operating"
            when: self.state === 1

            PropertyChanges {
                target: self
                source: "images/BLEED_APU_OPERATING.svg"
            }
        },

        State {
            name: "stopped"
            when: self.state === 0

            PropertyChanges {
                target: self
                source: "images/BLEED_APU_STOPPED.svg"
            }
        },

        State {
            name: "invalid_data"
            when: self.state === 2

            PropertyChanges {
                target: self
                source: "images/BLEED_APU_INVALID_DATA.svg"
            }
        }
    ]
}
