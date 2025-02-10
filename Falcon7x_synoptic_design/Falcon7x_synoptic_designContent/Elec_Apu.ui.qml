import QtQuick

Image {
    id: eLEC_APU_NORMAL_OPERATION
    width: 50
    height: 118
    source: "images/ELEC_APU_NORMAL_OPERATION.svg"
    fillMode: Image.PreserveAspectFit

    Text {
        id: _text_apu
        x: 13
        y: 71
        color: "#00ff00"
        text: qsTr("APU")
        font.pixelSize: 12
        font.family: "Arial"
    }
}
