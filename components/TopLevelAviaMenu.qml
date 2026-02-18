import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"
import "../Falcon7x_synoptic_design/Falcon7x_synoptic_designContent"


Item {
    ColumnLayout {
        id: left_side_menu

        anchors.fill: parent

        visible: menu_manager.screen_quadrant == "topleft" || menu_manager.screen_quadrant == "bottomleft"

        spacing: 0

        MyAviaMenuItem {
            text: "INAV"
        }

        MyAviaMenuItem {
            text: "WPT LIST"
        }

        MyAviaMenuItem {
            text: "FLIGHT MGMT"
        }

        MyAviaMenuItem {
            text: "SYNOPTIC"
        }

        MyAviaMenuItem {
            text: "AVIONICS"
        }
    }

    ColumnLayout {
        id: right_side_menu

        anchors.fill: parent

        visible: menu_manager.screen_quadrant == "topright" || menu_manager.screen_quadrant == "bottomright"

        spacing: 0

        MyAviaMenuItem {
            text: "WPT LIST"
        }

        MyAviaMenuItem {
            text: "FLIGHT MGMT"
        }

        MyAviaMenuItem {
            text: "FULL INAV"
        }

        MyAviaMenuItem {
            text: "CHECKLIST"
            visible: menu_manager.is_down_mdu == true && menu_manager.screen_quadrant == "bottomright" 
        }
    }
}
