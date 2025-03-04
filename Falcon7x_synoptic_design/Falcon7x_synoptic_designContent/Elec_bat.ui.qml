import QtQuick

Image {
    id: self
    property alias text: text_.text
    source: "images/ELEC_BAT_NORMAL_OPERATION.svg"
    fillMode: Image.PreserveAspectFit
    width: 64
    height: 106

    property int state: 1

    Text {
        id: text_
        x: 16
        y: 73
        width: 33
        height: 13
        color: "#00ff00"
        text: qsTr("BAT 2")
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
                source: "images/ELEC_BAT_NORMAL_OPERATION.svg"
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
                source: "images/ELEC_BAT_OPEN_AND_NO_FAULTS.svg"
            }

            PropertyChanges {
                target: text_
                visible: false
            }
        }
    ]
}
