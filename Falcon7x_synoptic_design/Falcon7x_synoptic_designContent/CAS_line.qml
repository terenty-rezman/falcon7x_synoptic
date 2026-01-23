

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick

Item {
    id: self
    width: 253
    height: 19
    property string type: "none"
    property alias text: _text.text
    property bool is_read: true

    readonly property string red_color: "#ff0000"
    readonly property string yellow_color: "#FFFF00"
    readonly property string white_color: "#ffffff"
    readonly property string black_color: "#000000"

    onTypeChanged: {
        change_state();
    }

    onIs_readChanged: {
        change_state();
    }

    function change_state(){
        if (type == "end") {
            rectangle1.color = black_color;
            _text.color = white_color;
            _text.horizontalAlignment = Text.AlignHCenter;
            return;
        } else {
            _text.horizontalAlignment = Text.AlignLeft;
        }

        if (is_read == true){
            rectangle1.color = "#000000";

            if (type == "red"){
                _text.color = red_color;
            }
            if (type == "yellow"){
                _text.color = yellow_color;
            }
            if (type == "white"){
                _text.color = white_color;
            }
        }
        else{
            if (type == "red"){
                rectangle1.color = red_color;
                _text.color = white_color;
            }
            if (type == "yellow"){
                rectangle1.color = yellow_color;
                _text.color = black_color;
            }
            if (type == "white"){
                rectangle1.color = white_color;
                _text.color = black_color;
            }
        }

        
        console.log(rectangle1.color)
        console.log(_text.color)
        console.log("")
    }

    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: 0
    //     y: 0
    //     visible: true
    //     source: "images/ECS.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit
    // }

    Rectangle {
        id: rectangle1
        x: 0
        y: 0
        width: 253
        height: 19
        color: "#000"
        border.width: 0
    }

    Text {
        id: _text
        x: 1
        y: 0
        width: 252
        height: 19
        visible: true
        color: "#000"
        text: qsTr("")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignLeft
        lineHeight: 0.9
        font.family: "Arial"
    }
}
