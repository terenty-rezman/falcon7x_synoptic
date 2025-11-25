import QtQuick

Item {
    id: self
    x: 0
    y: 0
    width: 45
    height: 27

    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/BLEED.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    property int state: 1
    property string text: "PAX"

    Rectangle {
        id: frame
        anchors.fill: parent
        color: "#0000ff00"
        border.color: "#00ff00"
        border.width: 2
    }
    Text {
        id: _text
        color: "#00ff00"
        text: self.text
        anchors.fill: parent
        font.letterSpacing: -0.8
        font.pixelSize: 16
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.wordSpacing: 0
        font.family: "Arial"
        font.styleName: "Narrow"
    }

    states: [
        State {
            name: "air_flow"
            when: self.state === 1

            PropertyChanges {
                target: frame
                color: "transparent"
                border.color: "#00ff00"
                border.width: 2
            }

            PropertyChanges {
                target: _text
                color: "#00ff00"
            }
        },

        State {
            name: "no_flow"
            when: self.state === 0

            PropertyChanges {
                target: frame
                color: "#a8b49e"
                border.color: "#a8b49e"
                border.width: 2
            }

            PropertyChanges {
                target: _text
                color: "#000000"
            }
        },

        State {
            name: "cond_overheat"
            when: self.state === 2

            PropertyChanges {
                target: frame
                color: "#dfd229"
                border.color: "#dfd229"
                border.width: 2
            }

            PropertyChanges {
                target: _text
                color: "#000000"
            }
        }
    ]
}
