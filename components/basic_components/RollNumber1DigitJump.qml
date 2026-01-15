import QtQuick 2.15
import QtQuick.Window 2.15

Item {
    id: self

    width: 20
    height: 50

    property real value: 0 
    property int pixel_height: 40

    property int center_x: width / 2
    property int center_y: height / 2

    property string color: "#fff"

    property bool draw_0: true

    Connections {
        target: backend 
        function onUpdateCanvas() {
            canvas.requestPaint()
        }
    }

    Canvas {
        id: canvas

        y: -self.center_y
        width: parent.width
        height: parent.height

        onPaint: {
            const ctx = getContext("2d");
            ctx.reset();

            // draw sky rect
            ctx.strokeStyle = self.color;
            ctx.fillStyle = self.color;
            ctx.font = "bold 24px sans-serif";
            ctx.textAlign = "right";

            const alt_to_pix = self.pixel_height;
            const line_step = 1;

            // fast jump betwen 0.8 and 1 as on altitude 
            let value = Math.abs(self.value % 1) > 0.8 ? Math.floor(self.value) + (Math.abs(self.value % 1)  - 0.8) * 5 : Math.floor(self.value);
            const closest_below_line = value - value % line_step;

            ctx.resetTransform();
            ctx.translate(0, center_y);
            ctx.translate(0, value * alt_to_pix);

            const line_count = 4;
            ctx.beginPath();
            for(let i = line_count / 2; i >= -line_count / 2 + 1; i--) {
                const line_alt = i * line_step + closest_below_line;
                const line_y = alt_to_pix * line_alt; 

                const number = (line_alt + 10) % 10;

                if (number == 0 && self.draw_0 == false) {
                    break;
                }

                ctx.fillText(number, self.width - 4, -line_y + 8);
            }
            ctx.closePath();
        }
    }
}
