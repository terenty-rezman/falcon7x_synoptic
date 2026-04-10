import QtQuick

Image {
    id: self
    source: "images/ELEC_BAS_TIE_CONTACTOR_NORMAL_OPERATION.svg"
    fillMode: Image.PreserveAspectFit
    width: 31
    height: 31

    property int state: (shared_data.generator_off_1 === 0 && shared_data.generator_off_2 === 0 && shared_data.generator_off_3 === 0 && self.button === 1) ? 2 : self.button

    property int button: 0

    Text {
        id: text_
        x: 2
        y: -16
        color: "#d2b60c"
        text: qsTr("TIED")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Arial"
    }

    states: [
        State {
            name: "normal"
            when: self.state === 1

            PropertyChanges {
                target: self
                source: "images/ELEC_BAS_TIE_CONTACTOR_NORMAL_OPERATION.svg"
            }

            PropertyChanges {
                target: text_
                visible: true
            }
        },

        State {
            name: "open_not_faulty"
            when: self.state === 0

            PropertyChanges {
                target: self
                source: "images/ELEC_BAS_TIE_CONTACTOR_OPEN_AND_NOT_FAULTY.svg"
            }

            PropertyChanges {
                target: text_
                visible: false
            }
        },

        State {
            name: "closed_all_gen_online"
            when: self.state === 2

            PropertyChanges {
                target: self
                source: "images/ELEC_BAS_TIE_CONTACTOR_CLOSED_WHEN_ALL_MAIN_GEN_ARE_ONLINE.svg"
            }

            PropertyChanges {
                target: text_
                visible: true
            }
        }
    ]
}
