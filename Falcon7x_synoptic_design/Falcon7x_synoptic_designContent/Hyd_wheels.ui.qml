import QtQuick
import QtQuick.Studio.Components
import QtCharts

Item {
    id: _item
    width: 83
    height: 28

    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/HYD.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 83
        height: 28
        color: "#868b81"
        radius: 1
        border.color: "#a8b49e"
        border.width: 2
    }

    Text {
        id: _text
        x: 5
        y: 5
        color: "#a8b49e"
        text: qsTr("WHEELS")
        font.letterSpacing: 0.4
        font.pixelSize: 17
        font.family: "Arial"
    }
}
