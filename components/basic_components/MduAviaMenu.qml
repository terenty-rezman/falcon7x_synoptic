import QtQuick 2.15
import QtQuick.Controls.Material 

import "../js/helpers.mjs" as Helpers

Item {
    id: self

    width: view.screen_width
    height: view.screen_height

    // Rectangle {
    //     anchors.fill: parent
    //     color: "#ff0000"
    //     opacity: 0.5
    // }

    Connections {
        target: view

        function calc_vertical_offset() {
            if (view.vertical_position == "top") {
                self.y = 0;
            }
            else {
                self.y = -(1 / 2 ) * view.screen_height;
            }
        }

        function calc_horizontal_offset() {
            if (view.horizontal_position == "left") {
                self.x = 0;
            }
            else {
                self.x = -(2 / 3 ) * view.screen_width;
            }
        }

        function onVertical_positionChanged(){
            calc_vertical_offset();
        }

        function onHorizontal_positionChanged(){
            calc_horizontal_offset();
        }

        function onScreen_widthChanged() {
            calc_horizontal_offset();
        }

        function onScreen_heightChanged() {
            calc_vertical_offset();
        }
    }

    // top left menu
    AviaMenuArea { 
        menu: pages_menu_top_left

        x: 0
        y: 0
        width: parent.width * (2 / 3)
        height: parent.height * (1 / 2)

        // Rectangle {
        //     color: "#ff00ff"
        //     anchors.fill: parent
        //     opacity: 0.5
        // }

        AviaMenu {
            id: pages_menu_top_left

            AviaMenuItem {
                text: "INAV"
            }

            AviaMenuItem {
                text: "WPT LIST"
            }

            AviaMenuItem {
                text: "FLIGHT MGMT"
            }

            AviaMenuItem {
                text: "SYNOPTIC"
            }

            AviaMenuItem {
                text: "AVIONICS"
            }
        }
    }

    // bottom left menu
    AviaMenuArea { 
        menu: pages_menu_bottom_left

        x: 0
        y: 0 + parent.height * (1 / 2)
        width: parent.width * (2 / 3)
        height: parent.height * (1 / 2)

        // Rectangle {
        //     color: "#00ffff"
        //     anchors.fill: parent
        //     opacity: 0.5
        // }

        AviaMenu {
            id: pages_menu_bottom_left

            AviaMenuItem {
                text: "INAV"
            }

            AviaMenuItem {
                text: "WPT LIST"
            }

            AviaMenuItem {
                text: "FLIGHT MGMT"
            }

            AviaMenuItem {
                text: "SYNOPTIC"
            }

            AviaMenuItem {
                text: "AVIONICS"
            }
        }
    }

    // top right menu
    AviaMenuArea { 
        menu: pages_menu_top_right

        x: 0 + parent.width * (2 / 3)
        y: 0
        width: parent.width * (1 / 3)
        height: parent.height * (1 / 2)

        // Rectangle {
        //     color: "#ffff00"
        //     anchors.fill: parent
        //     opacity: 0.5
        // }

        AviaMenu {
            id: pages_menu_top_right

            AviaMenuItem {
                text: "WPT LIST"
            }

            AviaMenuItem {
                text: "FLIGHT MGMT"
            }

            AviaMenuItem {
                text: "FULL INAV"
            }
        }
    }

    // bottom right menu
    AviaMenuArea { 
        menu: pages_menu_bottom_right

        x: parent.width * (2 / 3)
        y: parent.height * (1 / 2)
        width: parent.width * (1 / 3)
        height: parent.height * (1 / 2)

        // Rectangle {
        //     color: "#00ff00"
        //     anchors.fill: parent
        //     opacity: 0.5
        // }

        AviaMenu {
            id: pages_menu_bottom_right

            AviaMenuItem {
                text: "WPT LIST"
            }

            AviaMenuItem {
                text: "FLIGHT MGMT"
            }

            AviaMenuItem {
                text: "FULL INAV"
            }

            AviaMenuItem {
                visible: view.is_down_mdu == true
                text: "CHECKLIST"
            }
        }
    }
}
