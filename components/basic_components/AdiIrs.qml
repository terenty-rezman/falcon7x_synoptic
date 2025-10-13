import QtQuick 2.15

Rectangle {
    id: self

    property int irs_default: 0
    property int irs_current: 0
    property int irs_partner: 0

    // onIrs_currentChanged: {
    //     self.visible = true;
    //     hide_timer.restart();
    // }

    color: "transparent"
    width: 19
    height: 66
    radius: 4
    visible: irs_default != irs_current
    border.color: (irs_current == irs_partner) ? "#ffff00" : "#ffffff";
    border.width: 2

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
        text: "I\nR\nS\n" + self.irs_current
        anchors.centerIn: parent
        color: (irs_current == irs_partner) ? "#ffff00" : "#ffffff"
        font.pixelSize: 14
        font.bold: true
        font.family: "Helvetica"
    }
}
