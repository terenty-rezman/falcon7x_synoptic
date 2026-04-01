import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Canvas {
    id: canvas

    height: 80
    width: 60

    property var args: []
    property var colors: []
    property var pixels: [0, 10, 40, 47, 59]
    property real value: 0

    property bool right_side: true
    property bool disable_arrow_color: false

    Connections {
        target: backend 
        function onUpdateCanvas() {
            canvas.requestPaint()
        }
    }

    onPaint: {
        const map = new Helpers.Interp1d(args, pixels); 
        let val_m = map.interp(value);

        const ctx = getContext("2d"); 
        ctx.reset();

        const y_start = height / 2 + pixels[pixels.length - 1] / 2;

        for (let i = 0; i < args.length - 1; i++) {
            let zone_start = map.interp(args[i]);
            let zone_end = map.interp(args[i + 1]);

            let color = colors[i];
            if (color == "#00FF00") {
                color = "#ffffff";
            }
            ctx.fillStyle = color;

            ctx.fillRect(width/2, y_start - zone_end, 5, zone_end - zone_start);
        }

        ctx.resetTransform();

        let color_idx = Helpers.bisectLeft(args, value);

        ctx.fillStyle = colors[color_idx];
        ctx.strokeStyle = colors[color_idx];
        ctx.lineWidth = 1;

        if (disable_arrow_color) {
            ctx.fillStyle = "#00ff00";
            ctx.strokeStyle = "#00ff00";
        } 

        // draw green triangle temp
        const side = 8

        if (right_side) {
            ctx.translate(width/2 + 7, y_start - val_m);

            ctx.beginPath();
            ctx.moveTo(0, 0)
            ctx.lineTo(side, -side/2)
            ctx.lineTo(side, side/2)
            ctx.lineTo(0, 0)
            ctx.fill()
            ctx.stroke()
            ctx.closePath();
        }
        else {
            ctx.resetTransform()

            ctx.translate(width/2 - 3, y_start - val_m);

            ctx.beginPath();
            ctx.moveTo(0, 0)
            ctx.lineTo(-side, -side/2)
            ctx.lineTo(-side, side/2)
            ctx.lineTo(0, 0)
            ctx.fill()
            ctx.stroke()
            ctx.closePath();
        }

        return;
    }
}
