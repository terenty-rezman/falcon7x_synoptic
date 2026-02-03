import QtQuick 2.15

Item {
    Rectangle {
    width: 200; height: 200

    ListModel {
        id: fruitModel
        ...
    }

    Component {
        id: fruitDelegate
        Row {
            spacing: 10
            Text { text: name }
            Text { text: '$' + cost }
        }
    }

    ListView {
        anchors.fill: parent
        model: fruitModel
        delegate: fruitDelegate
    }
}

    id: self

    Component {
        id: fruitDelegate
        Item {
            width: 200; height: 50
            Text { text: name }
            Text { text: '$' + cost; anchors.right: parent.right }

            // Double the price when clicked.
            MouseArea {
                anchors.fill: parent
                onClicked: fruitModel.setProperty(index, "cost", cost * 2)
            }
        }
    }
}
