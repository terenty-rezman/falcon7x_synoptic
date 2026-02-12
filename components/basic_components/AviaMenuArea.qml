import QtQuick 2.15
import QtQuick.Controls.Material 

import "../js/helpers.mjs" as Helpers

MouseArea {
    id: self 

    property var menu: null 

    acceptedButtons: Qt.RightButton
    propagateComposedEvents: true

    onClicked: (mouse) => {
        if (mouse.button === Qt.RightButton && mouse.modifiers & Qt.AltModifier) {
            if (menu != null) {
                menu.popup(Qt.point(self.width - menu.width, 0));
            } 
        }  else {
            mouse.accepted = false;
        }
    }
}
