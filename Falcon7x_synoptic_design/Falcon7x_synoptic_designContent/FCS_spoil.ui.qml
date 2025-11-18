import QtQuick
import QtQuick.Studio.Components

Item {
    id: fcs_sfcc_num
    x: 0
    y: 0
    width: 64
    height: 48

    Rectangle {
        id: rectangle1
        x: 0
        y: 30
        width: 64
        height: 18
        color: "#00ffffff"
        border.color: "#d2b60c"
    }

    Text {
        id: _text1
        x: 4
        y: 31
        color: "#00ff00"
        text: qsTr("LH SPOIL")
        font.letterSpacing: -0.2
        font.pixelSize: 14
        font.styleName: "Narrow"
        font.family: "ScreenerW01-Regular"
    }
    Rectangle {
        id: rectangle9
        x: 25
        y: 0
        width: 11
        height: 23
        color: "#00ff00"
        border.color: "#00000000"
    }
}
