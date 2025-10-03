import QtQuick 2.15

Rectangle {
    id: self

    property int state: 0
    property alias text: text_.text
    property int target_heading: 120

    property int ap_mode: 0
    property int heading_mode: 0

    onAp_modeChanged: {
        if (self.ap_mode == 2) {
            self.state = 1;
        } else {
            self.state = 0;
        }
    }

    onHeading_modeChanged: {
        if (self.heading_mode == 0) {
            self.text = "ROL";  
        } else if (self.heading_mode == 1) {
            self.text = "HDG";  
        } else if (self.heading_mode == 2) {
            self.text = "LNAV";  
        }
    }

    property string font_color: "#00ff00"

    color: "#55000000"

    width: 53
    height: 25
    radius: 4

    Text {
        id: text_
        text: "ROL"
        anchors.centerIn: parent
        color: self.font_color
        font.pixelSize: 14
        font.bold: false
        font.family: "Helvetica"
    }

    AdiMagentaText {
        text: self.target_heading + "°"
        anchors.right: parent.left
        anchors.verticalCenter: text_.verticalCenter
        anchors.rightMargin: 5
        visible: self.heading_mode == 1
        horizontalAlignment: Text.AlignRight
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
