import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    color: "#000000"

    Image {
        objectName: "red_cross"
        source: "svg/RED_CROSS.svg"
        anchors.fill: parent
        sourceSize: Qt.size(parent.width,parent.height)
    }

    SystemMenu {

    }

    Text {
        text: window_name
        color: "#fff"
        anchors.right: parent.right
    }
}
