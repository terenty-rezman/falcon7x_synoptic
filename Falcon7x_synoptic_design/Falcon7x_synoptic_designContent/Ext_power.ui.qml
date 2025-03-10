import QtQuick

Rectangle {
    id: self
    width: 56
    height: 38
    color: "#00ff00"

    property int state: 0

    Text {
        id: _text
        x: 8
        y: 8
        text: qsTr("EXT\nPOWER")
        font.pixelSize: 11
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        wrapMode: Text.WordWrap
        maximumLineCount: 2
        fontSizeMode: Text.VerticalFit
        font.family: "Arial"
    }

    states: [
        State {
            name: "on"
            when: self.state === 1

            PropertyChanges {
                target: self
                color: "#00ff00"
            }
        },

        State {
            name: "off"
            when: self.state === 0

            PropertyChanges {
                target: self
                color: "#555555"
            }
        }
    ]
}
