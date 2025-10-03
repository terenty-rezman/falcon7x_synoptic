import QtQuick 2.15

Rectangle {
    id: self

    property int state: 0

    property int ap_mode: 0
    property int pilot_side: 0

    onAp_modeChanged: { 
        if (ap_mode == 2) {
            self.state = 1;
        }
        else {
            self.state = 3;
        }
    }

    property string font_color: "#00ff00"
    color: "#55000000"
    width: 140
    height: 25 
    radius: 4

    Timer {
        id: flashing_timer
        interval: 500
        running: false
        repeat: true

        property int is_on: 0 

        onTriggered: {
            if (is_on < 2) {
                self.color = "#ff0000";
                self.font_color = "#fff";
            } else {
                self.color = "#55000000";
                self.font_color = "#ff0000";
            }

            is_on += 1;
            
            if (is_on >= 3) {
                is_on = 0;
            }
        }
    }

    Timer {
        id: from_flash_to_off
        interval: 7000
        running: false
        repeat: false

        onTriggered: {
            self.state = 0;
        }
    }

    Text {
        id: text_
        text: "AP"
        anchors.centerIn: parent
        color: self.font_color
        font.pixelSize: 14
        font.bold: false
        font.family: "Helvetica"
    }

    Text {
        id: arrow_right
        text: "🠊"
        anchors.right: parent.right 
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 30
        color: self.font_color
        font.pixelSize: 14
        font.bold: false
        font.family: "Helvetica"
        visible: pilot_side === 1
    }

    Text {
        id: arrow_left
        text: "🠈"
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 30
        color: self.font_color
        font.pixelSize: 14
        font.bold: false
        font.family: "Helvetica"
        visible: pilot_side === 0
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

            PropertyChanges {
                target: flashing_timer
                running: false
            }

            PropertyChanges {
                target: from_flash_to_off
                running: false
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

            PropertyChanges {
                target: flashing_timer
                running: false
            }

            PropertyChanges {
                target: from_flash_to_off
                running: false
            }
        },

        State {
            when: self.state === 3
            name: "flashing"

            PropertyChanges {
                target: flashing_timer
                running: true
            }

            PropertyChanges {
                target: from_flash_to_off
                running: true
            }
        }
    ]
}
