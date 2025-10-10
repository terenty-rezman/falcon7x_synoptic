import QtQuick 2.15

Item {
    property real speed: 0
    property bool fail: false

    Image {
        source: "../svg/ADI_VELOCITY_BACKGROUD.svg"

        width: 81
        height: 41

        y: -height/2
    }

    Text {
        x: 10 
        y: -height/2
        text: Math.floor((self.speed) / 10 % 100 / 10);
        color: "#00FC00"
        font.pixelSize: 26
        font.bold: true
        font.family: "Helvetica"
        visible: !self.fail
    }

    Text {
        x: 27 
        y: -height/2
        text: Math.floor((self.speed) / 10 % 10);
        color: "#00FC00"
        font.pixelSize: 26
        font.bold: true
        font.family: "Helvetica"
        visible: !self.fail
    }

    RollNumber1Digit {
        x: 42
        height: 30
        pixel_height: 20
        value: (self.speed) * 10 % 100 / 10
        color: "#00FC00"
        visible: !self.fail
    }
}
