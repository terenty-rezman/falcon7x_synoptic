import QtQuick 2.15

Item {
    id: self

    property int state: 0

    width: 82
    height: 63

    Image {
        source: "../svg/ADI_GEAR_DN_GREEN.svg"

        width: 82
        height: 63
    }

    AdiWhiteText {
        text: "GEAR"
        anchors.left: parent.left
        anchors.right: parent.right
        y: -30

        horizontalAlignment: Text.AlignHCenter
    }
}
