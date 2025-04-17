import QtQuick 2.15
import "../js/helpers.mjs" as Helpers

Text {
    id: self

    property real value: 62
    property int precision: 1
    property var map_args: []
    property var map_vals: []
    
    text: map_val(self.value).toFixed(self.precision) 

    color: "#00FC00"
    font.pixelSize: 18
    font.bold: true

    function map_val(val) {
        if (map_args.length == 0) {
            return val
        }

        const map_ = new Helpers.Interp1d(self.map_args, self.map_vals); 
        return map_.interp(val);
    }
}
