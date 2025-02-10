import QtQuick

Image {
    id: eLEC_APU_NORMAL_OPERATION
    width: 50
    height: 118
    source: "images/ELEC_RAT_GEN_NORMAL_OPERATION.svg"
    fillMode: Image.PreserveAspectFit

    Text {
        id: _text_apu
        x: 12
        y: 65
        color: "#00ff00"
        text: qsTr("RAT\nGEN")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        maximumLineCount: 2
        font.family: "Arial"
    }
}
