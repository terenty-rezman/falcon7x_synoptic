import QtQuick

Item {
    id: self

    width: 70
    height: 20

    property int state: 0

    property alias text: _text.text

    Text {
        id: _text
        x: 0
        y: 4
        width: 70
        height: 16
        color: "#4dd34b"
        text: qsTr("ENG 1")
        font.letterSpacing: 0.9
        font.pixelSize: 17
        horizontalAlignment: Text.AlignHCenter
        font.family: "Arial"
    }

    Fuel_rect_pipe {
        id: rectangle31
        x: 0
        y: 10
        width: 4
        height: 10
        rotation: 0

        state: parent.state
    }

    Fuel_rect_pipe {
        id: rectangle32
        x: 66
        y: 10
        width: 4
        height: 10

        state: parent.state
    }

    Fuel_arc_pipe {
        id: arc12
        x: 0
        y: 0
        width: 20
        height: 20
        rotation: -90

        state: parent.state
    }

    Fuel_arc_pipe {
        id: arc13
        x: 50
        y: 0
        width: 20
        height: 20

        state: parent.state
    }

    Fuel_rect_pipe {
        id: rectangle33
        x: 10
        y: 0
        width: 50
        height: 4

        state: parent.state
    }

    states: [
        State {
            when: self.state == 0

            PropertyChanges {
                target: _text
                color: "#555555"
            }
        },

        State {
            when: self.state == 1

            PropertyChanges {
                target: _text
                color: "#00ff00"
            }
        }
    ]
}
