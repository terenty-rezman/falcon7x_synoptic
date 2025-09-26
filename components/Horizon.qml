import QtQuick 2.15
import QtQuick.Window 2.15

Item {
    anchors.fill: parent
    id: self

    property real pitch_deg: 50 
    property real bank_deg: 45 

    property int center_x: 324
    property int center_y: 222

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
            ctx.fillRect(-width, -2 * height, 2*width, 2 * height)
            ctx.moveTo(-width, 0)
            ctx.lineTo(width, 0)
            ctx.stroke()
            ctx.closePath();

            // draw pitch lines
            const line_count = 6;
            const line_step = 5;
            const closest_below_line = pitch_deg - pitch_deg % line_step;

            ctx.fillStyle = "#FFFFFF"
            ctx.lineWidth = 2;
            ctx.font = "bold 18px Helvetica";
            ctx.textAlign = "right";
            const line_width = 146; // white pitch line full length
            const line_len = 41; // white pitch colored part

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
                ctx.lineTo(-line_width / 2 + line_len, -line_y);
                ctx.moveTo(line_width / 2, -line_y);
                ctx.lineTo(line_width / 2 - line_len, -line_y);

                const horizontal = (line_pitch < 0) ? -10 : 10;
                ctx.moveTo(-line_width / 2, -line_y);
                ctx.lineTo(-line_width / 2 , -line_y + horizontal);
                ctx.moveTo(line_width / 2, -line_y);
                ctx.lineTo(line_width / 2, -line_y + horizontal);

                ctx.stroke();
            }

            // draw -1 -2 -3 -4 pitch lines
            const short_width = 12;
            for (const pitch of [-1, -2, -3, -4]) {
                const line_y = pitch * pitch_to_pix; 
                const width = (pitch == -3) ? short_width * 2 : short_width;
                ctx.moveTo(-width / 2, -line_y);
                ctx.lineTo(width / 2 , -line_y);
                ctx.stroke();
            }

            ctx.closePath();

            ctx.resetTransform();

            ctx.strokeStyle = "#FFDE21";
            ctx.lineWidth = 4;

            ctx.translate(center_x, center_y);

            // draw yellow plane marker
            const plane_width = 280;
            const wing_width = 44;
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
