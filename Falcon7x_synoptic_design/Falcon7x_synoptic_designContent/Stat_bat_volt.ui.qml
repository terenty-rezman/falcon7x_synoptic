import QtQuick

Text {
    property real v: 28.5
    id: _text
    color: "#00ff00"
    //anchors.fill: parent
    width: 51
    height: 22
    text: v.toFixed(1)
    font.letterSpacing: 0.4
    font.pixelSize: 20
    horizontalAlignment: Text.AlignRight
    verticalAlignment: Text.AlignVCenter
    font.family: "Arial"
    rightPadding: 3
}
