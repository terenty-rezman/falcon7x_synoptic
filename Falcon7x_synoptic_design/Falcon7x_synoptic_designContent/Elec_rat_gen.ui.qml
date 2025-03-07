import QtQuick

Image {
    id: self
    width: 50
    height: 118
    source: "images/ELEC_RAT_GEN_NOT_LOAD.svg"
    fillMode: Image.PreserveAspectFit

    property int state: 0

    Text {
        id: text_
        x: 12
        y: 65
        color: "#00ff00"
        text: qsTr("RAT\nGEN")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        maximumLineCount: 2
        font.family: "Arial"
    }

    states: [
        State {
            name: "not_load"
            when: self.state === 0

            PropertyChanges {
                target: self
                source: "images/ELEC_RAT_GEN_NOT_LOAD.svg"
            }

            PropertyChanges {
                target: text_
                color: "#000000"
            }
        },

        State {
            name: "normal"
            when: self.state === 1

            PropertyChanges {
                target: self
                source: "images/ELEC_RAT_GEN_NORMAL_OPERATION.svg"
            }

            PropertyChanges {
                target: text_
                color: "#00ff00"
            }
        },

        State {
            name: "yellow"
            when: self.state === 2

            PropertyChanges {
                target: self
                source: "images/ELEC_RAT_GEN_YELLOW.svg"
            }

            PropertyChanges {
                target: text_
                color: "#000000"
            }
        }
    ]
}
