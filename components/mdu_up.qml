import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: mdu

    anchors.fill: parent
    color: "#000000"

    SystemMenu {}

    Item {
        id: window_manager

        property var windows: []
        property var components: (new Map())

        function createWindows() {
            synoptic_2.y = parent.height / 2;
            synoptic_2.width = 2 * parent.width / 3;
            synoptic_2.height = parent.height / 2;
            synoptic_2.visible = true;
        }
    }

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
