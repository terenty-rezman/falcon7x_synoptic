import QtQuick
import "../../components/basic_components"

ZoneText {
    id: _text10

    property int psi: 3050

    property int max_psi: 4000
    property int low_level: 1800
    property int high_level: 3300
    y: 77
    anchors.horizontalCenter: scale_item.horizontalCenter

    color: "#00ff00"
    value: psi
    font.letterSpacing: -0.1
    font.pixelSize: 20
    font.family: "Arial"

    value_zones: [0, low_level, high_level]
    state_zones: ["yellow", "green", "yellow"]

    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    anchors.horizontalCenterOffset: 0
}
