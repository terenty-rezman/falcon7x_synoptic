import QtQuick

Rectangle {
    id: self

    x: 320
    y: 81
    width: 32
    height: 99
    color: "transparent"
    border.color: (self.fuel_weight > 250 / 2.2 ) ? "#fff" : "#dfd229"
    
    border.width: 2

    property int fuel_weight: 0
    property int max_fuel_weight: 0

    Rectangle {
        color: (self.fuel_weight > 250 / 2.2 ) ? "#44dc3a" : "#dfd229"
        height: (self.fuel_weight < 250 / 2.2 ) ? (self.fuel_weight / (250 / 2.2) * 14) : ((self.fuel_weight - 250 / 2.2) / self.max_fuel_weight * (parent.height - 14) + 14)
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        z: -1
    }
}
