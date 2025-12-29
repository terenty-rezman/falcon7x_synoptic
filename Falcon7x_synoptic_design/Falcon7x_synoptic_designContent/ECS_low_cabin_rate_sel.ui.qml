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
    width: 71
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
        width: 71
        height: 28
        color: "#a8b49e"
        radius: 2
    }
    Text {
        id: _text
        x: 4
        y: 2
        color: "#ffffff"
        text: qsTr("LOW")
        font.letterSpacing: 0.9
        font.pixelSize: 18
    }
    CheckBox {
        id: checkBox
        x: 49
        y: 5
        palette.window: "yellow" // Может изменить фон индикатора в некоторых темах
        palette.highlight: "green" // Цвет при выделении
        width: 20
        height: 20
        padding: 0
        leftPadding: 0
        rightPadding: 0
        bottomPadding: 0
        topPadding: 0
        checkState: Qt.Checked
        background: Rectangle {
            implicitWidth: 20
            implicitHeight: 20
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
                font.pixelSize: 20
                color: "#00ff00"
                visible: checkBox.checked
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
