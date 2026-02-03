import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {
    id: self 

    visible: false

    property string cyan_color: "#00FFFF"
    readonly property int line_width: 2

    anchors.fill: parent

    // left border
    Rectangle {
        width: self.line_width
        color: cyan_color 

        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    // left border
    Rectangle {
        width: self.line_width
        color: cyan_color 

        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
    }

    // top border
    Rectangle {
        height: self.line_width
        color: cyan_color 

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
    }

    // bottom border
    Rectangle {
        height: self.line_width
        color: cyan_color 

        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }

    Connections {
        target: backend 

        function onUpdateMousePos(x, y, x1, y1) {
            let local_xy = self.mapFromGlobal(x, y);
            let local_x1y1 = self.mapFromGlobal(x1, y1);

            if (self.contains(local_xy) || self.contains(local_x1y1)) 
            {
                self.visible = true;
            } else {
                self.visible = false;
            }
        }
    }
}
