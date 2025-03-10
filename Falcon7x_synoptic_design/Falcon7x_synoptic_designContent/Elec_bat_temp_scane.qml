import QtQuick
import QtQuick.Studio.Components

import "../../components/js/helpers.mjs" as Helpers


Item {
    id: self
    property real temp: 0

    Rectangle {
        id: rectangle_white
        x: 8
        y: 0
        width: 37
        height: 8
        color: "#ffffff"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle_yellow
        x: 45
        y: 0
        width: 18
        height: 8
        color: "#d2b60c"
        border.color: "#00000000"
    }

    Rectangle {
        id: rectangle_red
        x: 63
        y: 0
        width: 18
        height: 8
        color: "#FF0000"
        border.color: "#00000000"
    }

    TriangleItem {
        id: triangle
        x: 2
        y: 9
        width: 14
        height: 9
        radius: 0
        fillColor: "#21da1b"
        strokeColor: "#00ff0000"
    }

    onTempChanged: () => {
       const temp_args = [0, 56, 80, 100]
       const x_vals = [1, 39, 56, 74]
       const map_temp = new Helpers.Interp1d(temp_args, x_vals);
       let pos_x = map_temp.interp(self.temp);
       triangle.x = pos_x;
    }
}
