import QtQuick 2.15

Item {
    id: self

    property real vy_ft_per_min: 0
    property real target_vy_ft_per_min: 0

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

    Rectangle {
        color: "black"
        border.color: "white"
        border.width: 2

        anchors.centerIn: parent

        width: 41
        height: 30

        visible: Math.abs(self.vy_ft_per_min) > 270

        Text {
            anchors.centerIn: parent
            text: (self.vy_ft_per_min / 1000).toFixed(1)
            color: "#00ff00"
            font.pixelSize: 16
            font.bold: true
        }
    }

    Canvas {
        id: canvas
        anchors.fill: parent

        onPaint: {
            let y = 0;

            const abs_vy = Math.abs(self.vy_ft_per_min);
            let vy = self.vy_ft_per_min;

            const limit_vy = 5000;
            if (vy > limit_vy) {
                vy = limit_vy;
            } else if (vy < -limit_vy) {
                vy = -limit_vy;
            } 

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

    AdiMagentaText {
        text: (self.target_vy_ft_per_min / 1000).toFixed(1)
        anchors.right: parent.right
        anchors.bottom: parent.top
    }
}
