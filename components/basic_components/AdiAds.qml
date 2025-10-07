import QtQuick 2.15

Rectangle {
    id: self

    property int ads_self: 1
    property int ads_partner: 3

    onAds_selfChanged: {
        self.visible = true;
        hide_timer.restart();
    }

    color: "transparent"
    width: 19
    height: 66
    radius: 4
    visible: false
    border.color: (ads_self == ads_partner) ? "#ffff00" : "#ffffff";
    border.width: 2

    Timer {
        id: hide_timer
        interval: 3000
        running: false
        repeat: false

        onTriggered: {
            self.visible = false
        }
    }

    Text {
        id: text_
        text: "A\nD\nS\n" + self.ads_self
        anchors.centerIn: parent
        color: (ads_self == ads_partner) ? "#ffff00" : "#ffffff"
        font.pixelSize: 14
        font.bold: true
        font.family: "Helvetica"
    }
}
