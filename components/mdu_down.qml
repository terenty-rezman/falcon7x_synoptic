import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

Rectangle {
    anchors.fill: parent
    color: "#000000"

    SystemMenu {}

    Synoptic {
        id: synoptic_1
        width: 3 * parent.width / 3
        height: parent.height / 2
        currentIndex: 2
    }

    Synoptic {
        id: synoptic_2
        objectName: "synoptic_tab_bar"
        y: parent.height / 2
        width: 3 * parent.width / 3
        height: parent.height / 2
        currentIndex: 1
    }

    Text {
        text: "down"
        color: "#fff"
        anchors.right: parent.right
    }
}
