import QtQuick

Rectangle {
    id: self

    x: 320
    y: 81
    width: 103
    height: 46
    color: "transparent"

    property int state: 0

    property int fuel_weight: 4000
    property int max_fuel_weight: 0

    Image {
        id: fill
        width: 102
        height: 45

        source: "images/FUEL_TANK_1_3_FILL.svg"
    }

    Rectangle {
        color: "#000"
        width: (self.max_fuel_weight - self.fuel_weight - 250 / 2.2) / (self.max_fuel_weight - 250 / 2.2) * (parent.width - 20)
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }

    Rectangle {
        color: "#000"
        width: (250 / 2.2 - self.fuel_weight) / (250 / 2.2) * (20)
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        x: parent.width - 20
    }

    Image {
        id: frame
        width: 103
        height: 47

        source: "images/FUEL_TANK_1_3_FRAME.svg"

        x: 0
        y: -1
    }

   states: [
        State {
            when: self.fuel_weight > 250 / 2.20

            PropertyChanges {
                target: frame
                source: "images/FUEL_TANK_1_3_FRAME.svg"
            }

            PropertyChanges {
                target: fill
                source: "images/FUEL_TANK_1_3_FILL.svg"
            }
        },

        State {
            when: self.fuel_weight < 250 / 2.20

            PropertyChanges {
                target: frame
                source: "images/FUEL_TANK_1_3_FRAME_AMBER.svg"
            }

            PropertyChanges {
                target: fill
                source: "images/FUEL_TANK_1_3_FILL_AMBER.svg"
            }
        }
   ]
}
