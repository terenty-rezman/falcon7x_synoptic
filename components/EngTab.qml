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
        y: 43   

        color: "#ffffff"
        font.pixelSize: 18
        font.bold: true
    }

    EngN1 {
        objectName: "eng_engn1"
        x: 53
        y: 24
    }

    EngN1 {
        objectName: "eng_engn2"
        x: 191
        y: 24
    }

    EngN1 {
        objectName: "eng_engn3"
        x: 328
        y: 24
    }


    ApuN1T5 {
        objectName: "eng_apun1t5"
        x: 462
        y: 20
    }

    Text {
        text: "ITT\n°C"
        x: 17
        y: 140   

        color: "#ffffff"
        font.pixelSize: 18
        font.bold: true
    }

    EngITT {
        objectName: "eng_itt1"
        x: 53
        y: 105
    }

    EngITT {
        objectName: "eng_itt2"
        x: 191
        y: 105
    }

    EngITT {
        objectName: "eng_itt3"
        x: 328
        y: 105
    }

    Text {
        text: "N2 %"
        x: 17
        y: 187   

        color: "#ffffff"
        font.pixelSize: 18
        font.bold: true
    }

    ToFixedText {
        objectName: "eng_n2_1"
        
        x: 97
        y: 187   
    }

    ToFixedText {
        objectName: "eng_n2_2"
        
        x: 233
        y: 187   
    }

    ToFixedText {
        objectName: "eng_n2_3"
        
        x: 368
        y: 187   
    }

    Text {
        text: "FF pph"
        x: 17
        y: 213

        color: "#ffffff"
        font.pixelSize: 18
        font.bold: true
    }

    ToFixedText {
        objectName: "eng_ff_1"

        precision: 0
        map_args: [0, 1]
        map_vals: [0, 7936]
        
        x: 103
        y: 213
    }

    ToFixedText {
        objectName: "eng_ff_2"

        precision: 0
        map_args: [0, 1]
        map_vals: [0, 7936]
        
        x: 239
        y: 213
    }

    ToFixedText {
        objectName: "eng_ff_3"

        precision: 0
        map_args: [0, 1]
        map_vals: [0, 7936]
        
        x: 374
        y: 213
    }

    EngOil {
        objectName: "eng_oil1"
        x: 82
        y: 243
    }

}
