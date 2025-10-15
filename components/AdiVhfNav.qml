import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts


Column {
    spacing: 0
    
    // строка 1
    Rectangle { 
        //id: adi_vhf1
        color: "transparent"
        width: 134
        height: 33
        radius: 2
        border.color: "#ffffffff";
        border.width: 1


        Text {
            //id: text_
            text: "VHF1"
            anchors.centerIn: parent
            color: "#ffffff"
            font.pixelSize: 18
            font.bold: true
            font.family: "Helvetica"
        }
    }

    // строка 2
    Rectangle {  
        color: "transparent"
        width: 134
        height: 82
        radius: 0
        border.color: "#ffffffff";
        border.width: 1

        // внутренняя таблица 1
        Column {
            spacing: 0
            x: 3
            y: 58
            width: parent.width - 3
            height: parent.height / 2
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 2
            anchors.bottomMargin: 5

            // линия 1 внутренней таблицы 1
            Rectangle { 
                color: "transparent"
                width: parent.width
                height: parent.height / 2
               border.color: "#ffffffff";
               border.width: 1

                Text {
                    //id: text_
                    text: "125.875" // изменить 
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    color: "#66FF66"
                    font.pixelSize: 18
                    font.bold: true
                    font.family: "Helvetica"
                }
            }

            // линия 2 внутренней таблицы 1
            Rectangle { 
                color: "transparent"
                width: parent.width
                height: parent.height / 2
                border.color: "#ffffffff";
                border.width: 1

                Text {
                    //id: text_
                    text: "125.875" // изменить 
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    color: "#00FFFF"
                    font.pixelSize: 16
                    font.bold: true
                    font.family: "Helvetica"
                }
            }
        }


    }
        // строка 3
        Rectangle {
        //id: adi_vhf1
        color: "transparent"
        width: 134
        height: 33
        radius: 0
        border.color: "#ffffffff";
        border.width: 1


        Text {
            //id: text_
            text: "NAV1"
            anchors.centerIn: parent
            color: "#ffffff"
            font.pixelSize: 18
            font.bold: true
            font.family: "Helvetica"
        }
    }
    // строка 4
    Rectangle {  
        color: "transparent"
        width: 134
        height: 82
        radius: 0
        border.color: "#ffffffff";
        border.width: 1

        // внутренняя таблица 2
        Column {
            spacing: 0
            x: 3
            y: 24
            width: parent.width - 3
            height: parent.height / 2
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.leftMargin: 2
            anchors.bottomMargin: 5

            // линия 1 внутренней таблицы 2
            Rectangle { 
                color: "transparent"
                width: parent.width
                height: parent.height / 2
               border.color: "#ffffffff";
               border.width: 1

                Text {
                    //id: text_
                    text: "111.10" // изменить 
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    color: "#66FF66"
                    font.pixelSize: 18
                    font.bold: true
                    font.family: "Helvetica"
                }
            }

            // линия 2 внутренней таблицы 2
            Rectangle { 
                color: "transparent"
                width: parent.width
                height: parent.height / 2
                border.color: "#ffffffff";
                border.width: 1

                Text {
                    //id: text_
                    text: "111.10" // изменить 
                    anchors.right: parent.right
                    anchors.rightMargin: 4
                    color: "#00FFFF"
                    font.pixelSize: 16
                    font.bold: true
                    font.family: "Helvetica"
                }
            }
        }

    }

}



