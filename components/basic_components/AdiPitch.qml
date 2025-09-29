import QtQuick 2.15

Item {
    id: self

    property int state: 0

    width: 45
    height: 69

    Image {
        source: "../svg/ADI_PITCH.svg"

        width: 45
        height: 69
    }

    AdiWhiteText {
        text: "PITCH"
        anchors.left: parent.left
        anchors.right: parent.right
        y: -26

        horizontalAlignment: Text.AlignHCenter
    }
}
