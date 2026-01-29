import QtQuick
import QtQuick.Controls
import QtQuick.Studio.Components
import QtCharts
import "../../components/basic_components"

Button {

    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/HYD.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    id: self

    x: 0
    y: 0
    width: 83
    height: 28
    text: "name"
    rotation: 0
    rightPadding: 0
    leftPadding: 0
    bottomPadding: 0
    topPadding: 0
    bottomInset: 0
    topInset: 0
    font.pointSize: 14
    font.wordSpacing: 0
    font.letterSpacing: -0.9
    font.family: "Arial"
    font.bold: false
    background: Rectangle {
        implicitWidth: parent.width
        implicitHeight: parent.height
        color: "#868b81"
        border.color: "#a8b49e"
        border.width: 2
        radius: 1
    }

    BlueBorder {}
}
