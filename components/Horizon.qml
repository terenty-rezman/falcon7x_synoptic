import QtQuick 2.15
import QtQuick.Window 2.15

Item {
    anchors.fill: parent
    id: self

    property real pitch_deg: 50 
    property real bank_deg: 45 

    property int center_x: width / 2
    property int center_y: height / 4

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
            const pitch_to_pix = 20;
            const ctx = getContext("2d")
            ctx.reset()
            ctx.translate(center_x, center_y);

            // draw sky rect
            ctx.strokeStyle = "#FFFFFF";
            ctx.fillStyle = "#58B0F6";
            ctx.beginPath();
            ctx.rotate(-bank_deg / 180 * Math.PI);
            ctx.translate(0, pitch_deg * pitch_to_pix);
            ctx.fillRect(-width, -height, 2*width, height)
            ctx.moveTo(-width, 0)
            ctx.lineTo(width, 0)
            ctx.stroke()
            ctx.closePath();

            // draw pitch lines
            const line_count = 6;
            const line_step = 5;
            const offset_from_below_line = pitch_deg % line_step; 
            const closest_below_line = pitch_deg - offset_from_below_line;

            ctx.fillStyle = "#FFFFFF"
            ctx.lineWidth = 2;
            ctx.font = "bold 16px consolas";
            ctx.textAlign = "right";
            const line_width = 160;

            ctx.resetTransform();
            ctx.translate(center_x, center_y);
            ctx.rotate(-bank_deg / 180 * Math.PI);
            ctx.translate(0, pitch_deg * pitch_to_pix);

            ctx.beginPath();
            for(let i = -line_count / 2 + 1; i < line_count / 2; i++) {
                const line_pitch = i * line_step + closest_below_line;
                const line_y = pitch_to_pix * line_pitch; 
                if (line_pitch == 0) {
                    continue;
                }

                const offset = (line_pitch < 0) ? 0 : 10;
                ctx.fillText(line_pitch, -line_width / 2 - 8, -line_y + offset);
                ctx.moveTo(-line_width / 2, -line_y);
                ctx.lineTo(-line_width / 4, -line_y);
                ctx.moveTo(line_width / 2, -line_y);
                ctx.lineTo(line_width / 4, -line_y);

                const horizontal = (line_pitch < 0) ? -10 : 10;
                ctx.moveTo(-line_width / 2, -line_y);
                ctx.lineTo(-line_width / 2, -line_y + horizontal);
                ctx.moveTo(line_width / 2, -line_y);
                ctx.lineTo(line_width / 2, -line_y + horizontal);

                ctx.stroke();
            }
            ctx.closePath();

            ctx.resetTransform();

            ctx.strokeStyle = "#FFDE21";
            ctx.lineWidth = 4;

            ctx.translate(center_x, center_y);

            // draw yellow plane marker
            const plane_width = 340;
            const wing_width = 60
            ctx.beginPath();
            ctx.moveTo(-plane_width / 2, 0);
            ctx.lineTo(-plane_width / 2 + wing_width , 0);
            ctx.moveTo(plane_width / 2, 0);
            ctx.lineTo(plane_width / 2 - wing_width , 0);

            // horizontal lines
            ctx.moveTo(plane_width / 2 - wing_width , 0);
            ctx.lineTo(plane_width / 2 - wing_width , 15);
            ctx.moveTo(-plane_width / 2 + wing_width , 0);
            ctx.lineTo(-plane_width / 2 + wing_width , 15);

            ctx.stroke();
            ctx.closePath();
        }
    }
}
