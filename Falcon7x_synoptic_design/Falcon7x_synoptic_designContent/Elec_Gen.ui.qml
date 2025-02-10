import QtQuick

Image {
    id: eLEC_APU_NORMAL_OPERATION1
    property alias text: _text_gen.text
    width: 50
    height: 118
    source: "images/ELEC_GEN_NORMAL_OPERATION.svg"
    fillMode: Image.PreserveAspectFit

    Text {
        id: _text_gen
        x: 9
        y: 66
        width: 33
        height: 30
        color: "#00ff00"
        text: qsTr("ENG3\nGEN")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        font.family: "Arial"
    }
}
