import QtQuick

Rectangle {
    id: self
    width: 51
    height: 22
    color: "transparent"
    // color: "#ff00ff"
    border.color: "white"
    border.width: 1.5
    radius: 1

    property real amps: 150
    property real apu_n1: 0

    Text {
        id: _text
        color: "#00ff00"
        anchors.fill: parent
        // width: 51
        // height: 22
        text: (-self.amps).toFixed(0)
        font.pixelSize: 17
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        styleColor: "#6b37ae"
        font.family: "Arial"
        rightPadding: 3
    }

    Text {
        id: _text1
        x: 55
        y: 2
        color: "#ffffff"
        text: qsTr("A")
        font.pixelSize: 15
        font.family: "Arial"
        font.bold: true
    }

    states: [
        State {
            name: "none"
            when: self.apu_n1 < 1 && self.apu_n1 > 15

            PropertyChanges {
                target: self
                color: "#ff00ff"
            }

            PropertyChanges {
                target: _text
                color: "#00ff00"
            }
        },

        State {
            name: "yellow"
            when: self.apu_n1 >= 1 && self.apu_n1 <= 15 

            PropertyChanges {
                target: self
                color: "#fccd07"
            }

            PropertyChanges {
                target: _text
                color: "#000000"
            }
        }
    ]
}
