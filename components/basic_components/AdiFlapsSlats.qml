import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Item {
    id: self

    property real flaps_pos: 0.33
    property real airbrake_pos: 0.5

    Rectangle {
        width: 79
        height: 43

        color: "transparent"

        AdiWhiteText {
            text: "CLEAN"
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            visible: self.flaps_pos == 0 && self.airbrake_pos == 0
        }
    }

    Item {
        visible: self.flaps_pos != 0 || self.airbrake_pos != 0
        Image {
            source: "../svg/ADI_SLAT_DIAL.svg"

            width: 78
            height: 62
        }

        Rectangle {
            id: airbrake

            x: 21
            y: 17

            width: 35
            height: 4
            color: "#00ff00"
            border.color: "#55000000";
            border.width: 1

            visible: self.airbrake_pos > 0

            property var map_args: [0, 0.5, 1]
            property var map_vals: [7, -8, -26]

            transform: Rotation { origin.x: 0; origin.y: 0; angle: map_airbrake(self.airbrake_pos) } // [7 -8 -26]
        }

        Image {
            id: flaps
            source: "../svg/ADI_FLAPS.svg"

            x: 15
            y: 17

            width: 61
            height: 16

            property var map_args: [0, 0.33, 0.66, 1]
            property var map_vals: [0, 7, 19, 38]
            
            transform: Rotation { origin.x: 5; origin.y: 8; angle: map_flaps(self.flaps_pos) } // [0 7 19 38]
        }

        Text {
            id: ab_digit_2
            x: 56
            y: -7
            text: "2"
            color: (self.airbrake_pos == airbrake.map_args[2]) ? "#ff66ff" : "#ffffff"
            font.pixelSize: 12
            font.bold: true
            font.family: "Helvetica"
            style: Text.Outline 
            styleColor: "#55000000"
        }

        Text {
            id: ab_digit_1
            x: 62
            y: 4
            text: "1"
            color: (self.airbrake_pos == airbrake.map_args[1]) ? "#ff66ff" : "#ffffff"
            font.pixelSize: 12
            font.bold: true
            font.family: "Helvetica"
            style: Text.Outline 
            styleColor: "#55000000"
        }

        Text {
            id: fl_digit_0
            x: 82
            y: 13
            text: "0"
            color: "#ffffff"
            font.pixelSize: 12
            font.bold: true
            font.family: "Helvetica"
            style: Text.Outline 
            styleColor: "#55000000"
        }

        Text {
            id: fl_digit_1
            x: 83
            y: 25
            text: "1"
            color: (self.flaps_pos == flaps.map_args[1]) ? "#ff66ff" : "#ffffff"
            font.pixelSize: 12
            font.bold: true
            font.family: "Helvetica"
            style: Text.Outline 
            styleColor: "#55000000"
        }

        Text {
            id: fl_digit_2
            x: 77
            y: 40
            text: "2"
            color: (self.flaps_pos == flaps.map_args[2]) ? "#ff66ff" : "#ffffff"
            font.pixelSize: 12
            font.bold: true
            font.family: "Helvetica"
            style: Text.Outline 
            styleColor: "#55000000"
        }

        Text {
            id: fl_digit_3
            x: 69
            y: 57
            text: "3"
            color: (self.flaps_pos == flaps.map_args[3]) ? "#ff66ff" : "#ffffff"
            font.pixelSize: 12
            font.bold: true
            font.family: "Helvetica"
            style: Text.Outline 
            styleColor: "#55000000"
        }

        Item {
            x: -14
            y: 15

            Image {
                source: "../svg/ADI_SLAT_ARROW.svg"

                width: 13
                height: 24
                
                visible: false
            }

            Image {
                source: "../svg/ADI_DROP_GREEN.svg"

                width: 16
                height: 35
            }
        }
    }

    function map_flaps(val) {
        const map_ = new Helpers.Interp1d(flaps.map_args, flaps.map_vals); 
        return map_.interp(val);
    }

    function map_airbrake(val) {
        const map_ = new Helpers.Interp1d(airbrake.map_args, airbrake.map_vals); 
        return map_.interp(val);
    }
}
