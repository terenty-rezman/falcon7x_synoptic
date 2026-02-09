import QtQuick

Text {
    property int amps: 10

    color: "#00ff00"
    //anchors.fill: parent
    width: 51
    height: 22
    text: (amps < 0) ? "+" + (-amps).toFixed(0) : (-amps).toFixed(0)
    font.pixelSize: 20
    horizontalAlignment: Text.AlignRight
    verticalAlignment: Text.AlignVCenter
    font.family: "Arial"
    rightPadding: 3
}
