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

    property real psi: 0 
    property real temp: 25

    property int center_x: 50
    property int center_y: 59
    property int oil_min_temp: 0

    property var oil_temp_zones: [0, self.oil_min_temp, 146, 149, 152]
    property var oil_temp_color: ["#fccd07", "#00FF00", "#fccd07", "#FF0000", "#FF0000"]

    property var oil_psi_zones: [0, 15, 25, 30]
    property var oil_psi_color: ["#FF0000", "#fccd07", "#fccd07", "#00FF00"]

    Connections {
        target: backend 
        function onUpdateCanvas() {
            canvas.requestPaint()
        }
    }

    Image {
        source: "../svg/ENG_OIL.svg"
        x: 27
        y: 2
        
        width: 100
        height: 100
    }

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            const temp_args = [0, 25, 150]
            const temp_vals = [0, 20, 55]
            const map_temp = new Helpers.Interp1d(temp_args, temp_vals); 
            let temp_m = map_temp.interp(self.temp);

            const psi_args = [0, 220]
            const psi_vals = [0, 55]
            const map_psi = new Helpers.Interp1d(psi_args, psi_vals); 
            let psi_m = map_psi.interp(self.psi);

            let temp_height_m = map_temp.interp(self.oil_min_temp);

            const ctx = getContext("2d"); 

            ctx.reset();

            ctx.fillStyle = "#fccd07";
            ctx.translate(center_x - 7, center_y + 2);
            ctx.fillRect(0, 0, 4, -temp_height_m)

            ctx.resetTransform();

            // draw green triangle temp
            ctx.translate(center_x, center_y + 2);
            ctx.translate(0, -temp_m);

            let color_idx = Helpers.bisectLeft(self.oil_temp_zones, self.temp);

            ctx.fillStyle = self.oil_temp_color[color_idx];
            ctx.strokeStyle = self.oil_temp_color[color_idx];
            ctx.lineWidth = 1;

            const side = 8
            ctx.beginPath();
            ctx.moveTo(0, 0)
            ctx.lineTo(side, -side/2)
            ctx.lineTo(side, side/2)
            ctx.lineTo(0, 0)
            ctx.fill()
            ctx.stroke()
            ctx.closePath();

            ctx.resetTransform()

            color_idx = Helpers.bisectLeft(self.oil_psi_zones, self.psi);

            ctx.fillStyle = self.oil_psi_color[color_idx];
            ctx.strokeStyle = self.oil_psi_color[color_idx];
            ctx.lineWidth = 1;

            ctx.translate(center_x, center_y);
            ctx.translate(-25, -psi_m);

            ctx.beginPath();
            ctx.moveTo(0, 0)
            ctx.lineTo(-side, -side/2)
            ctx.lineTo(-side, side/2)
            ctx.lineTo(0, 0)
            ctx.fill()
            ctx.stroke()
            ctx.closePath();
        }
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
        state_zones:  ["red", "yellow", "yellow", "green", "red"]

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

        value: self.temp.toFixed(0)

        font.pixelSize: 18
    }
}
