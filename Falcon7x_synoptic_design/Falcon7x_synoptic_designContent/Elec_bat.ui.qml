import QtQuick

Image {
    id: eLEC_BAT_NORMAL_OPERATION
	property alias text: text_elec_bat.text
    source: "images/ELEC_BAT_NORMAL_OPERATION.svg"
    fillMode: Image.PreserveAspectFit
    width: 64
    height: 106

    Text {
        id: text_elec_bat
        x: 16
        y: 73
        width: 33
        height: 13
		color: "#00ff00"
        text: qsTr("BAT 2")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
		font.family: "Arial"
    }
}
