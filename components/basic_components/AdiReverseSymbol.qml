import QtQuick 2.15

Rectangle {
    id: self

    property int mode: 0

    color: "#EE4340"
    width: 115
    height: 25
    radius: 4

    visible: (mode > 0) ? true : false

    Text {
        id: text_
        text: "REVERSE"
        anchors.centerIn: parent
        color: "#fff"
        font.pixelSize: 14
        font.bold: true
        font.family: "Helvetica"
    }
}
