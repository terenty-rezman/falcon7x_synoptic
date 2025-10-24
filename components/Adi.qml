import QtQuick 2.15
import QtQuick.Controls
import QtQuick
import QtQuick.Layouts

import "basic_components"

Rectangle {
    anchors.fill: parent
    color: "#c47a2c"

    property string side: "left" || "right" // set it from where component is instantiated

    Item {
        id: adi_shared_data
        objectName: "adi_shared_data"

        property int ads_default: (side == "left") ? 1 : 2 // default ads for pilot is 1; for copilot is 2
        property int irs_default: (side == "left") ? 1 : 2 // default irs for pilot is 1; for copilot is 2
        property int ra_default: (side == "left") ? 1 : 2 // default ra for pilot is 1; for copilot is 2
        property int fms_default: (side == "left") ? 1 : 2 // default fms for pilot is 1; for copilot is 2

        property int ads_self: 0
        property int ads_partner: 0
        property int ads_failed: 0

        property int fms_self: 0
        property int fms_partner: 0

        property int ra_self: 0
        property int ra_partner: 0

        property int vor_self: 0
        property int vor_partner: 0

        property int no_slip_comp: 0 // ads id with no slip comp

        property bool current_ads_fail: ads_self == ads_failed
    }


    Horizon {
        objectName: "adi_horizon"
    }

    AdiAtSpd {
        objectName: "adi_at_spd"
        x: 29
        y: 1
    }

    AdiLnavHdgRoll {
        objectName: "adi_lnav_hdg_roll_symbol"
        x: 188
        y: 16
    }

    AdiAp {
        objectName: "adi_ap_symbol"
        x: 254
        y: 16
    }

    AdiAltSymbol {
        objectName: "adi_alt_symbol"
        x: 407
        y: 16
    }

    AdiBankTop {
        objectName: "adi_bank"
        no_slip_comp: adi_shared_data.no_slip_comp == adi_shared_data.ads_self
    }

    AdiAsel {
        objectName: "adi_asel"
        x: 547
        y: 14
    }

    AdiAlt {
        objectName: "adi_alt"
        x: 547
        y: 74

        fail: adi_shared_data.current_ads_fail
    }

    AdiSpeed {
        objectName: "adi_airspeed"
        x: 32
        y: 74

        fail: adi_shared_data.current_ads_fail
    }
    
    AdiHeading {
        objectName: "adi_heading"
        x: 324
        y: 621
    }

    AdiVerticalSpeed {
        objectName: "adi_vertical_speed"
        x: 637
        y: 100
    }

    AdiGear {
        objectName: "adi_gear"
        x: 542
        y: 417
    }

    AdiPitch {
        objectName: "adi_pitch"
        x: 631
        y: 413
    }

    AdiFlapsSlats {
        x: 26
        y: 411
    }

    AdiAds {
        objectName: "adi_ads_symbol"
        x: 614
        y: 74

        ads_default: adi_shared_data.ads_default
        ads_self: adi_shared_data.ads_self
        ads_partner: adi_shared_data.ads_partner
    }

    AdiRaSymbol {
        objectName: "adi_ra_symbol"
        x: 614
        y: 142

        ra_current: adi_shared_data.ra_self
        ra_partner: adi_shared_data.ra_partner
        ra_default: adi_shared_data.ra_default
    }

    AdiVorSymbol {
        objectName: "adi_vor_symbol"
        x: 441
        y: 416

        vor_current: adi_shared_data.vor_self
        vor_partner: adi_shared_data.vor_partner
    }

    AdiTdSymbol {
        objectName: "adi_td_symbol"
        x: 154
        y: 135

        visible: adi_shared_data.current_ads_fail
    }

    AdiFdSymbol {
        objectName: "adi_fd_symbol"
        x: 154  // уточнить расположение
        y: 290

        visible: adi_shared_data.current_ads_fail
    }

    AdiAccSymbol {
        objectName: "adi_acc_symbol"
        x: 45  // уточнить расположение
        y: 364

        visible: adi_shared_data.current_ads_fail
    }

    AdiIrs {
        objectName: "adi_irs_symbol"

        irs_default: adi_shared_data.irs_default

        x: 614
        y: 318
    }

    AdiReverseSymbol {
        objectName: "adi_reverse_symbol"
        x: 115
        y: 165
    }

    AdiFmsSymbol {
        objectName: "adi_fms_symbol"
        x: 100
        y: 572

        fms_default: adi_shared_data.fms_default
        fms_current: adi_shared_data.fms_self
        fms_partner: adi_shared_data.fms_partner
    }

    AdiVhfNav {
        objectName: "adi_vhf_nav"
        //x: 551
        anchors.right: parent.right
        anchors.rightMargin: 2
        y: 488
    }

    Item {
        x: 6
        y: 496

        AdiWhiteText {
            text: "UTC"
        }

        AdiGreenText {
            objectName: "adi_current_time"
            property int hours: 0
            property int minutes: 0
            text: lead_zero(hours) + ":" + lead_zero(minutes)
            x: 45

            function lead_zero(number) {
                if (number < 10) {
                    return "0" + number;
                }
                else {
                    return number;
                }
            }
        }

        AdiWhiteText {
            text: "ET"
            y: 22
        }

        AdiWhiteText {
            text: "00:00"
            x: 45
            y: 22
        }
       
        AdiWhiteText {
            text: "TAS"
            y: 44
        }

        AdiGreenText {
            objectName: "adi_tas_text"

            property int tas: 0

            Rectangle {
                anchors.fill: parent
                color: "#ff000055"
                visible: false
            }

            text: (tas * 1.94380).toFixed(0)
            x: 92 - width
            y: 44
            horizontalAlignment: Text.AlignRight
        }

        AdiWhiteText {
            text: "GS"
            y: 66
        }

        AdiGreenText {
            objectName: "adi_gs_text"

            property int gs: 0

            Rectangle {
                anchors.fill: parent
                color: "#ff000055"
                visible: false
            }

            text: (gs * 1.94380).toFixed(0)
            x: 92 - width
            y: 66
            horizontalAlignment: Text.AlignRight
        }
        
        AdiWhiteText {
            text: "TAT"
            y: 88
        }

        AdiGreenText {
            objectName: "adi_tat_text"

            property int tat: 0

            Rectangle {
                anchors.fill: parent
                color: "#ff000055"
                visible: false
            }

            text: "22" // исправить на tat
            x: 92 - width
            y: 88
            horizontalAlignment: Text.AlignRight
        }

        AdiWhiteText {
            text: "SAT"
            y: 110
        }

        AdiGreenText {
            objectName: "adi_sat_text"

            property int sat: 0

            Rectangle {
                anchors.fill: parent
                color: "#ff000055"
                visible: false
            }

            text: sat
            x: 92 - width
            y: 110
            horizontalAlignment: Text.AlignRight
        }

        AdiWhiteText {
            text: "ISA"
            y: 132
        }

        AdiGreenText {
            objectName: "adi_isa_text"

            property int isa: 8

            Rectangle {
                anchors.fill: parent
                color: "#ff000055"
                visible: false
            }

            text: (isa > 0) ? "+" + isa : isa
            x: 92 - width
            y: 132
            horizontalAlignment: Text.AlignRight
        
        }

        AdiWhiteText {
            text: "FQ"
            y: 154
        }

        AdiGreenText {
            objectName: "adi_fq_text"

            property int fq: 0

            Rectangle {
                anchors.fill: parent
                color: "#ff000055"
                visible: false
            }

            text: fq
            x: 92 - width
            y: 154
            horizontalAlignment: Text.AlignRight
        }

         AdiWhiteText {
            text: "FR"
            y: 176 
        }

        AdiGreenText {
            objectName: "adi_fr_text"

            property int fr: 0

            Rectangle {
                anchors.fill: parent
                color: "#ff000055"
                visible: false
            }

            text: fr
            x: 92 - width
            y: 176
            horizontalAlignment: Text.AlignRight
        }

        AdiWhiteText {
            text: "GW"
            y: 198
        }

        AdiGreenText {
            objectName: "adi_gw_text"

            property int gw: 0

            Rectangle {
                anchors.fill: parent
                color: "#ff000055"
                visible: false
            }

            text: gw
            x: 92 - width
            y: 198
            horizontalAlignment: Text.AlignRight
        }
    }

    Text {
        text: side
    }
}
