import QtQuick

Image {
    id: eLEC_BAS_TIE_CONTACTOR_NORMAL_OPERATION
    source: "images/ELEC_BAS_TIE_CONTACTOR_NORMAL_OPERATION.svg"
    fillMode: Image.PreserveAspectFit
    width: 31
    height: 31

    Text {
        id: text_bus_tied_contactor
        x: 2
        y: -16
        color: "#d2b60c"
        text: qsTr("TIED")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Arial"
    }
}
