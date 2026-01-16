import QtQuick
import QtQuick.Studio.Components

Item {
    id: fcs_slats_spoil_status
    x: 0
    y: 0
    width: 43
    height: 23

    property int state: 3

    FCS_slats_spoil_moving {
        id: fCS_slats_spoil_moving
        x: 15
        y: 0
        width: 13
        height: 23
        visible: true
    }

    FCS_slats_spoil_invalid {
        id: fCS_slats_spoil_invalid
        x: 0
        y: 12
        visible: true
    }

    FCS_slats_spoil_extended {
        id: fCS_slats_spoil_extended
        x: 0
        y: 12
        visible: true
    }

    FCS_slats_spoil_retracted {
        id: fCS_slats_spoil_retracted
        x: 0
        y: 20
        visible: true
    }

    states: [
        State {
            name: "moving"
            when: fcs_slats_spoil_status.state == 1
            PropertyChanges {
                target: fCS_slats_spoil_moving
                visible: true
            }
            PropertyChanges {
                target: fCS_slats_spoil_invalid
                visible: false
            }
            PropertyChanges {
                target: fCS_slats_spoil_extended
                visible: false
            }
            PropertyChanges {
                target: fCS_slats_spoil_retracted
                visible: false
            }
        },
        State {
            name: "invalid"
            when: fcs_slats_spoil_status.state == 2
            PropertyChanges {
                target: fCS_slats_spoil_moving
                visible: false
            }
            PropertyChanges {
                target: fCS_slats_spoil_invalid
                visible: true
            }
            PropertyChanges {
                target: fCS_slats_spoil_extended
                visible: false
            }
            PropertyChanges {
                target: fCS_slats_spoil_retracted
                visible: false
            }
        },
        State {
            name: "extended"
            when: fcs_slats_spoil_status.state == 3
            PropertyChanges {
                target: fCS_slats_spoil_moving
                visible: false
            }
            PropertyChanges {
                target: fCS_slats_spoil_invalid
                visible: false
            }
            PropertyChanges {
                target: fCS_slats_spoil_extended
                visible: true
            }
            PropertyChanges {
                target: fCS_slats_spoil_retracted
                visible: false
            }
        },
        State {
            name: "retracted"
            when: fcs_slats_spoil_status.state == 4
            PropertyChanges {
                target: fCS_slats_spoil_moving
                visible: false
            }
            PropertyChanges {
                target: fCS_slats_spoil_invalid
                visible: false
            }
            PropertyChanges {
                target: fCS_slats_spoil_extended
                visible: false
            }
            PropertyChanges {
                target: fCS_slats_spoil_retracted
                visible: true
            }
        }
    ]
}
