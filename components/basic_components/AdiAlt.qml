import QtQuick 2.15

Item {
    id: self

    width: 63
    height: 288

    property bool fail: true
    property real altitude_ft: 0 
    property real target_alt_ft: 0 
    property real radio_alt_ft: 0
    property real baro_settings: 29.92
    property string fonts: "bold 26px sans-serif"

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
        anchors.leftMargin: 2
        anchors.rightMargin: 2
        anchors.topMargin: 2
        anchors.bottomMargin: 2

        Component.onCompleted: {
            canvas.loadImage("../svg/ADI_ALT_SETPOINT.svg"); 
            canvas.loadImage("../png/adi_ground_pattern.png"); 
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

            const alt_to_pix = 26;
            const alt = altitude_ft / 100;
            const radio_alt = radio_alt_ft / 100;
            const target_alt = self.target_alt_ft / 100;
            const line_step = 1;
            const closest_below_line = alt - alt % line_step;
            const setpoint_height = 26;

            ctx.resetTransform();
            ctx.translate(0, center_y);
            ctx.translate(0, alt * alt_to_pix);

            // draw target alt symbol
            ctx.drawImage("../svg/ADI_ALT_SETPOINT.svg", 0, (-target_alt) * alt_to_pix - setpoint_height / 2);

            const line_count = 10;
            const line_width = 10; 

            ctx.fillStyle = "#FFFFFF"
            ctx.beginPath();
            for(let i = -line_count / 2; i < line_count / 2 + 2; i++) {
                const line_alt = i * line_step + closest_below_line;
                const line_y = alt_to_pix * line_alt; 

                if (line_alt % 2 == 0 && line_alt >= 0) {
                    ctx.fillText(line_alt, self.width - 4, -line_y + 8);
                }

                if (line_alt >= 0) {
                    ctx.moveTo(0, -line_y);
                    ctx.lineTo(line_width, -line_y);
                    ctx.stroke();
                }
            }
            ctx.closePath();

            // draw ground
            const pattern = ctx.createPattern("../png/adi_ground_pattern.png", "repeat");

            ctx.resetTransform();
            ctx.translate(0, center_y);
            ctx.translate(0, alt * alt_to_pix);

            ctx.fillStyle = pattern;
            ctx.clearRect(0, (radio_alt - alt) * alt_to_pix, width, height);
            ctx.fillRect(0, (radio_alt - alt) * alt_to_pix, width, height);
            ctx.lineWidth = 2;
            ctx.strokeRect(0, (radio_alt - alt) * alt_to_pix, width, 1);
        }
    }

    AltCurrent {
        y: self.center_y
        altitude_ft: self.altitude_ft
        fail: self.fail
    }

    Image {
        id: gear_dn_green
        source: "../svg/ADI_BIG_RED_CROSS.svg"

        visible: self.fail

        width: 63
        height: 288
    }

    AdiGreenText {
        Rectangle {
            anchors.fill: parent
            color: "#ff000055"
            visible: false
        }

        text: (self.baro_settings.toFixed(2) == 29.92) ? "STD" : self.baro_settings.toFixed(2); 
        x: self.width - width
        y: 292

        horizontalAlignment: Text.AlignRight
    }
}
