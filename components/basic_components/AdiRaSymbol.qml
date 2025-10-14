import QtQuick 2.15

Rectangle {
    id: self

    property int ra_current: 0
    property int ra_partner: 0
    property int ra_default: 0

    // onAds_selfChanged: {
    //     self.visible = true;
    //     hide_timer.restart();
    // }

    color: "transparent"
    width: 19
    height: 46
    radius: 4
    border.color: (ra_current == ra_partner) ? "#ffff00" : "#ffffff";
    border.width: 2
    visible: ra_current != ra_default

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
        text: "R\nA\n" + self.ra_current
        anchors.centerIn: parent
        color: (ra_current == ra_partner) ? "#ffff00" : "#ffffff";
        font.pixelSize: 12
        font.bold: true
        font.family: "Helvetica"
    }
}
