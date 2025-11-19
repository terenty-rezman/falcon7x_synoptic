import QtQuick

Image {
    id: self
    x: 203
    y: 32

    width: 30
    height: 30

    property int state: 3
    property bool text_above: true
    property bool text_visible: true
    property bool arrows_visible: true
    property int visible_arrow: 0
    property string text: "X-TK"

    source: "images/FUEL_VALVE_INVALID_DATA_31_31.svg"

    Item {
        visible: self.text_above && self.text_visible

        Text {
            id: _text
            x: 0
            y: -13
            width: 30
            height: 15
            color: "#fff400"
            text: self.text
            font.pixelSize: 9
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: _text1
            x: 30
            y: -13
            height: 15
            color: "#00ff00"
            text: qsTr("🠊")
            font.pixelSize: 9
            visible: self.arrows_visible && self.visible_arrow == 0
        }

        Text {
            id: _text2
            x: -8
            y: -13
            height: 15
            color: "#00ff00"
            text: qsTr("🠈")
            font.pixelSize: 9
            visible: self.arrows_visible && self.visible_arrow == 1
        }
    }

    Item {
        visible: !self.text_above && self.text_visible

        Text {
            id: _text3
            x: 0
            y: 30
            width: 30
            height: 15
            color: "#fff400"
            text: self.text
            font.pixelSize: 9
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: _text4
            x: 30
            y: 30
            height: 15
            color: "#00ff00"
            text: qsTr("🠊")
            font.pixelSize: 9
            visible: self.arrows_visible && self.visible_arrow == 0
        }

        Text {
            id: _text5
            x: -8
            y: 30
            height: 15
            color: "#00ff00"
            text: qsTr("🠈")
            font.pixelSize: 9
            visible: self.arrows_visible && self.visible_arrow == 1
        }
    }

    states: [
        State {
            when: self.state == 0

            PropertyChanges {
                target: self
                source: "images/FUEL_VALVE_CLOSED_31_31.svg"
                text_visible: false
            }
        },

        State {
            when: self.state == 1

            PropertyChanges {
                target: self
                source: "images/FUEL_VALVE_OPEN_31_31.svg"
                text_visible: true
                visible_arrow: 0
            }
        },

        State {
            when: self.state == 2

            PropertyChanges {
                target: self
                source: "images/FUEL_VALVE_OPEN_31_31.svg"
                text_visible: true
                visible_arrow: 1
            }
        },

        State {
            when: self.state == 3

            PropertyChanges {
                target: self
                source: "images/FUEL_VALVE_INVALID_DATA_31_31.svg"
                text_visible: false
            }
        }
    ]
}
