import QtQuick
import QtQuick.Studio.Components

ArcItem {
    id: self

    property int state: 0

    strokeWidth: 1
    strokeColor: "#555555"
    fillColor: "#555555"

    width: 20
    height: 20

    outlineArc: true
    round: true
    arcWidth: 4

    states: [
        State {
            when: self.state == 0

            PropertyChanges {
                target: self
                strokeColor: "#555555"
                fillColor: "#555555"
            }
        },

        State {
            when: self.state == 1

            PropertyChanges {
                target: self
                strokeColor: "#00ff00"
                fillColor: "#00ff00"
            }
        },

        State {
            when: self.state == 2

            PropertyChanges {
                target: self
                strokeColor: "#d2b60c"
                fillColor: "#d2b60c"
            }
        }
    ]
}
