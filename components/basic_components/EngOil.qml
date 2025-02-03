import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {

    // Rectangle {
    //     anchors.fill: parent
    //     color: "red"
    // }

    id: n1

    width: 100
    height: 100

    property real psi: 0 
    property real temp:-20 

    property int center_x: 50
    property int center_y: 59

    function update_canvas() : undefined {
        canvas.requestPaint();
    }

    Connections {
        target: backend 
        function onUpdateCanvas() {
            canvas.requestPaint()
        }
    }

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            const temp_args = [-20, 150]
            const temp_vals = [0, 55]
            const map_temp = new Helpers.Interp1d(temp_args, temp_vals); 
            let temp_m = map_temp.interp(n1.temp);

            const psi_args = [0, 220]
            const psi_vals = [0, 55]
            const map_psi = new Helpers.Interp1d(psi_args, psi_vals); 
            let psi_m = map_psi.interp(n1.psi);

            const ctx = getContext("2d"); 

            ctx.reset();

            // draw green triangle temp
            ctx.translate(center_x, center_y);
            ctx.translate(0, -temp_m);

            ctx.fillStyle = "#00FF00";
            ctx.strokeStyle = "#00FF00";
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

    Text {
        x: -7
        y: 36
        width: 25
        text: n1.psi.toFixed(0)
        color: "#00FC00"
        font.pixelSize: 18
        horizontalAlignment: Text.AlignRight
        // font.bold: true
    }

    Text {
        x: 58
        y: 36
        text: n1.temp.toFixed(0)
        color: "#00FC00"
        font.pixelSize: 18
        // font.bold: true
    }

    Image {
        source: "../svg/ENG_OIL.svg"
        x: 27
        y: 2
        
        width: 100
        height: 100
    }

}
