import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {

    id: self

    width: 100
    height: 100

    property real n1: 70
    property real rotation_purpure_circle: 0.5 
    property real rotation_green_triangle_deg: 0
    property int start: 0
    property int ab: 0
    property bool ab_visible: true
    property bool reverse_deployed: false

    property real top_digit: 75
    property real bottom_digit: 86

    property int center_x: 49 
    property int center_y: 52 

    property int max_thrust_deg: 75

    Connections {
        target: backend 
        function onUpdateCanvas() {
            canvas.requestPaint()
        }
    }

    onReverse_deployedChanged: {
        if (start_text.visible == false) {
            transit_text.visible = true
        }
        transit_timer.restart();
    }

    Timer {
        id: transit_timer
        interval: 2000
        running: false
        repeat: false

        onTriggered: {
            transit_text.visible = false
        }
    }

    Canvas {
        id: canvas
        // width: 100
        // height: 100
        anchors.fill: parent

        onPaint: {
            const map_n1_to_linear = new Helpers.Interp1d([0, 22, 30, 60, 82, 89, 90.8], [0, 0.05, 0.125, 0.375, 0.625, 0.875, 1]);
            const map_n1 = new Helpers.Interp1d([0, 1], [-120 - 90, 30 - 90]); 

            const map_throttle = new Helpers.Interp1d([0, 1], [-120 - 90, 30 - 90]); 

            let n1_linear = map_n1_to_linear.interp(self.n1);
            // console.log(n1_linear);

            let rotation_green_arrow_deg = map_n1.interp(n1_linear);

            const initial_rotation = -210;

            const ctx = getContext("2d"); 

            ctx.reset();

            // draw pie
            if (rotation_green_arrow_deg > initial_rotation) {
                ctx.fillStyle = "#8E9093";
                ctx.strokeStyle = "#8E9093";
                ctx.translate(center_x, center_y);
                ctx.beginPath();
                ctx.moveTo(0, 0);
                ctx.arc(0, 0, 38, (initial_rotation) / 180 * Math.PI, rotation_green_arrow_deg / 180 * Math.PI);
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
            let throttle = map_throttle.interp(self.rotation_purpure_circle);
            // if (throttle > self.max_thrust_deg - 90) { throttle = self.max_thrust_deg - 90;}

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
            // ctx.rotate((initial_rotation + self.rotation_green_triangle_deg) / 180 * Math.PI);
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
        id: start_text
        x: 20 
        y: 22
        text: "START"
        color: (self.start < 2) ? "#00FC00" : "#efd20f"
        font.pixelSize: 18
        font.bold: true
        visible: self.start > 0
    }

    Text {
        id: reverse_text
        x: 20 
        y: 22
        text: "DEPLOY"
        color: "#00FC00"
        font.pixelSize: 16
        font.bold: true
        visible: transit_text.visible == false && start_text.visible == false && self.reverse_deployed == true
    }

    Text {
        id: transit_text
        x: 20 
        y: 22
        text: "TRANS"
        color: "#efd20f"
        font.pixelSize: 18
        font.bold: true
        visible: false
    }

    Rectangle {
        x: 0  
        y: 80
        width: 20
        height:22

        border.color: "#00FC00"
        border.width: 1
        color: "transparent"
        visible: self.ab_visible
        
        Text {
            y: -2
            width: 20
            height:22

            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter

            text: (self.ab == 0) ? "A" : "B"
            color: "#00FC00"
            font.pixelSize: 18
            font.bold: true
        }
     }

    Text {
        x: 35
        y: -15
        text: self.top_digit.toFixed(1)
        color: "#00FC00"
        font.pixelSize: 18
        // font.bold: true
    }

    Text {
        x: 38
        y: 65
        text: self.n1.toFixed(1)
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
