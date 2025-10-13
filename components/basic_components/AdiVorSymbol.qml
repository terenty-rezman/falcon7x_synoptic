import QtQuick 2.15

Rectangle {
    id: self

    property int vor_current: 0
    property int vor_partner: 0

    // onAds_selfChanged: {
    //     self.visible = true;
    //     hide_timer.restart();
    // }

    color: "transparent"
    width: 46
    height: 19
    radius: 4
    border.color: (vor_current == vor_partner) ? "#ffff00" : "#ffffff";
    border.width: (vor_current == vor_partner) ? 2 : 0;

    // Timer {
    //     id: hide_timer
    //     interval: 3000
    //     running: false
    //     repeat: false

    //     onTriggered: {
    //         self.visible = false
    //     }
    // }

    Text {
        id: text_
        text: "VOR" + self.vor_current
        anchors.centerIn: parent
        color: (vor_current == vor_partner) ? "#ffff00" : "#ffffff";
        font.pixelSize: 12
        font.bold: true
        font.family: "Helvetica"
    }
}
