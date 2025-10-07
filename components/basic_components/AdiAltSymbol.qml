import QtQuick 2.15

Rectangle {
    id: self

    property int state: 0
    property alias text: text_.text
    property int target_alt: 0

    property int ap_mode: 0
    property int altitude_mode: 6

    onAp_modeChanged: {
        if (self.ap_mode == 2) {
            self.state = 1;
        } else {
            self.state = 0;
        }
    }

    onAltitude_modeChanged: {
        if (self.altitude_mode == 6) {
            self.text = "ALT";  
        } else if (self.heading_mode == 2) {
            self.text = "PATH";  
        }
    }

    property string font_color: "#00ff00"

    color: "#55000000"

    width: 53
    height: 25
    radius: 4

    Text {
        id: text_
        text: "ALT"
        anchors.centerIn: parent
        color: self.font_color
        font.pixelSize: 14
        font.bold: false
        font.family: "Helvetica"
    }

    AdiMagentaText {
        text: "FL " + self.target_alt 
        anchors.left: parent.right
        anchors.verticalCenter: text_.verticalCenter
        anchors.leftMargin: 5
        visible: self.altitude_mode == 6
    }

    states: [
        State {
            name: "on"
            when: self.state === 1

            PropertyChanges {
                target: self
                color: "#66FF66"
                font_color: "#bb000000"
            }
        },

        State {
            when: self.state === 0
            name: "off"

            PropertyChanges {
                target: self
                color: "#55000000"
                font_color: "#66FF66"
            }
        }
    ]
}
