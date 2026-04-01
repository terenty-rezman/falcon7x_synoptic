import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {

    // Rectangle {
    //     anchors.fill: parent
    //     color: "red"
    // }

    id: self 

    width: 100
    height: 100

    property real psi: 10 
    property real temp: 147 

    property int center_x: 50
    property int center_y: 59
    property int oil_min_temp: 0

    property var oil_temp_zones: [0, self.oil_min_temp, 146, 149, 175]
    property var oil_temp_color: ["#fccd07", "#00FF00", "#fccd07", "#FF0000", "#FF0000"]

    property var oil_psi_zones: [-1, 10, 20, 240, 260]
    property var oil_psi_color: ["#FF0000", "#fccd07", "#00FF00", "#fccd07", "#FF0000"]

    property bool engine_running: true

    // Image {
    //     source: "../svg/ENG_OIL.svg"
    //     x: 27
    //     y: 2
        
    //     width: 100
    //     height: 100
    // }

    VerticalScaleWithArrow {
        id: oil_temp

        // Rectangle {
        //     anchors.fill: parent
        //     color: "#ff00ff"
        //     opacity: 0.5
        // }

        x: 13
        y: -8

        height: 80
        width: 60

        args: self.oil_temp_zones
        colors: self.oil_temp_color
        pixels: [0, 10, 40, 47, 59]
        value: self.temp

        right_side: true

        disable_arrow_color: !self.engine_running
    }

    VerticalScaleWithArrow {
        id: oil_press

        // Rectangle {
        //     anchors.fill: parent
        //     color: "#00ff00"
        //     opacity: 0.5
        // }

        x: -3
        y: -8

        height: 80
        width: 60

        args: self.oil_psi_zones
        colors: self.oil_psi_color
        pixels: [0, 5, 10, 47, 59]
        value: self.psi

        right_side: false

        disable_arrow_color: !self.engine_running
    }

    Text {
        x: 0
        y: -7
        text: "PSI"
        color: "#FFFFFF"
        font.pixelSize: 16
        // font.bold: true
    }

    Text {
        x: 52
        y: -7
        text: "°C"
        color: "#FFFFFF"
        font.pixelSize: 16
        // font.bold: true
    }

    ZoneText {
        id: oil_psi_text

        x: -11
        y: 36
        // width: 25

        value_zones: self.oil_psi_zones
        state_zones:  ["red", "yellow", "green", "green", "yellow", "red"]

        disable_zones: !self.engine_running

        value: self.psi.toFixed(0)

        font.pixelSize: 18
        horizontalAlignment: Text.AlignRight
    }

    onOil_min_tempChanged: () => {
        self.oil_temp_zones[1] = self.oil_min_temp;
        oil_temp_text.value_zones = self.oil_temp_zones;
        oil_temp_text.valueChanged();
    }

    ZoneText {
        id: oil_temp_text
        x: 62 
        y: 36

        value_zones: self.oil_temp_zones
        state_zones: ["yellow", "green", "yellow", "red", "red"]
        disable_zones: !self.engine_running

        value: self.temp.toFixed(0)

        font.pixelSize: 18
    }
}
