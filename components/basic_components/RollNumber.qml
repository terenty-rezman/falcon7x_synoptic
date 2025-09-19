import QtQuick 2.15
import QtQuick.Window 2.15

Item {
    id: self

    width: 61
    height: 54

    property real value: 0 

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
        color: "#000000"
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
            const line_step = 1;
            const value = self.value;
            const closest_below_line = value - value % line_step;

            ctx.resetTransform();
            ctx.translate(0, center_y);
            ctx.translate(0, value * alt_to_pix);

            const line_count = 4;
            const line_width = 10; 
            ctx.beginPath();
            for(let i = -line_count / 2; i < line_count / 2 + 2; i++) {
                const line_alt = i * line_step + closest_below_line;
                const line_y = alt_to_pix * line_alt; 

                ctx.fillText((line_alt + 10) % 10, self.width - 4, -line_y + 8);
            }
            ctx.closePath();
        }
    }
}
