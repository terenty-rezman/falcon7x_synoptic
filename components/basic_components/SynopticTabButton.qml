import QtQuick 2.15
import QtQuick.Controls


TabButton {
    id: button
    text: qsTr("STAT")
    height: 37

    contentItem: Text {
        text: button.text
        // font: button.font
        font.pixelSize: 20
        font.bold: true
        color: button.checked ? "#00FC00" : "#ffffff"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    background: Rectangle {
        implicitWidth: 100
        implicitHeight: 40
        color: button.checked ? "#221E1F" : "#7F7F7F" 
        border.color: button.checked ? "#00FC00" : "#000000"
        border.width: button.checked ? 4 : 2
        radius: 4

        // Rectangle {
        //     visible: button.checked
        //     height: 20
        //     anchors.left: parent.left
        //     anchors.right: parent.right
        //     y: 34 
        //     color: "red"
        // }
    }
}
