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
    property int state: 1
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
        border.color: "#FFBF00"
        visible: false
    }

    states: [
        State {
            name: "normal"
            when: fcs_sfcc_num.state == 1
            PropertyChanges {
                target: rectangle
                visible: false
            }
            PropertyChanges {
                target: _text
                color: "#00ff00"
            }
        },
        State {
            name: "actuator_degraded"
            when: fcs_sfcc_num.state == 2
            PropertyChanges {
                target: rectangle
                visible: true
            }
            PropertyChanges {
                target: _text
                color: "#00ff00"
            }
        },
        State {
            name: "actuator_failed"
            when: fcs_sfcc_num.state == 3
            PropertyChanges {
                target: rectangle
                visible: false
            }
            PropertyChanges {
                target: _text
                color: "#FFBF00"
            }
        },
        State {
            name: "unknown"
            when: fcs_sfcc_num.state == 4
            PropertyChanges {
                target: rectangle
                visible: false
            }
            PropertyChanges {
                target: _text
                color: "#919B8A"
            }
        }
    ]
}
