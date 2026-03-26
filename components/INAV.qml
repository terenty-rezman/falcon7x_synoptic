import QtQml 2.12
import QtQuick
import QtQuick.Window 2.0
import QtLocation 6.5
// import QtPositioning 5.7
import QtQuick.Controls 2.0
// import QtQuick.Controls.Styles
import QtQuick.Shapes
import QtQuick.Layouts
import QtQuick.Controls.Material 

import "basic_components"

Rectangle {
    id: self

    property real centerLatitude: 43.333
    property real centerLongitude: 40.333


    Plugin {
        id: mapPlugin
        name: "osm"
        
        // PluginParameter {
        //      name: "osm.mapping.host";
        //      value: "http://a.tile.openstreetmap.org/"
        // }

        // PluginParameter {
        //             name: "osm.mapping.offline.directory"
        //             value: "file:///" + backend_map_path
        //         }

        // PluginParameter {
        //     name: "osm.mapping.offline.tileformat"
        //     value: "mbtiles"
        // }
    }

    Map {
        id: map1
        objectName: "inav_map"

        anchors.top: topBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        plugin: mapPlugin
        
        center.latitude: planeMarker.latitude
        center.longitude: planeMarker.longitude
        // center{
        //     latitude: centerLatitude
        //     longitude: centerLongitude
        // }

        zoomLevel: 12
        // activeMapType: map1.supportedMapTypes[6]
        copyrightsVisible: false
        bearing: 0

        // MapPolyline {
        //     line.width: 3
        //     line.color: 'red'
        //     path: polylinePath
        // }

        MapItemView {
            model: markerModel // The model exposed from Python
            delegate: MapQuickItem {
                // Access data from the model using role names
                anchorPoint: Qt.point(5, 5) // Center the marker
                coordinate: model.position // 'position' role from Python model

                autoFadeIn: false

                // Add a visual item as the map item
                sourceItem: Rectangle {
                    id: markerRect
                    width: 10
                    height: 10
                    radius: 5

                    color: "white"

                    border.width: 2
                    border.color: "black"

                    Text{
                        y: 15
                        x: -width/2
                        text: model.name
                        color: "white"

                        Rectangle {
                            color: "#55000000"
                            anchors.fill: parent
                            anchors.leftMargin: -5
                            anchors.rightMargin: -5
                            z: -1
                        }
                    }
                }
            }
        }

        MapQuickItem {
            id: planeMarker
            objectName: "inav_plane_marker"
            property real latitude:  43.433
            property real longitude: 40.333
            property real heading:  45 

            coordinate{
                latitude:  latitude
                longitude: longitude
            }
            sourceItem: Item {
                Image {
                    id: planeMarkerImage
                    anchors.centerIn: parent

                    source: "svg/INAV_AC_SYMBOL.svg"

                    width: 44 
                    height: 46

                    transformOrigin: Item.Center
                    rotation: planeMarker.heading - map1.bearing
                }
            }
        }

        // range circle
        Shape {
            id: map_circle
            anchors.centerIn: parent

            readonly property int circle_radius: 300

            width: 650
            height: 650

            layer.enabled: true // Enables antialiasing
            layer.samples: 4

            AdiWhiteText {
                id: circle_raidus_text1
                anchors.verticalCenter: parent.verticalCenter
                x: 25 - width/2

                text: "20"
                color: "white"

                Rectangle {
                    color: "black"
                    anchors.fill: parent
                    anchors.leftMargin: -5
                    anchors.rightMargin: -5
                    z: -1
                }
            }

            AdiWhiteText {
                id: circle_raidus_text2
                anchors.verticalCenter: parent.verticalCenter
                x: map_circle.width - 25 - width/2

                text: circle_raidus_text1.text
                color: "white"

                Rectangle {
                    color: "black"
                    anchors.fill: parent
                    anchors.leftMargin: -5
                    anchors.rightMargin: -5
                    z: -1
                }
            }

            ShapePath {
                strokeColor: "black"
                strokeWidth: 5
                fillColor: "transparent" // Or a color to fill the pie
                capStyle: ShapePath.RoundCap

                // Creates a partial circle (arc)
                PathAngleArc {
                    centerX: map_circle.width / 2
                    centerY: map_circle.height / 2
                    radiusX: map_circle.circle_radius
                    radiusY: map_circle.circle_radius
                    startAngle: 0
                    sweepAngle: 360 
                }
            }

            ShapePath {
                strokeColor: "white"
                strokeWidth: 3 
                fillColor: "transparent" // Or a color to fill the pie
                capStyle: ShapePath.RoundCap

                // Creates a partial circle (arc)
                PathAngleArc {
                    centerX: map_circle.width / 2
                    centerY: map_circle.height / 2
                    radiusX: map_circle.circle_radius
                    radiusY: map_circle.circle_radius
                    startAngle: 0
                    sweepAngle: 360 
                }
            }
        }

        // MapQuickItem {
        //     id: initPosMarker
        //     property real latitude:  43.433
        //     property real longitude: 40.333

        //     anchorPoint.x: initPosMarkerImage.width/2
        //     anchorPoint.y: initPosMarkerImage.height/2
        //     coordinate{
        //         latitude:  latitude
        //         longitude: longitude
        //     }
        //     sourceItem: Image {
        //         id: initPosMarkerImage
        //         width: 32
        //         height: 32
        //         source: "pin.png"
        //     }
        //     MouseArea {
        //         anchors.fill: parent
        //     }
        // }

        // Column {
        //     anchors.right: parent.right
        //     anchors.bottom: parent.bottom
        //     property int buttonSize: 64
        //     spacing: 5

        //     ToolButton {
        //         id: onPlane
        //         onClicked: {
        //             map1.center.latitude = planeMarker.latitude; map1.center.longitude = planeMarker.longitude;
        //             onPlaneTimer.start();
        //         }
        //         icon.source: "onplane.png"; width: parent.buttonSize; height: parent.buttonSize
        //         background: Rectangle { radius: 5; border.width: 1; border.color: "#FF000000" }
        //     }

        //     ToolButton {
        //         onClicked: { map1.center.latitude = planeMarker.latitude; map1.center.longitude = planeMarker.longitude; }
        //         icon.source: "plane.png"; width: parent.buttonSize; height: parent.buttonSize
        //         background: Rectangle { radius: 5; border.width: 1; border.color: "#FF000000" }
        //     }

        //     ToolButton {
        //         onClicked: { map1.center.latitude = initPosMarker.latitude; map1.center.longitude = initPosMarker.longitude; }
        //         icon.source: "pin.png"; width: parent.buttonSize; height: parent.buttonSize
        //         background: Rectangle { radius: 5; border.width: 1; border.color: "#FF000000" }
        //     }
        // }

        function onZoomLevelChanged() {
            const map_center_x = map1.width / 2;
            const circle_border_x = map_center_x - map_circle.circle_radius;
            const latlon1 = map1.toCoordinate(Qt.point(map_center_x, map1.height/2));
            const latlon2 = map1.toCoordinate(Qt.point(circle_border_x, map1.height/2));
            const dist = latlon2.distanceTo(latlon1); 
            circle_raidus_text1.text = (dist / 1000 * 0.6214).toFixed(0); // km to miles
        }

        DragHandler {
            id: drag
            target: null
            onTranslationChanged: (delta) => map1.pan(-delta.x, -delta.y)
        }

        WheelHandler {
            id: wheel
            // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
            // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
            // and we don't yet distinguish mice and trackpads on Wayland either
            acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                             ? PointerDevice.Mouse | PointerDevice.TouchPad
                             : PointerDevice.Mouse
            rotationScale: 1/120
            property: "zoomLevel"
        }
    }

    function timerFunc() {
        // self.centerLatitude = planeMarker.latitude;
        // self.centerLongitude = planeMarker.longitude;

        map1.onZoomLevelChanged();
    }

    Timer {
        id: onPlaneTimer
        interval: 500;
        running: true;
        repeat: true
        triggeredOnStart: true
        onTriggered: parent.timerFunc()
    }


    Rectangle {
        id: topBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        height: 50

        color: "transparent"

        RowLayout {
            anchors.fill: parent
            anchors.margins: 0
            spacing: 0


            Rectangle {

                Text{

                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                    }
                }
            }

            Button {
                text: "INAV\nData"

                Layout.preferredWidth: topBar.width * 0.12
                Layout.minimumWidth: 50
                Layout.fillWidth: true
                Layout.fillHeight: true
                
                background: Rectangle {
                    anchors.fill: parent    

                    color: "#5a5a5a"
                    border.color: "#2b2b2b"
                    border.width: 1        
                }

                contentItem: Text {
                    anchors.fill: parent    

                    text: parent.text
                    color: "white"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    lineHeight: 0.9
                }
            }

            Button {
                text: "WX"
                Layout.preferredWidth: topBar.width * 0.12
                Layout.minimumWidth: 47
                Layout.fillWidth: true
                Layout.fillHeight: true
                checkable: true

                background: Rectangle {
                    color: "#5a5a5a"
                    border.color: "#2b2b2b"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }

            Button {
                text: "Vert\nProf"
                Layout.preferredWidth: topBar.width * 0.12
                Layout.minimumWidth: 50
                Layout.fillHeight: true
                Layout.fillWidth: true
                checkable: true

                background: Rectangle {
                    color: "#5a5a5a"
                    border.color: "#2b2b2b"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    lineHeight: 0.9
                }
            }

            Button {
                text: "Hdg\nUp"
                Layout.preferredWidth: topBar.width * 0.15
                Layout.minimumWidth: 61
                Layout.fillHeight: true
                Layout.fillWidth: true
                checkable: true
                

                background: Rectangle {
                    color: parent.checked ? "#111111" : "#5a5a5a"
                    border.color: "#2b2b2b"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    lineHeight: 0.9
                }
            }

            Button {
                text: "Center\nAircraft"
                Layout.preferredWidth: topBar.width * 0.15
                Layout.minimumWidth: 59
                Layout.fillWidth: true
                Layout.fillHeight: true
                

                background: Rectangle {
                    color: "#5a5a5a"
                    border.color: "#2b2b2b"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    lineHeight: 0.9
                }
            }

            Button {
                text: "Center\nTO Wpt"
                Layout.preferredWidth: topBar.width * 0.12
                Layout.minimumWidth: 50
                Layout.fillWidth: true
                Layout.fillHeight: true

                background: Rectangle {
                    color: "#5a5a5a"
                    border.color: "#2b2b2b"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    lineHeight: 0.9
                }
            }

            Button {
                text: "Skip\nWpt"
                Layout.preferredWidth: topBar.width * 0.09
                Layout.minimumWidth: 36
                Layout.fillWidth: true
                Layout.fillHeight: true

                background: Rectangle {
                    color: "#5a5a5a"
                    border.color: "#2b2b2b"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    lineHeight: 0.9
                }
            }

            Button {
                text: "Recall\nWpt"
                Layout.preferredWidth: topBar.width * 0.13
                Layout.minimumWidth: 51
                Layout.fillWidth: true
                Layout.fillHeight: true

                background: Rectangle {
                    color: "#5a5a5a"
                    border.color: "#2b2b2b"
                    border.width: 2
                }

                contentItem: Text {
                    text: parent.text
                    color: "white"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    lineHeight: 0.9
                }
            }

            // AviaMenu {
            //     id: pages_menu

            //     AviaMenuItem {
            //         text: "ENG-TRM-FUEL"
            //     }

            //     AviaMenuItem {
            //         text: "RADIOS"
            //     }
            // }
       }
    }
}



