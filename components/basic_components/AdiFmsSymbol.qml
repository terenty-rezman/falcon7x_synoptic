import QtQuick 2.15

Rectangle {
    id: self

    property int fms_current: 1
    property int fms_partner: 0
    property int fms_default: 0

    // onAds_selfChanged: {
    //     self.visible = true;
    //     hide_timer.restart();
    // }

    color: "transparent"
    width: 19
    height: 66
    radius: 4
    border.color: (fms_current == fms_partner) ? "#ffff00" : "#ffffff";
    border.width: (fms_current == fms_default) ? 0 : 2

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
        text: "F\nM\nS\n" + self.fms_current
        anchors.centerIn: parent
        // color: (fms_current == fms_partner) ? "#ffff00" : "#ffffff"
        color: "#ffffff"
        font.pixelSize: 14
        font.bold: true
        font.family: "Helvetica"
    }
}
