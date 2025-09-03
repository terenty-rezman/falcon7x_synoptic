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
        x: 5
        y: -1

        color: "#ffffff"
        font.pixelSize: 18
        font.bold: true
    }

    EngN1 {
        objectName: "eng_engn1"
        x: 23
        y: 13
        ab_visible: false
    }

    EngN1 {
        objectName: "eng_engn2"
        x: 121
        y: 13
        ab_visible: false
    }

    EngN1 {
        objectName: "eng_engn3"
        x: 228
        y: 13
        ab_visible: false
    }

    Text {
        text: "ITT\n°C"
        x: 5
        y: 90

        color: "#ffffff"
        font.pixelSize: 18
        font.bold: true
    }

    EngITT {
        objectName: "eng_itt1"
        x: 23
        y: 87
    }

    EngITT {
        objectName: "eng_itt2"
        x: 121
        y: 87
    }

    EngITT {
        objectName: "eng_itt3"
        x: 228
        y: 87
    }

    Text {
        text: "N2%"
        x: 5
        y: 160

        color: "#ffffff"
        font.pixelSize: 18
        font.bold: true
    }

    MappedValueText {
        objectName: "eng_n2_1"
        
        x: 57
        y: 160
    }

    MappedValueText {
        objectName: "eng_n2_2"
        
        x: 157
        y: 160
    }

    MappedValueText {
        objectName: "eng_n2_3"
        
        x: 257
        y: 160
    }
}
