import QtQuick
import QtQuick.Studio.Components

Item {
    id: fcs_sfcc_num
    x: 0
    y: 0
    width: 50
    height: 48
    Rectangle {
        id: rectangle4
        x: 18
        y: 0
        width: 11
        height: 15
        color: "#00ff00"
        border.color: "#00000000"
    }
    Text {
        id: _text
        x: 3
        y: 30
        color: "#00ff00"
        text: qsTr("LH AIL")
        font.letterSpacing: 0.5
        font.pixelSize: 14
        font.styleName: "Narrow"
        font.family: "ScreenerW01-Regular"
    }

    Rectangle {
        id: rectangle
        x: 0
        y: 30
        width: 50
        height: 18
        color: "#00ffffff"
        border.color: "#d2b60c"
    }
}
