import QtQuick 2.15

Item {
    id: self
    property real altitude_ft: 0
    property bool fail: false

    Image {
        source: "../svg/ADI_ALTITUDE_BACKGROUND.svg"

        width: 86
        height: 57

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
        x: 38
        value: (altitude_ft / 100) * 10 % 100 / 10
        color: "#00FC00"
        visible: self.fail == false
    }

    RollNumber2Digits {
        x: 45
        value: altitude_ft % 100
        color: "#00FC00"
        visible: self.fail == false
    }
}
