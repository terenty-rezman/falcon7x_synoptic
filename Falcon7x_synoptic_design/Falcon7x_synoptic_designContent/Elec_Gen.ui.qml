import QtQuick

Image {
    id: self
    property alias text: text_.text
    property real n1: 0
    property int state: 1

    width: 50
    height: 118
    source: "images/ELEC_GEN_NORMAL_OPERATION.svg"
    fillMode: Image.PreserveAspectFit

    Text {
        id: text_
        x: 9
        y: 66
        width: 33
        height: 30
        color: "#00ff00"
        text: qsTr("ENG3\nGEN")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        font.family: "Arial"
    }

    Text {
        id: off
        x: 40
        y: 19
        width: 33
        height: 15
        visible: false
        color: "#798372"
        text: qsTr("OFF")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        font.family: "Arial"
    }

    states: [
        State {
            name: "glc_closed"
            when: self.n1 < 10

            PropertyChanges {
                target: self
                source: "images/ELEC_GEN_NOT_READY_TO_LOAD(OFF_NOT_FAULTY).svg"
            }

            PropertyChanges {
                target: text_
                color: "#000000"
            }

            PropertyChanges {
                target: off
                visible: false
            }
        },

        State {
            name: "normal"
            when: self.state === 1

            PropertyChanges {
                target: self
                source: "images/ELEC_GEN_NORMAL_OPERATION.svg"
            }

            PropertyChanges {
                target: text_
                color: "#00ff00"
            }

            PropertyChanges {
                target: off
                visible: false
            }
        },

        State {
            name: "open_not_ready"
            when: self.state === 0

            PropertyChanges {
                target: self
                source: "images/ELEC_GEN_NOT_READY_TO_LOAD(OFF_NOT_FAULTY).svg"
            }

            PropertyChanges {
                target: text_
                color: "#000000"
            }

            PropertyChanges {
                target: off
                visible: true
            }
        }
    ]
}
