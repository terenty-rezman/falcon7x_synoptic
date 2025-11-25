import QtQuick

Image {
    id: self
    x: 319
    y: 167

    width: 34
    height: 34

    source: "images/FUEL_PUMP_ON_34_34.svg"

    property bool text_visible: false
    property string text: "STBY"

    property int state: 0

    Text {
        id: _text
        x: -29
        y: 0
        width: 26
        height: 34
        color: "#fff400"
        text: self.text
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        visible: self.text_visible
    }

    states: [
        State {
            when: self.state == 0

            PropertyChanges {
                target: self
                source: "images/FUEL_PUMP_OFF_34_34.svg"
                text_visible: true
                text: "OFF"
            }
        },

        State {
            when: self.state == 1

            PropertyChanges {
                target: self
                source: "images/FUEL_PUMP_ON_34_34.svg"
                text_visible: false
            }
        },

        State {
            when: self.state == 2

            PropertyChanges {
                target: self
                source: "images/FUEL_PUMP_ON_34_34.svg"
                text_visible: true
                text: "STBY"
            }
        },

        State {
            when: self.state == 3

            PropertyChanges {
                target: self
                source: "images/FUEL_PUMP_ON_34_34.svg"
                text_visible: true
                text: "BOTH"
            }
        },

        State {
            when: self.state == 4

            PropertyChanges {
                target: self
                source: "images/FUEL_PUMP_LOW_PRESSURE_34_34.svg"
                text_visible: false
            }
        }
    ]
}
