import QtQuick 2.15

Rectangle {
    id: self

    property real ab_pos: 0

    property string green_color: "#00ff00"

    color: (ab_pos < 0.95) ? "#000" : green_color
    width: 30
    height: 68
    visible: ab_pos > 0.01
    border.color: green_color
    border.width: 1

    Rectangle {
        color: green_color
        width: parent.width / 2
        anchors.bottom: parent.bottom
        height: ab_pos * parent.height
    }

    Text {
        text: "A\nB\n1" 
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        horizontalAlignment: Text.AlignHCenter 
        color: green_color
        font.pixelSize: 14
        font.bold: true
        font.family: "Helvetica"
        width: parent.width / 2
    }

    Text {
        text: "A\nB\n2" 
        anchors.fill: parent
        color: "#000"
        font.pixelSize: 14
        font.bold: true
        font.family: "Helvetica"
        horizontalAlignment: Text.AlignHCenter 
        verticalAlignment: Text.AlignVCenter
        visible: ab_pos > 0.95
    }
}
