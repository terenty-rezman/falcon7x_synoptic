import QtQuick

Rectangle {
        id: ext_power
        width: 56
        height: 38
        color: "#00ff00"
        
        Text {
            id: _text_ext_power
            x: 8
            y: 8
            text: qsTr("EXT\nPOWER")
            font.pixelSize: 11
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            wrapMode: Text.WordWrap
            maximumLineCount: 2
            fontSizeMode: Text.VerticalFit
            font.family: "Arial"
        }
    }
