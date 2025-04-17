import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Text {
    id: self

    property real value: 0
    property var value_zones: [0, 25, 146, 149, 152]
    property var state_zones: ["yellow", "green", "yellow", "red", "red"]
    
    text: self.value

    color: "#00FC00"

    Rectangle {
        id: rect_
        color: "#000000"
        // anchors.fill: parent
        x: 0
        y: +3
        width: self.width + 2
        height: self.height - 3
        z: -1
    }

    onValueChanged: () => {
        let color_idx = Helpers.bisectLeft(self.value_zones, self.value);
        let color = state_zones[color_idx];
        self.state = color; 
    }

    states: [
        State {
            name: "green"

            PropertyChanges {
                target: self
                color: "#00FC00"
            }

            PropertyChanges {
                target: rect_
                color: "#000000"
            }
        },

        State {
            name: "yellow"

            PropertyChanges {
                target: self
                color: "#000000"
            }

            PropertyChanges {
                target: rect_
                color: "#fccd07"
            }
        },

        State {
            name: "red"

            PropertyChanges {
                target: self
                color: "#FFFFFF"
            }

            PropertyChanges {
                target: rect_
                color: "#AA0000"
            }
        }
    ]
}
