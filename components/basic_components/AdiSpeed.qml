import QtQuick 2.15

Item {
    id: self

    width: 63
    height: 288

    property bool fail: false
    property real speed: 90
    property real mach: 0.0
    property real target_speed: 120 
    property real ab_pos: 0.5
    property real high_speed: 380
    property real stall_speed: 100
    property real low_speed: stall_speed + 10
    property int flight_regime: 0

    property string fonts: "bold 26px sans-serif"
    property string small_fonts: "bold 20px sans-serif"

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
        // anchors.fill: parent
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.bottom: parent.bottom
        width: parent.width + 20

        Component.onCompleted: {
            canvas.loadImage("../svg/ADI_VELOCITY_SETPOINT.svg"); 
            canvas.loadImage("../png/max_speed_pattern.png"); 
        }

        onPaint: {
            const ctx = getContext("2d");
            ctx.reset();

            if (self.fail) {
                return;
            }

            // draw sky rect
            ctx.strokeStyle = "#FFFFFF";
            ctx.fillStyle = "#FFFFFF"
            ctx.font = self.fonts;
            ctx.textAlign = "right";

            const alt_to_pix = 36;
            const line_step = 1;
            let speed = self.speed / 10;
            if (speed < 0) {
                speed = 0;
            }

            const target_speed = self.target_speed / 10;
            const closest_below_line = speed - speed % line_step;

            const setpoint_height = 26;

            // ctx.resetTransform();
            ctx.translate(0, center_y);
            ctx.translate(0, speed * alt_to_pix);
            ctx.drawImage("../svg/ADI_VELOCITY_SETPOINT.svg", 50, (-target_speed) * alt_to_pix - setpoint_height / 2);

            // draw high speed cue (vmo/mmo)
            ctx.lineWidth = 2;
            const pattern = ctx.createPattern("../png/max_speed_pattern.png", "repeat");
            ctx.fillStyle = pattern;
            const high_speed_end = (-high_speed / 10) * alt_to_pix;
            ctx.fillRect(self.width, high_speed_end, 5, high_speed_end - self.height);
            ctx.strokeRect(self.width, high_speed_end, 5, high_speed_end - self.height);

            if (self.flight_regime > 1) { // 0 - park; 1 - taxi; 2 - cruise; 3 - to; 4 - land;
                // draw low speed cue
                ctx.fillStyle = "#FFFF00";
                const low_speed_start = (-low_speed / 10) * alt_to_pix;
                ctx.fillRect(self.width, low_speed_start, 5,  -low_speed_start);

                // draw stall speed cue
                ctx.fillStyle = "#FF6666"
                const stall_speed_start = (-stall_speed / 10) * alt_to_pix;
                ctx.fillRect(self.width, stall_speed_start, 5, -stall_speed_start);
            }

            // speed digits & lines
            const line_count = 10;
            const line_width = 10; 

            // lines
            ctx.beginPath();
            for(let i = -line_count / 2; i < line_count / 2 + 2; i++) {
                const line_alt = i * line_step + closest_below_line;
                const line_y = alt_to_pix * line_alt; 

                if (line_alt >= 0) {
                    ctx.moveTo(self.width, -line_y);
                    ctx.lineTo(self.width - line_width, -line_y);
                    ctx.stroke();
                }
            }
            ctx.closePath();

            // numbers
            ctx.beginPath();
            ctx.strokeStyle = '#000001';
            ctx.fillStyle = "#FFFFFF";
            ctx.lineWidth = 1;
            ctx.lineJoin = "round";
            ctx.miterLimit = 2;

            for(let i = -line_count / 2; i < line_count / 2 + 2; i++) {
                const line_alt = i * line_step + closest_below_line;
                const line_y = alt_to_pix * line_alt; 

                if (line_alt % 2 == 0 && line_alt > 0) {
                    ctx.strokeText(line_alt, self.width - 25, -line_y + 8); // outlined text
                    ctx.fillText(line_alt, self.width - 25, -line_y + 8);
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
                    ctx.strokeText("0", self.width - 13, -line_y + 8);
                    ctx.fillText("0", self.width - 13, -line_y + 8);
                }
            }
            ctx.closePath();
        }
    }

    SpeedCurrent {
        x: -16
        y: self.center_y
        fail: self.fail
        speed: Math.max(self.speed, 0)
    }    

    Image {
        id: gear_dn_green
        source: "../svg/ADI_BIG_RED_CROSS.svg"

        visible: self.fail

        width: 63
        height: 288
    }
    
    AdiGreenText {
        visible: !self.fail

        text: format_double(self.mach); 

        anchors.right: parent.right
        anchors.top: parent.bottom

        horizontalAlignment: Text.AlignRight

        function format_double(number) {
            if (number < 1) {
                return "." + (number * 1000).toFixed(0);
            }
            return number;
        }
    }

    AdiMagentaText {
        text: self.target_speed.toFixed(0)
        anchors.right: parent.right
        anchors.bottom: parent.top
    }

    AdiSpeedAB {
        x: 3
        y: 170
        ab_pos: self.ab_pos
    }
}
