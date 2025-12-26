

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
        x: 0
        y: 0

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
            x: norm.width - width - norm.rightPadding
            y: parent.height / 2 - height / 2
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

            x: 0
            font: norm.font

            //opacity: enabled ? 1.0 : 0.3
            color: norm.checked ? "#21be2b" : "#ffffff"
            text: "NORM"
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
            renderTypeQuality: Text.VeryHighRenderTypeQuality
            rightPadding: 18
            bottomPadding: 0
            topPadding: 0
            leftPadding: 3
        }
    }
    RadioButton {
        id: fl
        x: 18
        y: 19
        rightPadding: 0
        bottomPadding: 0
        leftPadding: 0
        topPadding: 0
        autoExclusive: true
        checkable: true
        checked: false
        autoRepeat: false

        indicator: Rectangle {
            x: 30
            y: 0
            implicitWidth: 15
            implicitHeight: 15
            radius: 7
            border.color: "#ffffff"
            color: "#000000"

            Rectangle {
                width: 13
                height: 13
                x: 0
                y: 0
                radius: 6
                color: "#17a81a"
                visible: fl.checked
            }
        }

        contentItem: Text {

            y: -3
            font: fl.font

            color: fl.checked ? "#17a81a" : "#ffffff"
            text: "FL"
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            rightPadding: 0

            bottomPadding: 0
            topPadding: 0
            leftPadding: 0
        }
    }

    ButtonGroup {
        buttons: [norm, fl]
    }
}
