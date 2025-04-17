import QtQuick

Image {
    id: self
    width: 50
    height: 118
    source: "images/ELEC_APU_NORMAL_OPERATION.svg"
    fillMode: Image.PreserveAspectFit

    property int master_on: 0
    property real n1: 0
    property int startup_stage: 0

    Text {
        id: text_
        x: 13
        y: 71
        color: "#00ff00"
        text: qsTr("APU")
        font.pixelSize: 12
        font.family: "Arial"
    }

    Text {
        id: start_
        x: 1
        y: 167
        width: 50
        height: 23
        color: "#21da1b"
        text: qsTr("START")
        font.pixelSize: 15
        font.family: "Arial"
        visible: false
    }

    Text {
        id: ready_
        x: -2
        y: 194
        width: 55
        height: 17
        color: "#21da1b"
        text: qsTr("READY")
        font.pixelSize: 15
        font.family: "Arial"
        visible: false
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
            name: "startup_1"
            when: self.startup_stage === 1

            PropertyChanges {
                target: self
                source: "images/ELEC_APU_GLC_AND_BC1_ARE_CLOSED.svg"
            }

            PropertyChanges {
                target: start_
                visible: true
            }

            PropertyChanges {
                target: text_
                color: "#000000"
            }
        },

        State {
            name: "startup_2"
            when: self.startup_stage === 2

            PropertyChanges {
                target: self
                source: "images/ELEC_APU_GLC_NOT_READY_TO_LOAD.svg"
            }

            PropertyChanges {
                target: start_
                visible: true
            }

            PropertyChanges {
                target: text_
                color: "#000000"
            }
        },

        State {
            name: "startup_3"
            when: self.startup_stage === 3

            PropertyChanges {
                target: self
                source: "images/ELEC_APU_STARTER_FAULT_OR_APU_READY_TO_LOAD.svg"
            }

            PropertyChanges {
                target: start_
                visible: false
            }

            PropertyChanges {
                target: ready_
                visible: true
            }

            PropertyChanges {
                target: text_
                color: "#000000"
            }
        },

        State {
            name: "startup_4"
            when: self.startup_stage === 4

            PropertyChanges {
                target: self
                source: "images/ELEC_APU_GLC_AND_BC1_ARE_CLOSED.svg"
            }

            PropertyChanges {
                target: start_
                visible: true
            }

            PropertyChanges {
                target: ready_
                visible: false
            }

            PropertyChanges {
                target: text_
                color: "#000000"
            }
        },

        State {
            name: "normal"
            when: self.n1 > 95

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
            name: "not_ready"
            when: self.n1 < 95

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
