import QtQuick 2.15

Item {
    id: self
    property real altitude_ft: 8400
    property bool fail: false
    property int state: 2

    onAltitude_ftChanged: {
        if (altitude_ft < 8300)
            self.state = 1
        else
            self.state = 2
    }

    Image {
        id: svg_background_image

        source: "../svg/ECS_ALTITUDE_BACKGROUND_NORMAL.svg"

        width: 61
        height: 52

        y: -height/2
    }

    Text {
        x: 10 
        y: -height/2
        text: Math.floor((altitude_ft / 100) / 10 % 100 / 10);
        visible: ((altitude_ft / 100) > 100 && self.fail == false) ? true : false;
        color: "#00FC00"
        font.pixelSize: 26
        font.bold: true
        font.family: "Helvetica"
    }

    Text {
        id: first_digit
        x: 12
        y: -16
        text: Math.floor((altitude_ft / 100) / 10 % 10);
        visible: ((altitude_ft / 100) > 10 && self.fail == false) ? true : false;
        color: "#00FC00"
        font.pixelSize: 24
        font.bold: true
        font.family: "Helvetica"
    }

    ECS_RollNumber1Digit {
        id: digits_1
        x: 22
        y: 0
        value: (altitude_ft / 100) * 10 % 100 / 10
        color: "#00FC00"
        visible: self.fail == false
    }

    ECS_RollNumber2Digits {
        id: digits_2
        x: 23
        y: 0
        value: altitude_ft % 100
        font: "bold 18px sans-serif"
        color: "#00FC00"
        visible: self.fail == false

    }

    states: [
        State {
            name: "normal"
            when: self.state == 1
            PropertyChanges {
                target: svg_background_image
                source: "../svg/ECS_ALTITUDE_BACKGROUND_NORMAL.svg"

            }
            PropertyChanges {
                target: first_digit
                color: "#00FC00"

            }
            PropertyChanges {
                target: digits_1
                color:  "#00FC00"
            }
            PropertyChanges {
                target: digits_2
                color: "#00FC00"
            }
        },
        State {
            name: "to_high"
            when: self.state == 2
            PropertyChanges {
                target: svg_background_image
                source: "../svg/ECS_ALTITUDE_BACKGROUND_TOO_HIGH.svg"

            }
            PropertyChanges {
                target: first_digit
                color: "#ffffff"

            }
            PropertyChanges {
                target: digits_1
                color:  "#ffffff"
            }
            PropertyChanges {
                target: digits_2
                color: "#ffffff"
            }
        },
        State {
            name: "invalid_data"
            when: self.state == 3
            PropertyChanges {
                target: svg_background_image
                source: "../svg/ECS_ALTITUDE_BACKGROUND_INVALID_DATA.svg"

            }
            PropertyChanges {
                target: first_digit
                color: "trasparent"

            }
            PropertyChanges {
                target: digits_1
                color:  "trasparent"
            }
            PropertyChanges {
                target: digits_2
                color: "trasparent"
            }
        }
    ]
}
