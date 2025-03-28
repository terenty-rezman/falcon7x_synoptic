import QtQuick

Rectangle {
    id: self
    width: 44
    height: 23
    color: "transparent"
    border.color: "white"
    border.width: 1.5
    radius: 1

    property real temp: 25

    Text {
        id: _text
        color: "#00ff00"
        anchors.fill: parent
        // width: 51
        // height: 22
        text: self.temp.toFixed(0)
        font.pixelSize: 17
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.family: "Arial"
        rightPadding: 3
    }

    Text {
        id: _text1
        x: 45
        y: 2
        color: "#ffffff"
        text: qsTr("°C")
        font.pixelSize: 15
        font.family: "Arial"
        font.bold: true
    }
}
