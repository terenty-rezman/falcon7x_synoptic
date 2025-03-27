import QtQuick

Item {
    id: self

    property int state: 0

    property string green: "#00ff00"
    property string yellow: "#d2b60c"
    property string grey: "#555555"

    Rectangle {
        id: rectangle1
        x: 11
        y: 80
        width: 4
        height: 129
        color: "#00ff00"
        border.color: "#00000000"
        layer.format: ShaderEffectSource.RGB
    }

    Rectangle {
        id: rectangle2
        x: 11
        y: 207
        width: 647
        height: 4
        color: self.green
        border.color: "#00000000"
        layer.format: ShaderEffectSource.RGB
    }

    Rectangle {
        id: rectangle3
        x: 654
        y: 77
        width: 4
        height: 132
        color: self.green
        border.color: "#00000000"
        layer.format: ShaderEffectSource.RGB
    }

    Rectangle {
        id: rectangle4
        x: 608
        y: 77
        width: 50
        height: 4
        color: self.green
        border.color: "#00000000"
        layer.format: ShaderEffectSource.RGB
    }

    Rectangle {
        id: rectangle5
        x: 605
        y: 77
        width: 4
        height: 6
        color: self.green
        border.color: "#00000000"
        layer.format: ShaderEffectSource.RGB
    }

    Rectangle {
        id: rectangle6
        x: 11
        y: 76
        width: 78
        height: 4
        color: self.green
        border.color: "#00000000"
        layer.format: ShaderEffectSource.RGB
    }

    Rectangle {
        id: rectangle7
        x: 57
        y: 80
        width: 4
        height: 4
        color: self.green
        border.color: "#00000000"
        layer.format: ShaderEffectSource.RGB
    }

    states: [
        State {
            name: "on"
            when: self.state === 1

            PropertyChanges {
                target: rectangle1
                color: self.green
            }

            PropertyChanges {
                target: rectangle2
                color: self.green
            }

            PropertyChanges {
                target: rectangle3
                color: self.green
            }

            PropertyChanges {
                target: rectangle4
                color: self.green
            }

            PropertyChanges {
                target: rectangle5
                color: self.green
            }

            PropertyChanges {
                target: rectangle6
                color: self.green
            }

            PropertyChanges {
                target: rectangle7
                color: self.green
            }
        },

        State {
            name: "off"
            when: self.state === 0

            PropertyChanges {
                target: rectangle1
                color: self.grey
            }

            PropertyChanges {
                target: rectangle2
                color: self.grey
            }

            PropertyChanges {
                target: rectangle3
                color: self.grey
            }

            PropertyChanges {
                target: rectangle4
                color: self.grey
            }

            PropertyChanges {
                target: rectangle5
                color: self.grey
            }

            PropertyChanges {
                target: rectangle6
                color: self.grey
            }

            PropertyChanges {
                target: rectangle7
                color: self.grey
            }
        }
    ]
}
