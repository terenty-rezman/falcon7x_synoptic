import QtQuick 2.15
import QtQuick.Controls.Material 

import "../js/helpers.mjs" as Helpers

Rectangle {
    id: control

    width: 135
    height: 45 

    property alias text: _text.text

    property bool currently_selected: menu_manager.current_window_tile == text
    property bool pressed: false

    MouseArea {
        anchors.fill: parent

        onReleased: {
            control.pressed = false;
            window_manager.menu_item_clicked(view, text, view.mouse_global_click_pos);
            menu_manager.close_menu();
        }

        onPressed: {
            control.pressed = true;
        }
    }

    Rectangle {
        color: control.pressed || control.currently_selected ? "#00ff00" :"#00cccc"
        anchors.fill: parent
        border.width: 2
        border.color: "#009999"

        BlueBorder { cyan_color: "#fff" }
    }

    Text {
        id: _text
        anchors.fill: parent
        text: parent.text
        color: "#fff"
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: 16
        font.bold: true
        font.family: "Helvetica"
    }
}
