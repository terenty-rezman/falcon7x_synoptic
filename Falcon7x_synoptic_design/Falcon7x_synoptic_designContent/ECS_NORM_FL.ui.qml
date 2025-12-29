

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
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
    width: 65
    height: 37

    // visible: true

    //color: Constants.backgroundColor
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
        width: 64
        height: 36
        color: "#a8b49e"
        radius: 2
    }

    RadioButton {
        id: norm
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: parent.height / 2

        rightPadding: 0
        bottomPadding: 0
        leftPadding: 0
        topPadding: 0
        autoExclusive: true
        checkable: true
        checked: true
        autoRepeat: false

        indicator: Rectangle {
            implicitWidth: 15
            implicitHeight: 15
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 3

            radius: 7
            border.color: "#ffffff"
            color: "#000000"

            Rectangle {
                width: 13
                height: 13
                x: 1
                y: 1
                radius: 6
                color: "#17a81a"
                visible: norm.checked
            }
        }

        contentItem: Text {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top

            font: norm.font

            //opacity: enabled ? 1.0 : 0.3
            color: norm.checked ? "#21be2b" : "#ffffff"
            text: "NORM"
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            leftPadding: 3
        }
    }
    RadioButton {
        id: fl
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        rightPadding: 0
        bottomPadding: 0
        leftPadding: 0
        topPadding: 0
        autoExclusive: true
        checkable: true
        checked: false
        autoRepeat: false

        height: parent.height / 2

        indicator: Rectangle {

            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 3
            anchors.rightMargin: 3
            implicitWidth: 15
            implicitHeight: 15
            radius: 7
            border.color: "#ffffff"
            color: "#000000"

            Rectangle {
                width: 13
                height: 13
                x: 1
                y: 1
                radius: 6
                color: "#17a81a"
                visible: fl.checked
            }
        }

        contentItem: Text {
            font: fl.font

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top

            color: fl.checked ? "#17a81a" : "#ffffff"
            text: "FL"
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            rightPadding: 16
            leftPadding: 3
            bottomPadding: 0
            topPadding: 0
        }
    }

    ButtonGroup {
        buttons: [norm, fl]
    }
}
