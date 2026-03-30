import QtQuick 2.15
import QtQuick.Window 2.15

Item {
    anchors.fill: parent
    id: self

    property real pitch_deg: 50 
    property real bank_deg: 45 

    property int center_x: 324
    property int center_y: 222

    property real hpath: 0
    property real vpath: 0
    property real true_psi: 0

    property real rot: 0

    property real air_speed: 0
    property real air_speed_acc: 0
    property real thrust_dir: 0

    property real roll_director_deg: 0
    property real pitch_director_deg: 0

    property int flight_regime: 1
    property int fdtd: 1

    onFlight_regimeChanged: {
        if (flight_regime == 1) {
            rot_symbol.visible = true;
            hide_rot_time.stop();
        }
        else {
            if (hide_rot_time.running == false) {
                hide_rot_time.start()
            }
        }
    }

    onFdtdChanged: {
        if (fdtd == 1) {
            flight_director.visible = true;
            thrust_director.visible = true;
        }
        else if (fdtd == 2) {
            flight_director.visible = true;
            thrust_director.visible = false;
        }
        else if (fdtd == 3) {
            flight_director.visible = false;
            thrust_director.visible = true;
        }
        else {
            flight_director.visible = false;
            thrust_director.visible = false;
        }
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
            const pitch_to_pix = 20;
            const ctx = getContext("2d")
            ctx.reset()
            ctx.translate(center_x, center_y);

            // draw sky rect
            ctx.strokeStyle = "#FFFFFF";
            ctx.fillStyle = "#4da6ff";
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
            ctx.font = "bold 18px sans-serif";
            ctx.textAlign = "right";
            const line_width = 146; // white pitch line full length
            const line_len = 41; // white pitch colored part

            ctx.resetTransform();

            ctx.beginPath();
            ctx.rect(104, 96, 435, 353);
            ctx.clip();

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

    Image {
        id: flight_director
        source: "./svg/ADI_FLIGHT_DIRECTOR.svg"

        x: xy_bank_fd(pitch_deg, pitch_director_deg, bank_deg)[0]
        y: xy_bank_fd(pitch_deg, pitch_director_deg, bank_deg)[1]

        function xy_bank_fd(pitch_deg, target_pitch_deg, bank_deg) {
            let x = (true_psi - hpath) * 20;
            let y = -target_pitch_deg * 20;

            const bank_rad = bank_deg / 180 * Math.PI; 
            const x1 = -x * Math.cos(bank_rad) + y * Math.sin(bank_rad) + center_x - width / 2;
            const y1 = x * Math.sin(bank_rad) + y * Math.cos(bank_rad) + center_y - height / 2;
            return [x1, y1];
        }

        transformOrigin: Item.Center
        rotation: self.roll_director_deg - self.bank_deg

        width: 145
        height: 26
    }

    Image {
        source: "./svg/ADI_FLIGHT_PATH_SYMBOL.svg"

        x: xy_bank(true_psi, pitch_deg, hpath, vpath, bank_deg)[0]
        y: xy_bank(true_psi, pitch_deg, hpath, vpath, bank_deg)[1]

        width: 97
        height: 26

        function xy_bank(true_psi, pitch_deg, hpath, vpath, bank_deg) {
            let x = (true_psi - hpath) * 20;
            let y = (pitch_deg - vpath) * 20;

            if (air_speed < 1) {
                x = 0;
                y = 0;
            }

            const bank_rad = bank_deg / 180 * Math.PI; 
            const x1 = -x * Math.cos(bank_rad) + y * Math.sin(bank_rad) + center_x - width / 2;
            const y1 = x * Math.sin(bank_rad) + y * Math.cos(bank_rad) + center_y - height / 2;
            return [x1, y1]
        }

        Image {
            source: "./svg/ADI_ACCELERATION_SHEVRON.svg"
            width: 14
            height: 22

            x: -15
            y: parent.height / 2 - height / 2 - self.air_speed_acc * 10
        }

        // thrust director
        Image {
            id: thrust_director
            source: "./svg/ADI_THRUST_DIRECTOR.svg"
            width: 14
            height: 41

            x: -14
            y: parent.height / 2 - height / 2 - self.thrust_dir * 8 
        }
    }

    Image {
        id: rot_symbol
        source: "./svg/ADI_ROTATION_SYMBOL.svg"

        x: center_x - width / 2
        y: self.rot * 10 + center_y - height / 2

        width: 90
        height: 16

        visible: self.flight_regime == 1 
    }

    Timer {
        id: hide_rot_time
        interval: 3000
        running: false
        repeat: false

        onTriggered: {
            rot_symbol.visible = 0;
        }
    }


}
