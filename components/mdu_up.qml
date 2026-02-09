import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: mdu

    anchors.fill: parent
    color: "#000000"

    SystemMenu {}

    Synoptic {
        id: synoptic_1
        width: 2 * parent.width / 3 
        height: parent.height / 2
        currentIndex: 4
        // visible: false
    }

    Synoptic {
        id: synoptic_2
        y: parent.height / 2
        width: 2 * parent.width / 3
        height: parent.height / 2
        currentIndex: 3
        // visible: false
    }

    Text {
        text: "up"
        color: "#fff"
        anchors.right: parent.right
    }
}
