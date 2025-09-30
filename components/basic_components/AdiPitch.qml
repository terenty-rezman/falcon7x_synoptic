import QtQuick 2.15
import QtQuick.Shapes 1.9
import "../js/helpers.mjs" as Helpers

Item {
    id: self

    property int state: 0
    property real elv_trim: 0

    width: 45
    height: 69

    Image {
        source: "../svg/ADI_PITCH.svg"

        width: 45
        height: 69
    }

    Shape {
        width: 16
        height: 16
        x: 20
        y: calc_position(self.elv_trim) + 5; 

        ShapePath {
            strokeWidth: 0
            // strokeColor: "#00FF00"
            fillColor: "#00FF00"
            PathLine { x: 0; y: 0 }
            PathLine { x: 8; y: 8 }
            PathLine { x: 0; y: 16 }
        }

        function calc_position(elv_trim) {
            const map_elv_to_pix = new Helpers.Interp1d([-1.0, 0, 1.0], [-10, 0, 53]);
            return map_elv_to_pix.interp(elv_trim);
        }
    }

    AdiWhiteText {
        text: "PITCH"
        anchors.left: parent.left
        anchors.right: parent.right
        y: -26

        horizontalAlignment: Text.AlignHCenter
    }
}
