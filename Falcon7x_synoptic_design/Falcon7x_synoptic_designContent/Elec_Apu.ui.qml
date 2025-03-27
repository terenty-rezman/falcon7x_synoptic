import QtQuick

Image {
    id: self
    width: 50
    height: 118
    source: "images/ELEC_APU_NORMAL_OPERATION.svg"
    fillMode: Image.PreserveAspectFit

    property int master_on: 0
    property real n1: 0

    Text {
        id: text_
        x: 13
        y: 71
        color: "#00ff00"
        text: qsTr("APU")
        font.pixelSize: 12
        font.family: "Arial"
    }

    states: [
        State {
            name: "master_off"
            when: self.master_on === 0

            PropertyChanges {
                target: self
                source: "images/ELEC_APU_MASTER_OFF.svg"
            }

            PropertyChanges {
                target: text_
                color: "#000000"
            }
        },

        State {
            name: "normal"
            when: self.n1 > 90

            PropertyChanges {
                target: self
                source: "images/ELEC_APU_NORMAL_OPERATION.svg"
            }

            PropertyChanges {
                target: text_
                color: "#00ff00"
            }
        },

        State {
            name: "normal"
            when: self.n1 > 50

            PropertyChanges {
                target: self
                source: "images/ELEC_APU_GLC_AND_BC1_ARE_CLOSED.svg"
            }

            PropertyChanges {
                target: text_
                color: "#00ff00"
            }
        },

        State {
            name: "open_not_ready"
            when: self.n1 < 50

            PropertyChanges {
                target: self
                source: "images/ELEC_APU_GLC_NOT_READY_TO_LOAD.svg"
            }

            PropertyChanges {
                target: text_
                color: "#000000"
            }
        }
    ]
}
