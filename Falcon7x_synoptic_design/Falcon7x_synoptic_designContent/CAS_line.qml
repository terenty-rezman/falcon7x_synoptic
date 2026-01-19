

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
    property string red_color: "#ff0000"
    property string yellow_color: "#0CDCD2"
    property string white_color: "#ffffff"
    property string black_color: "#000000"

    onTypeChanged: {
        change_state()
    }
    onIs_readChanged: {
        change_state()
    }

    function change_state(){
        if (is_read==true){
            rectangle1.color="#000000";
            if (type=="red"){
                _text.color=red_color;
            }
            if (type=="yellow"){
                _text.color=yellow_color;
            }
            if (type=="white"){
                _text.color=white_color;
            }
        }
        else{
            if (type=="red"){
                rectangle1.color=red_color;
                _text.color = white_color;
            }
            if (type=="yellow"){
                rectangle1.color=yellow_color;
                 _text.color = black_color;
            }
            if (type=="white"){
                rectangle1.color=black_color;
            }

        }

    }

    // visible: true

    //color: Constants.backgroundColor
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
        color: "#ffffff"
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
        text: qsTr("ENGINES: ALL OUT")
        font.letterSpacing: -0.3
        font.pixelSize: 18
        horizontalAlignment: Text.AlignLeft
        lineHeight: 0.9
        font.family: "Arial"
    }
    property string type: "empty"
    property alias text: _text.text
    property bool is_read: false

    // states: [
    //     State {
    //         name: "warning"
    //         when: self.state === 1
    //         PropertyChanges {
    //             target: _text
    //             color: "#ffffff"
    //             font.letterSpacing: -0.3
    //         }
    //         PropertyChanges {
    //             target: rectangle1
    //             color: "ff0000"
    //         }
    //     },
    //     State {
    //         name: "caution"
    //         when: self.state === 2
    //         PropertyChanges {
    //             target: _text
    //             color: "#000000"
    //             font.letterSpacing: -0.3
    //         }
    //         PropertyChanges {
    //             target: rectangle1
    //             color: "#0CDCD2"
    //         }
    //     },
    //     State {
    //         name: "advisory"
    //         when: self.state === 2
    //         PropertyChanges {
    //             target: _text
    //             color: "#000000"
    //             font.letterSpacing: -0.3
    //         }
    //         PropertyChanges {
    //             target: rectangle1
    //             color: "#0CDCD2"
    //         }
    //     }
    // ]
}
