import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {

    id: n1

    width: 100
    height: 100

    property real rotation_green_arrow_deg: 70
    property real rotation_purpure_circle: 0.5 
    property real rotation_green_triangle_deg: 0
    property int start: 0
    property int ab: 0

    property real top_digit: 75
    property real bottom_digit: 86

    property int center_x: 49 
    property int center_y: 52 

    Connections {
        target: backend 
        function onUpdateCanvas() {
            canvas.requestPaint()
        }
    }

    Canvas {
        id: canvas
        // width: 100
        // height: 100
        anchors.fill: parent

        onPaint: {
            const map_n1 = new Helpers.Interp1d([0, 29, 94, 100, 110], [-120 - 90, -110 - 90, 40 - 90, 80 - 90, 90 - 90]); 
            const map_throttle = new Helpers.Interp1d([0, 1], [-120 - 90, 75 - 90]); 

            let rotation_green_arrow_deg = map_n1.interp(n1.rotation_green_arrow_deg);
            // console.log(rotation_green_arrow_deg)

            const initial_rotation = -210;

            const ctx = getContext("2d"); 

            ctx.reset();

            // draw pie
            if (rotation_green_arrow_deg > initial_rotation) {
                ctx.fillStyle = "#8E9093";
                ctx.strokeStyle = "#000000";
                ctx.translate(center_x, center_y);
                ctx.beginPath();
                ctx.moveTo(0, 0);
                ctx.arc(0, 0, 36, (initial_rotation) / 180 * Math.PI, rotation_green_arrow_deg / 180 * Math.PI);
                ctx.lineTo(0, 0);
                ctx.fill();
                ctx.stroke();
                ctx.closePath();

                ctx.resetTransform();
            }

            // draw green line
            if (rotation_green_arrow_deg >= -10)
                ctx.strokeStyle = "#ff0000";
            else {
                ctx.strokeStyle = "#00ff00";
            }
            ctx.lineWidth = 3;

            ctx.translate(center_x, center_y);
            ctx.rotate((rotation_green_arrow_deg) / 180 * Math.PI);
            ctx.beginPath();
            ctx.moveTo(0, 0);
            ctx.lineTo(36, 0);
            ctx.stroke();
            ctx.closePath();

            // draw purpure circle
            let throttle = map_throttle.interp(n1.rotation_purpure_circle);

            ctx.resetTransform();
            ctx.translate(center_x, center_y);
            ctx.rotate(throttle / 180 * Math.PI);

            ctx.strokeStyle = "#ED008C";
            ctx.lineWidth = 3;

            ctx.beginPath();
            ctx.arc(36 + 8, 0, 3, 0, 2 * Math.PI);
            ctx.stroke();
            ctx.closePath();

            // draw green triangle
            // ctx.resetTransform();
            // ctx.translate(center_x, center_y);
            // ctx.rotate((initial_rotation + n1.rotation_green_triangle_deg) / 180 * Math.PI);
            // ctx.translate(41, 0);

            // ctx.fillStyle = "#00FF00";
            // ctx.strokeStyle = "#00FF00";
            // ctx.lineWidth = 1;

            // ctx.beginPath();
            // ctx.moveTo(0, 0)
            // ctx.lineTo(6, -3)
            // ctx.lineTo(6, 3)
            // ctx.lineTo(0, 0)
            // ctx.fill()
            // ctx.stroke()
            // ctx.closePath();
        }
    }

    Text {
        x: 20 
        y: 22
        text: "START"
        color: (n1.start == 1) ? "#00FC00" : "#efd20f"
        font.pixelSize: 18
        font.bold: true
        visible: n1.start > 0
    }

    Rectangle {
        x: 0  
        y: 80
        width: 20
        height:22

        border.color: "#00FC00"
        border.width: 1
        color: "transparent"
        
        Text {
            y: -2
            width: 20
            height:22

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            text: (n1.ab == 0) ? "A" : "B"
            color: "#00FC00"
            font.pixelSize: 18
            font.bold: true
        }
     }

    Text {
        x: 35
        y: -15
        text: n1.top_digit.toFixed(1)
        color: "#00FC00"
        font.pixelSize: 18
        // font.bold: true
    }

    Text {
        x: 38
        y: 65
        text: n1.rotation_green_arrow_deg.toFixed(1)
        color: "#00FC00"
        font.pixelSize: 18
        // font.bold: true
    }

    Image {
        source: "../svg/ENG_N1.svg"
        x: 0//n1.center_x 
        y: 0//n1.center_y 
        
        width: 100
        height: 100
    }

}
