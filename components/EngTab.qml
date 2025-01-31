import QtQuick 2.15

import "basic_components"

Item {
    Image {
        id: eng_tab
        source: "png/eng_tab.png"
        visible: false
    }

    Text {
        text: "N1\n%"
        x: 17
        y: 46   

        color: "#ffffff"
        font.pixelSize: 18
        font.bold: true
    }

    EngN1 {
        objectName: "eng_engn1"
        x: 53
        y: 26
    }

    EngN1 {
        objectName: "eng_engn2"
        x: 191
        y: 26
    }

    EngN1 {
        objectName: "eng_engn3"
        x: 328
        y: 26
    }


    ApuN1T5 {
        objectName: "eng_apun1t5"
        x: 462
        y: 20
    }

}
