import QtQuick
import QtQuick.Controls
import Falcon7x_synoptic_design
import QtQuick.Studio.Components
import QtQuick.VectorImage
import QtQuick.Controls.Material
import "../../components/basic_components"

//import Falcon7x_synoptic_design 1.0
Item {
    id: self
    width: 97
    height: 28

    // visible: true
    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     width: 684
    //     height: 342
    //     visible: true
    //     source: "images/ECS.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }
    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 97
        height: 28
        color: "#a8b49e"
        radius: 2
    }
    Text {
        id: _text
        x: 7
        y: 5
        color: "#ffffff"
        text: qsTr("REMOTE")
        font.letterSpacing: 0.1
        font.pixelSize: 15
        font.family: "Arial"
    }
    CheckBox {
        id: checkBox
        x: 77
        y: 6
        palette.window: "yellow" // Может изменить фон индикатора в некоторых темах
        palette.highlight: "green" // Цвет при выделении
        width: 16
        height: 16
        checked: false
        padding: 0
        leftPadding: 0
        rightPadding: 0
        bottomPadding: 0
        topPadding: 0
        checkState: Qt.Checked
        background: Rectangle {
            implicitWidth: 16
            implicitHeight: 16
            x: parent.height / 2 - height / 2
            y: parent.height / 2 - height / 2
            radius: 3
            color: "#000000"
            border.color: "#ffffff"
        }
        indicator: Rectangle {
            x: parent.height / 2 - height / 2
            y: parent.height / 2 - height / 2
            color: "transparent"

            visible: checkBox.checked
            Text {
                width: parent.width
                height: parent.height
                text: "✔"
                font.pixelSize: 16
                color: "#00ff00"
                visible: checkBox.checked
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
