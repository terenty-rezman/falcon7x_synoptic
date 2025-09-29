import QtQuick 2.15

Item {
    id: self

    property int state: 0

    width: 82
    height: 63

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
    }
    Image {
        id: gear_arrow_white_down
        source: "../svg/ADI_GEAR_ARROW_WHITE_DOWN.svg"

        width: 82
        height: 63
    }
    Image {
        id: gear_white_squre
        source: "../svg/ADI_GEAR_WHITE_SQUARE.svg"

        width: 82
        height: 63
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
            name: "gear_dn_green"
            when: self.state==1

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
        },
        State{
            name: "gear_handle_up"
            when: salf.state==2
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
        },
        State{
            name: "gear_handle_down"
            when: salf.state==3
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
        },
        State{
            name: "gear_up_doors_close"
            when: salf.state==4
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
        },
    ]
}

