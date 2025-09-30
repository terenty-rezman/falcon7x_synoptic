import QtQuick 2.15

Item {
    id: self

    property int gear_handle_state: 0
    property int gear_transition_state: 0

    property bool clear_display: false

    property int state: calc_gear_state(gear_handle_state, gear_transition_state);

    width: 82
    height: 63

    Timer {
        interval: 11000 
        running: true
        repeat: true
        onTriggered: {
            if (self.state == 4) {
                self.clear_display = true;
            }
        }
    }

    function calc_gear_state(handle_state, transition_state) {
        let state = 0;

        self.clear_display = false;

        if (handle_state == 1) {
            if (transition_state == 1) {
                return 3; // gear arrows down
            }
            else {
                return 1; // gear green down
            }
        } else {
            if (transition_state == 1) {
                return 2; // gear arrows up
            }
            else {
                return 4; // gear up closed
            }
        }

        return state
    }

    AdiWhiteText {
        id: up_text
        text: "UP"
        x: 29
        y: -5
        visible: true
    }

    Image {
        id: gear_dn_green
        source: "../svg/ADI_GEAR_DN_GREEN.svg"

        width: 82
        height: 63
    }

    Image {
        id: gear_arrow_white_up
        source: "../svg/ADI_GEAR_ARROW_WHITE_UP.svg"

        width: 82
        height: 63
        visible: false
    }
    
    Image {
        id: gear_arrow_white_down
        source: "../svg/ADI_GEAR_ARROW_WHITE_DOWN.svg"

        width: 82
        height: 63
        visible: false
    }

    Image {
        id: gear_white_squre
        source: "../svg/ADI_GEAR_WHITE_SQUARE.svg"

        width: 82
        height: 63
        visible: false
    }

    AdiWhiteText {
        text: "GEAR"
        anchors.left: parent.left
        anchors.right: parent.right
        y: -30

        horizontalAlignment: Text.AlignHCenter
    }

    states:[
        State {
            name: "gear_up_text"
            when: self.clear_display === true

            PropertyChanges {
                target: gear_dn_green
                visible: false
            }
            PropertyChanges {
                target: gear_arrow_white_up
                visible: false
            }
            PropertyChanges {
                target: gear_arrow_white_down
                visible: false
            }
            PropertyChanges {
                target: gear_white_squre
                visible: false
            }
            PropertyChanges {
                target: up_text
                visible: true
            }
        },
        State {
            name: "gear_dn_green"
            when: self.state === 1

            PropertyChanges {
                target: gear_dn_green
                visible: true
            }
            PropertyChanges {
                target: gear_arrow_white_up
                visible: false
            }
            PropertyChanges {
                target: gear_arrow_white_down
                visible: false
            }
            PropertyChanges {
                target: gear_white_squre
                visible: false
            }
            PropertyChanges {
                target: up_text
                visible: false
            }
        },

        State{
            name: "gear_handle_up"
            when: self.state === 2
            PropertyChanges {
                target: gear_dn_green
                visible: false
            }
            PropertyChanges {
                target: gear_arrow_white_up
                visible: true
            }
            PropertyChanges {
                target: gear_arrow_white_down
                visible: false
            }
            PropertyChanges {
                target: gear_white_squre
                visible: false
            }
            PropertyChanges {
                target: up_text
                visible: false
            }
        },

        State{
            name: "gear_handle_down"
            when: self.state === 3
            PropertyChanges {
                target: gear_dn_green
                visible: false
            }
            PropertyChanges {
                target: gear_arrow_white_up
                visible: false
            }
            PropertyChanges {
                target: gear_arrow_white_down
                visible: true
            }
            PropertyChanges {
                target: gear_white_squre
                visible: false
            }
            PropertyChanges {
                target: up_text
                visible: false
            }
        },

        State{
            name: "gear_up_doors_close"
            when: self.state === 4
            PropertyChanges {
                target: gear_dn_green
                visible: false
            }
            PropertyChanges {
                target: gear_arrow_white_up
                visible: false
            }
            PropertyChanges {
                target: gear_arrow_white_down
                visible: false
            }
            PropertyChanges {
                target: gear_white_squre
                visible: true
            }
            PropertyChanges {
                target: up_text
                visible: false
            }
        }
    ]
}
