import QtQuick
import QtQuick.Studio.Components

Item {
    id: fcs_sfcc_num
    x: 0
    y: 0
    width: 50
    height: 18
    property alias text: _text.text
    property alias fontSize: _text.font.pixelSize
    Text {
        id: _text
        anchors.centerIn: parent
        color: "#00ff00"
        text: qsTr("LH AIL")
        font.letterSpacing: 0.5
        font.pixelSize: 14
        font.styleName: "Narrow"
        font.family: "ScreenerW01-Regular"
    }

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: "#00ffffff"
        border.color: "#d2b60c"
    }
}
