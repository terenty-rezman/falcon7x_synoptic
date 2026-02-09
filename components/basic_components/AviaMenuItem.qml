import QtQuick 2.15
import QtQuick.Controls.Material 

import "../js/helpers.mjs" as Helpers

MenuItem {
    id: control
    text: "INAV"
    width: 135

    property bool currently_selected: view.current_window_tile == text

    onTriggered: {
        window_manager.menu_item_clicked(view, text, view.mouse_global_click_pos);
    }

    background: Rectangle {
        color: control.pressed || control.currently_selected ? "#00ff00" :"#00cccc"
        anchors.fill: parent
        border.width: 2
        border.color: "#009999"

        BlueBorder { cyan_color: "#fff" }
    }

    contentItem: Text {
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
