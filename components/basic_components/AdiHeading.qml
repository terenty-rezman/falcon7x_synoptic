import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {
    id: self

    property real heading_deg: 45
    property bool ads_fail: true

    width: 288
    height: 288

    property int center_x: width / 2
    property int center_y: height / 2

    Item {
        width: parent.width
        height: parent.height

        x: -width/2
        y: -height/2

        Rectangle {
            anchors.fill: parent
            color: "#55ff00ff"
            visible: false
        }

        Image {
            source: "../svg/ADI_HEADING_AC.svg"

            width: 44 
            height: 46

            x: 144 - width /2
            y: 144 - height /2

        }

        Image {
            source: "../svg/ADI_HEADING_NUMBER.svg"

            width: 68
            height: 32

            x: 144 - width /2
            y: -40 


            Text {
                text: self.heading_deg.toFixed(0)
                x: 27 
                y: -4

                width: 30

                color: "#66FF66"
                font.pixelSize: 26 
                font.bold: true
                horizontalAlignment: Text.AlignRight
                style: Text.Outline 
                styleColor: "#55000000"

            }

            Rectangle {
                anchors.fill: parent
                color: "#fa4c1e"
                visible: ads_fail

                Text {
                    anchors.centerIn: parent
                    text: "HDG"
                    color: "#ffffff"
                    font.pixelSize: 16
                    font.bold: true
                }
            }
        }

        Image {
            source: "../svg/ADI_HEADING_1.svg"

            visible: !self.ads_fail

            width: 288
            height: 288

            rotation: -self.heading_deg
        }

        Image {
            source: "../svg/ADI_ROSE_WITHOUT_NUM.svg"

            visible: self.ads_fail

            width: 288
            height: 288
        }
    }
}
