import QtQuick

Image {
    id: eLEC_CONTACTOR_NORMAL_OPERATION
    source: "images/ELEC_CONTACTOR_LH_ISOL_CONTACTOR_OPEN_AND_NO_FAULT.svg"
    fillMode: Image.PreserveAspectFit
    width: 31
    height: 31

    Text {
        id: text_rh_lh_contactor
        x: 2
        y: -16
        color: "#d2b60c"
        text: qsTr("ISOL")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: "Arial"
    }
}
