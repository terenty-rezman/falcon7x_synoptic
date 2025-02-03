import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {
    // Rectangle {
    //     anchors.fill: parent
    //     color: "#55FF0000"
    // }

    id: n1

    width: 100
    height: 100

    property real vib: 0 

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
            const vib_args = [0, 100]
            const vib_vals = [0, 60]
            const map_temp = new Helpers.Interp1d(vib_args, vib_vals); 
            let vib_m = map_temp.interp(n1.vib);

            const ctx = getContext("2d"); 

            ctx.reset();

            ctx.translate(0, 2);

            // draw green triangle temp
            ctx.translate(vib_m, 0);

            ctx.fillStyle = "#00FF00";
            ctx.strokeStyle = "#00FF00";
            ctx.lineWidth = 1;

            let side = 8

            ctx.beginPath();
            ctx.moveTo(0, 0)
            ctx.lineTo(side, 0)
            ctx.lineTo(side/2, side)
            ctx.lineTo(0, 0)
            ctx.fill()
            ctx.stroke()
            ctx.closePath();
        }
    }

    Image {
        source: "../svg/ENG_VIB.svg"
        x: 0
        y: 12
        
        width: 100
        height: 100
    }

}
