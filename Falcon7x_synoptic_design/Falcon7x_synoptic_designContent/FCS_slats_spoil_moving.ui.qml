import QtQuick
import QtQuick.Studio.Components

Item {
    id: fcs_sfcc_num
    x: 0
    y: 0
    width: 13
    height: 23

    TriangleItem {
        id: triangle
        x: 0
        y: 0
        width: 13
        height: 8
        radius: 0
        fillColor: "#00ff00"
        strokeColor: "#00ff0000"
        strokeWidth: 0
    }

    TriangleItem {
        id: triangle1
        x: 0
        y: 15
        width: 13
        height: 8
        radius: 0
        rotation: 180
        strokeWidth: 0
        strokeColor: "#00ff0000"
        fillColor: "#00ff00"
    }

    Rectangle {
        id: rectangle15
        x: 3
        y: 7
        width: 7
        height: 11
        color: "#00ff00"
        border.color: "#00000000"
    }
}
