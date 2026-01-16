import QtQuick

Item {
    id: fcs_mfcc_num
    x: 0
    y: 0
    width: 115
    height: 42

    property bool sys1_ok: true
    property bool sys2_ok: false
    property bool sys3_ok: false


    /*Image {
        id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
        x: -33
        y: -91
        visible: false
        source: "images/FCS.png"
        enabled: true
        fillMode: Image.PreserveAspectFit
    }*/
    Rectangle {
        id: rect_1
        x: 12
        y: 13
        width: 23
        height: 22
        color: "transparent"
        radius: 2
        border.color: (sys1_ok) ? "#00ff00" : "#d2b60c"
        border.width: 2
    }

    Rectangle {
        id: rect_2
        x: 47
        y: 13
        width: 23
        height: 22
        color: "transparent"
        radius: 2
        border.color: (sys2_ok) ? "#00ff00" : "#d2b60c"
        border.width: 2
    }

    Rectangle {
        id: rect_3
        x: 82
        y: 13
        width: 23
        height: 22
        color: "transparent"
        radius: 2
        border.color: (sys3_ok) ? "#00ff00" : "#d2b60c"
        border.width: 2
    }
    Text {
        id: num_1
        x: 19
        y: 16
        color: (sys1_ok) ? "#00ff00" : "#d2b60c"
        text: qsTr("1")
        font.pixelSize: 14
        font.family: "Arial"
    }

    Text {
        id: num_2
        x: 55
        y: 16
        color: (sys2_ok) ? "#00ff00" : "#d2b60c"
        text: qsTr("2")
        font.pixelSize: 14
        font.family: "Arial"
    }

    Text {
        id: num_3
        x: 90
        y: 16
        color: (sys3_ok) ? "#00ff00" : "#d2b60c"
        text: qsTr("3")
        font.pixelSize: 14
        font.family: "Arial"
    }

    Rectangle {
        id: rect_frame
        x: 0
        y: 0
        width: 115
        height: 42
        color: "#00ffffff"
        border.color: (sys1_ok || sys2_ok || sys3_ok) ? "#00ff00" : "#d2b60c"
        border.width: 2
    }

    Rectangle {
        id: rect_black
        x: 32
        y: -8
        width: 53
        height: 19
        color: "#000000"
        border.color: "#00000000"
    }

    Text {
        id: _text
        x: 40
        y: -8
        color: (sys1_ok || sys2_ok || sys3_ok) ? "#00ff00" : "#d2b60c"
        text: qsTr("MFCC")
        font.letterSpacing: -0.9
        font.pixelSize: 17
        font.styleName: "Narrow"
        font.family: "Arial"
    }
}
