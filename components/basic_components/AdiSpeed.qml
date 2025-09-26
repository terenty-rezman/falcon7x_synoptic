import QtQuick 2.15

Item {
    id: self

    width: 63
    height: 288

    property real speed: 0 
    property string fonts: "bold 26px Helvetica"
    property string small_fonts: "bold 20px Helvetica"

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
            ctx.font = self.fonts;
            ctx.textAlign = "right";

            const alt_to_pix = 36;
            const line_step = 1;
            const speed = self.speed / 10;
            const closest_below_line = speed - speed % line_step;

            // ctx.resetTransform();
            ctx.translate(0, center_y);
            ctx.translate(0, speed * alt_to_pix);

            // speed digits & lines
            const line_count = 10;
            const line_width = 10; 
            ctx.beginPath();
            for(let i = -line_count / 2; i < line_count / 2 + 2; i++) {
                const line_alt = i * line_step + closest_below_line;
                const line_y = alt_to_pix * line_alt; 

                if (line_alt % 2 == 0 && line_alt > 0) {
                    ctx.fillText(line_alt, self.width - 25, -line_y + 8);
                }

                if (line_alt >= 0) {
                    ctx.moveTo(self.width, -line_y);
                    ctx.lineTo(self.width - line_width, -line_y);
                    ctx.stroke();
                }
            }
            ctx.closePath();

            // small font zeros
            ctx.beginPath();
            ctx.font = self.small_fonts;
            for(let i = -line_count / 2; i < line_count / 2 + 2; i++) {
                const line_alt = i * line_step + closest_below_line;
                const line_y = alt_to_pix * line_alt; 

                if (line_alt % 2 == 0 && line_alt >= 0) {
                    ctx.fillText("0", self.width - 13, -line_y + 8);
                }
            }
            ctx.closePath();
        }
    }

    SpeedCurrent {
        x: -16
        y: self.center_y
        speed: self.speed
    }
}
