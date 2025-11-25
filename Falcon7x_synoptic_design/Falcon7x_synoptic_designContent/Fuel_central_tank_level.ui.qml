import QtQuick

Rectangle {
    id: self

    x: 320
    y: 81
    width: 32
    height: 99
    color: "transparent"
    border.color: "#ffffff"
    border.width: 2

    property int fuel_weight: 0
    property int max_fuel_weight: 4942

    Rectangle {
        color: "#44dc3a"
        height: self.fuel_weight / self.max_fuel_weight * parent.height
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        z: -1
    }
}
