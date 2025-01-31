import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {

    id: n1

    width: 100
    height: 100

    property real rotation_green_arrow_deg: 70

    property int center_x: 49 
    property int center_y: 52 

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
        // width: 100
        // height: 100
        anchors.fill: parent

        onPaint: {
            const vals = [0, 940]
            const degs = [-110 - 90, 90 - 90]
            const map_n1 = new Helpers.Interp1d(vals, degs); 

            let rotation_green_arrow_deg = map_n1.interp(n1.rotation_green_arrow_deg);
            // console.log(rotation_green_arrow_deg)

            const initial_rotation = degs[0];

            const ctx = getContext("2d"); 

            ctx.reset();

            // draw pie
            if (rotation_green_arrow_deg > initial_rotation) {
                ctx.fillStyle = "#8E9093";
                ctx.strokeStyle = "#000000";
                ctx.translate(center_x, center_y);
                ctx.beginPath();
                ctx.moveTo(0, 0);
                ctx.arc(0, 0, 36, (initial_rotation) / 180 * Math.PI, rotation_green_arrow_deg / 180 * Math.PI);
                ctx.lineTo(0, 0);
                ctx.fill();
                ctx.stroke();
                ctx.closePath();

                ctx.resetTransform();
            }

            // draw green line
            if (rotation_green_arrow_deg >= -10)
                ctx.strokeStyle = "#ff0000";
            else {
                ctx.strokeStyle = "#00ff00";
            }
            ctx.lineWidth = 3;

            ctx.translate(center_x, center_y);
            ctx.rotate((rotation_green_arrow_deg) / 180 * Math.PI);
            ctx.beginPath();
            ctx.moveTo(0, 0);
            ctx.lineTo(36, 0);
            ctx.stroke();
            ctx.closePath();
        }
    }

    Text {
        x: 38
        y: 55
        text: n1.rotation_green_arrow_deg.toFixed(0)
        color: "#00FC00"
        font.pixelSize: 18
        // font.bold: true
    }

    Image {
        source: "../svg/ENG_ITT.svg"
        x: 0
        y: 0
        
        width: 100
        height: 100
    }

}
