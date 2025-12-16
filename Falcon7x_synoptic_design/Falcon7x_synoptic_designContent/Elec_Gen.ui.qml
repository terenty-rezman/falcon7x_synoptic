import QtQuick

Image {
    id: self
    property alias text: text_.text
    property real n2: 0

    property int on: 1
    property bool failed_off: true

    property int my_state: 0

    onOnChanged: set_state() 
    onFailed_offChanged: set_state() 

    function set_state() {
        if (failed_off) {
            self.my_state = 2;
        }
        else if(on) {
            self.my_state = 1
        } else {
            self.my_state = 0;
        }
    }

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
            name: "failed_off"
            when: self.my_state == 2

            PropertyChanges {
                target: self
                source: "images/ELEC_GEN_FAULT_OR_READY_TO_LOAD_AND_NO_MAIN_BUS.svg"
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
            name: "glc_closed"
            when: self.n2 < 51.8

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
            when: self.my_state == 1

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
            when: self.my_state == 0

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
