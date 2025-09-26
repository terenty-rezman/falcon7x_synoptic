import QtQuick 2.15

Item {
    id: self

    property real vy_ft_per_min: 0
    property int y_center: height / 2

    width: 41
    height: 236

    Image {
        source: "../svg/ADI_VERTICAL_SPEED_BACKGROUND.svg"

        width: 41 
        height: 236
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
            let y = 0;

            const abs_vy = Math.abs(self.vy_ft_per_min);
            const vy = self.vy_ft_per_min;

            if (abs_vy < 1000) {
                y = -(vy / 1000) * 50 + y_center;
            }
            else if (abs_vy < 2000) {
                if (vy > 0) {
                    y = -(vy - 1000) / 1000 * 25 + y_center - 50;
                } 
                else {
                    y = -(vy + 1000) / 1000 * 25 + y_center + 50;
                } 
            }
            else {
                if (vy > 0) {
                    y = -(vy - 2000) / 2000 * 25 + y_center - 75;
                } 
                else {
                    y = -(vy + 2000) / 2000 * 25 + y_center + 75;
                } 
            }

            const ctx = getContext("2d");
            ctx.reset();

            // draw sky rect
            ctx.strokeStyle = "#66FF66";
            ctx.fillStyle = "#66FF66";
            ctx.lineWidth = 6;

            ctx.moveTo(120, y_center);
            ctx.lineTo(21, y);
            ctx.stroke()
        }
    }
}
