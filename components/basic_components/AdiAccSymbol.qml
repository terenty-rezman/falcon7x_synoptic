import QtQuick 2.15

Rectangle {
    id: self

    color: "#fa4c1e"
    width: 40
    height: 26
    radius: 3
    visible: true

    Text {
        id: text_
        text: "ACC"
        anchors.centerIn: parent
        color: "#ffffff"
        font.pixelSize: 16
        font.bold: true
        font.family: "Helvetica"
    }
}
