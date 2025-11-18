import QtQuick
import QtQuick.Studio.Components

Item {
    id: fcs_sfcc_num
    x: 0
    y: 0
    width: 54
    height: 38

    Text {
        id: _text6
        x: 3
        y: 0
        color: "#00ff00"
        text: qsTr("RUDDER")
        font.letterSpacing: -1
        font.pixelSize: 14
        font.styleName: "Narrow"
        font.family: "ScreenerW01-Regular"
    }

    Rectangle {
        id: rectangle7
        x: 0
        y: 0
        width: 54
        height: 18
        color: "#00ffffff"
        border.color: "#d2b60c"
    }

    Rectangle {
        id: rectangle16
        x: 26
        y: 25
        width: 18
        height: 11
        color: "#00ff00"
        border.color: "#00000000"
    }
}
