import QtQuick

Text {
    property real fluid_ratio: 0

    color: "#00ff00"
    //anchors.fill: parent
    width: 51
    height: 22
    text: (fluid_ratio * 100).toFixed(0)
    //text: (amps < 0) ? "+" + (-amps).toFixed(0) : (-amps).toFixed(0)
    font.pixelSize: 20
    horizontalAlignment: Text.AlignRight
    verticalAlignment: Text.AlignVCenter
    font.family: "Arial"
    rightPadding: 3
}
