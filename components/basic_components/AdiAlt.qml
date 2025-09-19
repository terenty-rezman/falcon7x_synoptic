import QtQuick 2.15
import QtQuick.Window 2.15

Item {
    id: self

    width: 63
    height: 288

    property real altitude_ft: 0 

    property int center_x: width / 2
    property int center_y: height / 2

    Connections {
        target: backend 
        function onUpdateCanvas() {
            canvas.requestPaint()
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "transparent"
        border.color: "#55ffffff"
        border.width: 2
        radius: 3
    }


    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            const ctx = getContext("2d");
            ctx.reset();

            // draw sky rect
            ctx.strokeStyle = "#FFFFFF";
            ctx.fillStyle = "#FFFFFF"
            ctx.font = "bold 26px consolas";
            ctx.textAlign = "right";

            const alt_to_pix = 26;
            const alt = altitude_ft / 100;
            const line_step = 1;
            const closest_below_line = alt - alt % line_step;

            ctx.resetTransform();
            ctx.translate(0, center_y);
            ctx.translate(0, alt * alt_to_pix);

            const line_count = 10;
            const line_width = 10; 
            ctx.beginPath();
            for(let i = -line_count / 2; i < line_count / 2 + 2; i++) {
                const line_alt = i * line_step + closest_below_line;
                const line_y = alt_to_pix * line_alt; 

                if (line_alt % 2 == 0 && line_alt >= 0) {
                    ctx.fillText(line_alt, self.width - 4, -line_y + 8);
                }

                if (line_alt >= 0) {
                    ctx.moveTo(0, -line_y);
                    ctx.lineTo(line_width, -line_y);
                    ctx.stroke();
                }
            }
            ctx.closePath();
        }
    }

    RollNumber {
        y: center_y
        value: (altitude_ft / 100) * 10 % 100 / 10
    }
}
