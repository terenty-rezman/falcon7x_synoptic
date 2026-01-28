import QtQuick 2.15
import QtQuick.Studio.Components
import QtQuick.Shapes

Item {
    id: self

    readonly property real vy_ft_per_min: -1500
    readonly property real limit_rate: 3550
    readonly property int max_warning_zone: 2500
    readonly property int min_warning_zone: -1500
    property int y_center: height / 2
    property int y_center_plot: main_rectangle.height-2*main_rectangle.border.width
    readonly property int line_width: 4

    width: 40
    height: 198
    // Image {
    //     id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
    //     x: -77
    //     y: 0
    //     width: 241
    //     height: 198
    //     visible: true
    //     source: "../../Falcon7x_synoptic_design/Falcon7x_synoptic_designContent/images/ECS_vertical_rate.png"
    //     enabled: true
    //     fillMode: Image.PreserveAspectFit

    // }
    Rectangle {
        id: main_rectangle
        x: 0
        y: 0
        width: 40
        height: 198
        color: "#8a9b91"
        radius: 2
        border.color: "#9faea4"
        border.width: 2
    }
    Shape {
        id:top_amber
        width: 40
        height: 70
        visible:self.vy_ft_per_min >= self.max_warning_zone
        //anchors.verticalCenterOffset: 108
        //anchors.horizontalCenterOffset: 166
        //anchors.centerIn: parent
        ShapePath {
            strokeWidth: 0
            //strokeColor: "red"
            fillColor: "#ffbf00"
            strokeStyle: ShapePath.SolidLine
            startX: 2; startY: 2
            PathLine { x: 2; y: 24 }
            PathLine { x: 38; y: 50 }
            PathLine { x: 38; y: 2 }
            PathLine { x: 2; y: 2}
        }
    }

    Shape {
        id:bottom_amber
        width: 40
        height: 70
        visible:self.vy_ft_per_min <= self.min_warning_zone
        //anchors.verticalCenterOffset: 108
        //anchors.horizontalCenterOffset: 166
        //anchors.centerIn: parent
        ShapePath {
            strokeWidth: 0
            //strokeColor: "red"
            fillColor: "#ffbf00"
            strokeStyle: ShapePath.SolidLine
            startX: 2; startY: 146
            PathLine { x: 2; y: 196 }
            PathLine { x: 38; y: 196 }
            PathLine { x: 38; y: 129 }
            PathLine { x: 2; y: 146}
        }
    }

    ZoneText {
        id: _text6
        x: 43
        y: 86
        value: self.vy_ft_per_min
        font.letterSpacing: 1
        font.pixelSize: 20
        font.family: "Arial"
        value_zones: [-self.limit_rate, self.min_warning_zone+1, self.max_warning_zone-1, self.limit_rate]
        state_zones: ["yellow","green","yellow","yellow"]
    }



    Rectangle {
        id: rectangle1
        x: 13
        y: 23
        width: 17
        height: 2
        color: "#000000"
        border.width: 0
        rotation: 45
    }
    Rectangle {
        id: rectangle1O
        x: 13
        y: 173
        width: 17
        height: 2
        color: "#000000"
        border.width: 0
        rotation: -45
    }
    // Image {
    //     x: 576
    //     y: 94
    //     source: "../svg/ADI_VERTICAL_SPEED_BACKGROUND.svg"

    //     width: 41
    //     height: 236
    // }




    Text {
        id: _text7
        x: 47
        y: 108
        color: "#9faea4"
        text: qsTr("ft/min")
        font.letterSpacing: 0.9
        font.pixelSize: 18
        font.styleName: "Narrow"
        font.family: "Arial"
    }



    Rectangle {
        id: rectangle9
        x: 2
        y: 79
        width: 4
        height: 34
        color: "#00ff00"
        border.width: 0
        rotation: 0
    }
    Text {
            id: _text
            x: 5
            y: 6
            text: qsTr("3")
            font.pixelSize: 18
            font.family: "Arial"
        }

    Text {
            id: _text1
            x: 5
            y: 34
            text: qsTr("2")
            font.pixelSize: 18
            font.family: "Arial"
    }

    Text {
        id: _text2
        x: 5
        y: 62
        text: qsTr("1")
        font.pixelSize: 18
        font.family: "Arial"
        }

    Text {
            id: _text3
            x: 5
            y: 118
            text: qsTr("1")
            font.pixelSize: 18
            font.family: "Arial"
        }

    Text {
            id: _text4
            x: 5
            y: 146
            text: qsTr("2")
            font.pixelSize: 18
            font.family: "Arial"
        }

    Text {
            id: _text5
            x: 5
            y: 173
            text: qsTr("3")
            font.pixelSize: 18
            font.family: "Arial"
        }
    Rectangle {
        id: rectangle2
        x: 14
        y: 48
        width: 14
        height: 2
        color: "#000000"
        border.width: 0
        rotation: 32
    }
    Rectangle {
        id: rectangle2O
        x: 14
        y: 148
        width: 14
        height: 2
        color: "#000000"
        border.width: 0
        rotation: -32
    }
    Rectangle {
        id: rectangle3
        x: 14
        y: 72
        width: 12
        height: 2
        color: "#000000"
        border.width: 0
        rotation: 16
    }
    Rectangle {
        id: rectangle3O
        x: 14
        y: 123
        width: 12
        height: 2
        color: "#000000"
        border.width: 0
        rotation: -16
    }


    Rectangle {
        id: rectangle4
        x: 21
        y: 85
        width: 6
        height: 2
        color: "#000000"
        border.width: 0
        rotation: 0
    }

    Rectangle {
        id: rectangle5
        x: 23
        y: 92
        width: 4
        height: 2
        color: "#000000"
        border.width: 0
        rotation: 0
    }

    Rectangle {
        id: rectangle6
        x: 23
        y: 103
        width: 4
        height: 2
        color: "#000000"
        border.width: 0
        rotation: 0
    }

    Rectangle {
        id: rectangle7
        x: 21
        y: 110
        width: 6
        height: 2
        color: "#000000"
        border.width: 0
        rotation: 0
    }

    Rectangle {
        id: rectangle8
        x: 6
        y: 98
        width: 15
        height: 2
        color: "#000000"
        border.width: 0
        rotation: 0
    }



    Rectangle {
        id: rectangle2O1
        x: 2
        y: 139
        width: 32
        height: 2
        color: "#ffbf00"
        border.width: 0
        rotation: -26
    }

    Rectangle {
        id: rectangle2O2
        x: 1
        y: 33
        width: 34
        height: 2
        color: "#ffbf00"
        border.width: 0
        rotation: 35
    }
    Connections {
        target: backend
        function onUpdateCanvas() {
            canvas.requestPaint()
        }
    }

    Canvas {
        id: canvas
        anchors.fill: parent


        onPaint: {
            //let y = 0;
            let y_1 = 0;
            let y_2 = 0;
            let half_width = line_width/2

            const abs_vy = Math.abs(self.vy_ft_per_min);
            let vy = self.vy_ft_per_min;

            //const limit_vy = 5000;
            if (vy > limit_rate) {
                vy = limit_rate;
            } else if (vy < -limit_rate) {
                vy = -limit_rate;
            }

            //y = -vy / (limit_rate*2)*y_center_plot + y_center;
            y_1 = -vy / (2*limit_rate)*(y_center_plot-main_rectangle.border.width-half_width) + (y_center-half_width);
            y_2 = -vy / (2*limit_rate)*(y_center_plot-main_rectangle.border.width-half_width) + (y_center+half_width);




            const ctx = getContext("2d");
            ctx.reset();

            // draw sky rect

            if (vy <= self.min_warning_zone || vy >= self.max_warning_zone){

                ctx.strokeStyle = "#000000";
                ctx.fillStyle = "#ffbf00";
            }
            else
            {
                ctx.strokeStyle = "#00FF00";
                ctx.fillStyle = "#00ff00";
            }

            ctx.lineWidth = 1;

            // ctx.moveTo(97, y_center);
            // ctx.lineTo(21, y);

            ctx.beginPath();
            ctx.moveTo(97, y_center-half_width);
            ctx.lineTo(17, y_1);
            ctx.lineTo(17, y_2);
            ctx.lineTo(97, y_center+half_width);
            //ctx.lineTo(97, y_center-half_width);
            ctx.closePath();
            ctx.fill()
            ctx.stroke()
        }
    }



    // Rectangle {
    //     id: rectangle
    //     x: -6
    //     y: 69
    //     width: 149
    //     height: 1
    //     color: "#ffffff"
    //     rotation: 45
    // }

    // Rectangle {
    //     id: rectangle10
    //     x: -6
    //     y: 127
    //     width: 149
    //     height: 1
    //     color: "#ffffff"
    //     rotation: -45
    // }

    // Rectangle {
    //     id: rectangle11
    //     x: 0
    //     y: 98
    //     width: 149
    //     height: 1
    //     color: "#ffffff"
    //     rotation: 0
    // }

    // EllipseItem {
    //     id: ellipse
    //     x: 107
    //     y: 110
    //     width: 3
    //     height: 3
    //     strokeWidth: 0
    // }
}
