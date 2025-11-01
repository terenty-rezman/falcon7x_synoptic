import QtQuick

Text {
    id: temp
    x: 470
    y: 144
    color: "#5ba152"
    text: qsTr("-10")
    font.letterSpacing: 1.2
    font.pixelSize: 15
    font.family: "Arial"

    Text {
        id: unit
        x: 30
        y: 3
        color: "#a8b49e"
        text: qsTr("°C")
        font.pixelSize: 13
        font.family: "Arial"
    }
}
