import QtQuick

Rectangle {
    id: self

    x: 320
    y: 81
    width: 103
    height: 46
    color: "transparent"

    property int fuel_weight: 4000
    property int max_fuel_weight: 4942

    Image {
        width: 102
        height: 45

        source: "images/FUEL_TANK_1_3_FILL.svg"

        property int state: 0
    }

    Rectangle {
        color: "#000"
        width: (self.max_fuel_weight - self.fuel_weight) / self.max_fuel_weight * parent.width
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
    }

    Image {
        width: 103
        height: 47

        source: "images/FUEL_TANK_1_3_FRAME.svg"

        property int state: 0
        x: 0
        y: -1
    }
}
