

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import Falcon7x_synoptic_design
import QtQuick.Studio.Components
import QtQuick.VectorImage

Rectangle {
    id: rectangle
    width: 684
    height: 342
    visible: true

    color: Constants.backgroundColor

    Image {
        id: eLEC_F7X_CODDE1_R13_DGT97831Image2252_ok
        visible: false
        source: "images/ELEC_F7X_CODDE1_R13_DGT97831 Image[2252]_ok.jpg"
        enabled: true
        fillMode: Image.PreserveAspectFit

        Button {
            id: c_b_button
            x: 484
            y: 275
            width: 119
            height: 29
            text: qsTr("C/B STATUS")
        }

        Elec_cb_out {
            id: elec_cb_out
            x: 508
            y: 314
        }
    }

    Elec_Apu {
        id: elec_apu
        x: 116
        y: 83
    }

    Elec_bat_temp_scane {
        id: elec_bat_temp_scane1
        x: 201
        y: 271
        width: 73
        height: 18
    }

    Elec_current {
        id: elec_current_apu
        x: 116
        y: 221
    }

    Elec_current {
        id: elec_current_but_1
        x: 209
        y: 221
    }

    Elec_current {
        id: elec_current_but_2
        x: 306
        y: 221
    }

    Elec_current {
        id: elec_current_gen_2
        x: 493
        y: 221
    }

    Elec_current {
        id: elec_current_gen_3
        x: 581
        y: 221
    }

    Elec_current {
        id: elec_current_gen_1
        x: 34
        y: 221
    }

    Elec_temperature {
        id: elec_temelec_temperature_bat2
        x: 309
        y: 302
    }

    Elec_temperature {
        id: elec_temperature_bat1
        x: 212
        y: 302
    }

    Elec_left_voltage {
        id: elec_right_voltage
        x: 357
        y: 17
    }

    Elec_left_voltage {
        id: elec_left_voltage
        x: 164
        y: 17
    }

    Elec_contactor {
        id: elec_contactor_rh
        objectName: "elec_contactor_rh"
        x: 458
        y: 63
    }

    Elec_contactor {
        id: elec_contactor_lh
        objectName: "elec_contactor_lh"
        x: 89
        y: 63
    }

    Elec_bas_tie_contactor {
        id: elec_bus_tie_contactor
        objectName: "elec_bus_tie_contactor"
        x: 267
        y: 63
    }

    Elec_bat {
        id: elec_bat_2
        objectName: "elec_bat_2"
        x: 299
        y: 83
    }

    Elec_bat {
        id: elec_bat_1
        objectName: "elec_bat_1"
        x: 201
        y: 83
        text: "BAT 1"
    }

    Ext_power {
        id: ext_power
        x: 609
        y: 14
    }

    Elec_Gen {
        id: elec_gen3
        x: 582
        y: 83
        objectName: "elec_gen3"
        text: "ENG3\nGEN"
    }

    Elec_Gen {
        id: elec_gen2
        x: 494
        y: 83
        text: "ENG2\nGEN"
    }

    Elec_Gen {
        id: elec_gen1
        x: 34
        y: 84
        text: "ENG1\nGEN"
    }

    Elec_line_apu_bat1 {
        id: elec_line_apu_bat1
        x: 0
        y: 0
        width: 29
        height: 0
    }

    ELec_line_gen2 {
        id: eLec_line_gen2
        x: 0
        y: 0
    }

    Elec_line_gen1_gen3 {
        id: elec_line_gen1_gen3
        x: 0
        y: 0
    }

    Elec_line_bat2_ratgen {
        id: elec_line_bat2_ratgen
        x: 0
        y: 0
    }

    Elec_rat_gen {
        id: elec_rat_gen
        x: 403
        y: 83
    }

    states: [
        State {
            name: "clicked"
        },
        State {
            name: "State1"

            PropertyChanges {
                target: rectangle7
                color: "#1cff00"
            }

            PropertyChanges {
                target: ext_power
                x: 17
                y: 16
            }
        }
    ]
    Elec_bat_temp_scane {
        id: elec_bat_temp_scane
        x: 298
        y: 271
        width: 74
        height: 17
    }
}
