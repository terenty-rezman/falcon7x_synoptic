import QtQuick

Item {
    id: self
    width: 85
    height: 20
    Text {
        id: _text
        width: 85
        height: 20
        color: "#ffffff"
        text: qsTr("C/B OUT:")
        font.pixelSize: 15
        font.bold: false
    }
    Text {
        id: _text1
        x: 64
        y: 0
        color: "#ffffff"
        text: qsTr("00")
        font.pixelSize: 15
    }
}
