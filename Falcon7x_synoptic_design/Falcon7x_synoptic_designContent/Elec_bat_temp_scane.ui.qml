import QtQuick
import QtQuick.Studio.Components

// import "Helpers.js" as helpers
Item {
    id: self
    // property alias triangle_pos: triangle.x

    // property int state: 0
    Rectangle {
        id: rectangle_white
        width: 37
        height: 8
        color: "#ffffff"
        border.color: "#00000000"
    }
    Rectangle {
        id: rectangle_yellow
        x: 37
        y: 0
        width: 18
        height: 8
        color: "#d2b60c"
        border.color: "#00000000"
    }
    Rectangle {
        id: rectangle_red
        x: 55
        y: 0
        width: 18
        height: 8
        color: "#FF0000"
        border.color: "#00000000"
    }

    TriangleItem {
        id: triangle
        x: 22
        y: 8
        width: 14
        height: 9
        radius: 0
        fillColor: "#21da1b"
        strokeColor: "#00ff0000"
    }
}
