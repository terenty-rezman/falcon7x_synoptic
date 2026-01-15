import QtQuick 2.15

Item {
    id: self
    property real altitude_ft: 0
    property bool fail: false
    property int state: 1

    onAltitude_ftChanged: {
        if (altitude_ft < 8300)
            self.state == 1
        else
            self.state == 2
    }

    Image {
        id: svg_background_image

        source: "../svg/ECS_ALTITUDE_BACKGROUND_NORMAL.svg"

        width: 60
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
        x: 25 
        y: -height/2
        text: Math.floor((altitude_ft / 100) / 10 % 10);
        visible: ((altitude_ft / 100) > 10 && self.fail == false) ? true : false;
        color: "#00FC00"
        font.pixelSize: 26
        font.bold: true
        font.family: "Helvetica"
    }

    RollNumber1Digit {
        x: 17
        y: 0
        value: (altitude_ft / 100) * 10 % 100 / 10
        color: "#00FC00"
        visible: self.fail == false
    }

    RollNumber2Digits {
        x: 24
        y: 0
        value: altitude_ft % 100
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
        },
        State {
            name: "to_high"
            when: self.state == 2
            PropertyChanges {
                target: svg_background_image
                source: "../svg/ECS_ALTITUDE_BACKGROUND_TO_HIGH.svg"

            }
        },
        State {
            name: "invalid_data"
            when: self.state == 3
            PropertyChanges {
                target: svg_background_image
                source: "../svg/ECS_ALTITUDE_BACKGROUND_INVALID_DATA.svg"

            }
        }
    ]
}
