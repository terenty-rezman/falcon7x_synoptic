from collections import defaultdict

from PySide6.QtCore import QObject, Slot, Property, SLOT, SIGNAL, QByteArray, QTimer, QMetaObject, Signal
import PySide6.QtCore as QtCore

import view_helper
import param_overrides

from falcon7x_core.xplane.params import Params


dref_indicators = [
    # (dataref, idx, "object_name", "property_name", "root_object_name")
    ("sim/cockpit2/engine/indicators/N1_percent[0]", None, "eng_engn1", "n1", None),
    ("sim/cockpit2/engine/actuators/throttle_ratio[0]", None, "eng_engn1", "rotation_purpure_circle", None),
    ("sim/custom/7x/z_syn_eng_start1", None, "eng_engn1", "start", None),
    ("sim/custom/xap/maxin1", None, "eng_engn1", "top_digit", None),
    ("sim/custom/7x/z_syn_eng_ab1", None, "eng_engn1", "ab", None),
    ("sim/cockpit2/engine/indicators/N1_percent[1]", None,"eng_engn2", "n1", None),
    ("sim/cockpit2/engine/actuators/throttle_ratio[1]", None, "eng_engn2", "rotation_purpure_circle", None),
    ("sim/custom/7x/z_syn_eng_start2", None, "eng_engn2", "start", None),
    ("sim/custom/xap/maxin1", None, "eng_engn2", "top_digit", None),
    ("sim/custom/7x/z_syn_eng_ab2", None, "eng_engn2", "ab", None),
    ("sim/cockpit2/engine/indicators/N1_percent[2]", None, "eng_engn3", "n1", None),
    ("sim/cockpit2/engine/actuators/throttle_ratio[2]", None, "eng_engn3", "rotation_purpure_circle", None),
    ("sim/custom/7x/z_syn_eng_start3", None, "eng_engn3", "start", None),
    ("sim/custom/xap/maxin1", None, "eng_engn3", "top_digit", None),
    ("sim/custom/7x/z_syn_eng_ab3", None, "eng_engn3", "ab", None),
    ("sim/cockpit2/electrical/APU_N1_percent", None, "eng_apun1t5", "n1", None),
    ("sim/cockpit2/electrical/APU_EGT_c", None, "eng_apun1t5", "t5", None),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[0]", None, "eng_itt1", "rotation_green_arrow_deg", None),
    ("sim/custom/7x/z_syn_eng_ign1", None, "eng_itt1", "ign", None),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[1]", None, "eng_itt2", "rotation_green_arrow_deg", None),
    ("sim/custom/7x/z_syn_eng_ign2", None, "eng_itt2", "ign", None),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[2]", None, "eng_itt3", "rotation_green_arrow_deg", None),
    ("sim/custom/7x/z_syn_eng_ign3", None, "eng_itt3", "ign", None),
    ("sim/cockpit2/engine/indicators/N2_percent[0]", None, "eng_n2_1", "value", None),
    ("sim/cockpit2/engine/indicators/N2_percent[1]", None, "eng_n2_2", "value", None),
    ("sim/cockpit2/engine/indicators/N2_percent[2]", None, "eng_n2_3", "value", None),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[0]", None, "eng_ff_1", "value", None),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[1]", None, "eng_ff_2", "value", None),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[2]", None, "eng_ff_3", "value", None),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[0]", None, "eng_oil1", "psi", None),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[1]", None, "eng_oil2", "psi", None),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[2]", None, "eng_oil3", "psi", None),
    ("sim/custom/7x/z_oil_min_height_1", None, "eng_oil1", "oil_min_temp", None),
    ("sim/custom/7x/z_oil_min_height_2", None, "eng_oil2", "oil_min_temp", None),
    ("sim/custom/7x/z_oil_min_height_3", None, "eng_oil3", "oil_min_temp", None),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[0]", None, "eng_oil1", "temp", None),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[1]", None, "eng_oil2", "temp", None),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[2]", None, "eng_oil3", "temp", None),
    ("sim/cockpit2/engine/indicators/N1_percent[0]", None, "eng_vib1", "vib", None),
    ("sim/cockpit2/engine/indicators/N1_percent[1]", None, "eng_vib2", "vib", None),
    ("sim/cockpit2/engine/indicators/N1_percent[2]", None, "eng_vib3", "vib", None),
    ("sim/custom/7x/lhisol", None, "elec_contactor_lh", "state", None),
    ("sim/custom/7x/rhisol", None, "elec_contactor_rh", "state", None),
    ("sim/cockpit2/electrical/cross_tie", None, "elec_bus_tie_contactor", "state", None),
    # ("sim/cockpit2/electrical/battery_on", 0, "elec_bat_1", "state", None),
    ("sim/cockpit2/electrical/battery_on[0]", None, "elec_bat_1", "state", None),
    ("sim/cockpit2/electrical/battery_on", 1, "elec_bat_2", "state", None),
    ("sim/cockpit2/electrical/generator_on", 0, "elec_gen_1", "on", None),
    ("sim/cockpit2/engine/indicators/N2_percent[0]", None, "elec_gen_1", "n2", None),
    ("sim/cockpit2/electrical/generator_on", 1, "elec_gen_2", "on", None),
    ("sim/cockpit2/engine/indicators/N2_percent[1]", None, "elec_gen_2", "n2", None),
    ("sim/cockpit2/electrical/generator_on", 2, "elec_gen_3", "on", None),
    ("sim/cockpit2/engine/indicators/N2_percent[2]", None, "elec_gen_3", "n2", None),
    ("sim/cockpit2/electrical/APU_generator_on", None, "elec_apu", "master_on", None),
    ("sim/cockpit2/electrical/APU_N1_percent", None, "elec_apu", "n1", None),

    ("sim/custom/7x/z_line_gen2_on", None, "elec_line_gen2", "state", None),
    ("sim/custom/7x/z_line_bat2_ratgen_on", None, "elec_line_bat2_ratgen", "state", None),
    ("sim/custom/7x/z_line_apu_bat1_on", None, "elec_line_apu_bat1", "state", None),
    ("sim/custom/7x/z_line_gen1_gen3_on", None, "elec_line_gen1_gen3", "state", None),

    ("sim/cockpit2/electrical/bus_volts[0]", None, "elec_left_voltage", "v", None),
    ("sim/cockpit2/electrical/bus_volts[1]", None, "elec_right_voltage", "v", None),
    ("sim/cockpit2/electrical/generator_amps[0]", None, "elec_current_gen_1", "amps", None),
    ("sim/cockpit2/electrical/generator_amps[1]", None, "elec_current_gen_2", "amps", None),
    ("sim/cockpit2/electrical/generator_amps[2]", None, "elec_current_gen_3", "amps", None),
    ("sim/cockpit2/electrical/battery_amps[0]", None, "elec_current_bat_1", "amps", None),
    ("sim/cockpit2/electrical/battery_amps[1]", None, "elec_current_bat_2", "amps", None),
    ("sim/custom/7X/TBAT", None, "elec_temperature_bat1", "temp", None),
    ("sim/custom/7X/TBAT", None, "elec_temperature_bat2", "temp", None),
    ("sim/cockpit/electrical/gpu_on", None, "ext_power", "state", None),
    ("sim/custom/7X/TBAT", None, "elec_bat_temp_scane_1", "temp", None),
    ("sim/custom/7X/TBAT", None, "elec_bat_temp_scane_2", "temp", None),

    ("sim/custom/7x/z_apu_startup_stage", None, "elec_apu", "startup_stage", None),
    ("sim/cockpit2/electrical/APU_generator_amps", None, "elec_current_apu", "amps", None),
    ("sim/cockpit2/electrical/APU_N1_percent", None, "elec_current_apu", "apu_n1", None),
    ("sim/custom/7x/z_thrust_purple_max_deg_1", None, "eng_engn1", "max_thrust_deg", None),
    ("sim/custom/7x/z_thrust_purple_max_deg_2", None, "eng_engn2", "max_thrust_deg", None),
    ("sim/custom/7x/z_thrust_purple_max_deg_3", None, "eng_engn3", "max_thrust_deg", None),

    ("sim/cockpit2/gauges/indicators/pitch_electric_deg_pilot", None, "adi_horizon", "pitch_deg", None),
    ("sim/cockpit2/gauges/indicators/roll_electric_deg_pilot", None, "adi_horizon", "bank_deg", None),
    ("sim/cockpit2/gauges/indicators/roll_electric_deg_pilot", None, "adi_bank", "bank_deg", None),
    ("sim/cockpit2/gauges/indicators/altitude_ft_pilot", None, "adi_alt", "altitude_ft", "adi_left"),
    ("sim/cockpit2/gauges/indicators/altitude_ft_copilot", None, "adi_alt", "altitude_ft", "adi_right"),
    ("sim/cockpit2/gauges/indicators/heading_AHARS_deg_mag_pilot", None, "adi_heading", "heading_deg", "adi_left"),
    ("sim/cockpit2/gauges/indicators/heading_AHARS_deg_mag_copilot", None, "adi_heading", "heading_deg", "adi_right"),
    ("sim/cockpit2/gauges/indicators/airspeed_kts_pilot", None, "adi_airspeed", "speed", "adi_left"),
    ("sim/cockpit2/gauges/indicators/airspeed_kts_copilot", None, "adi_airspeed", "speed", "adi_right"),
    ("sim/cockpit2/gauges/indicators/mach_pilot", None, "adi_airspeed", "mach", None),
    ("sim/cockpit2/gauges/indicators/vvi_fpm_pilot", None, "adi_vertical_speed", "vy_ft_per_min", None),
    ("sim/cockpit2/gauges/actuators/barometer_setting_in_hg_pilot", None, "adi_alt", "baro_settings", None),
    ("sim/cockpit2/clock_timer/local_time_hours", None, "adi_current_time", "hours", None),
    ("sim/cockpit2/clock_timer/local_time_minutes", None, "adi_current_time", "minutes", None),
    ("sim/cockpit2/switches/ram_air_turbine_on", None, "elec_rat_gen", "state", None),
    ("sim/cockpit2/annunciators/gear_unsafe", None, "adi_gear", "gear_transition_state", None),
    ("sim/cockpit2/controls/gear_handle_down", None, "adi_gear", "gear_handle_state", None),
    ("sim/flightmodel/position/true_airspeed", None, "adi_tas_text", "tas", None),
    ("sim/flightmodel2/position/groundspeed", None, "adi_gs_text", "gs", None),
    ("sim/flightmodel/controls/elv_trim", None, "adi_pitch", "elv_trim", None),
    ("sim/cockpit/autopilot/autopilot_mode", None, "adi_ap_symbol", "ap_mode", None),
    ("sim/cockpit/autopilot/autopilot_mode", None, "adi_lnav_hdg_roll_symbol", "ap_mode", None),
    ("sim/cockpit2/autopilot/heading_mode", None, "adi_lnav_hdg_roll_symbol", "heading_mode", None),
    ("sim/cockpit/autopilot/heading_mag", None, "adi_lnav_hdg_roll_symbol", "target_heading", None),
    ("sim/cockpit/radios/ap_src", None, "adi_ap_symbol", "pilot_side", None),
    ("sim/cockpit2/autopilot/airspeed_dial_kts", None, "adi_airspeed", "target_speed", None),
    ("sim/cockpit/autopilot/autopilot_mode", None, "adi_at_spd", "ap_mode", None),
    ("sim/cockpit2/autopilot/autothrottle_enabled", None, "adi_at_spd", "at_enabled", None),
    ("sim/custom/7x/z_ads_pilot", None, "adi_shared_data", "ads_self", "adi_left"),
    ("sim/custom/7x/z_ads_copilot", None, "adi_shared_data", "ads_partner", "adi_left"),
    ("sim/custom/7x/z_ads_copilot", None, "adi_shared_data", "ads_self", "adi_right"),
    ("sim/custom/7x/z_ads_pilot", None, "adi_shared_data", "ads_partner", "adi_right"),
    ("sim/cockpit2/autopilot/altitude_dial_ft", None, "adi_alt", "target_alt_ft", None),
    ("sim/custom/7x/z_irs_pilot", None, "adi_irs_symbol", "irs_current", "adi_left"),
    ("sim/custom/7x/z_irs_copilot", None, "adi_irs_symbol", "irs_partner", "adi_left"),
    ("sim/custom/7x/z_irs_copilot", None, "adi_irs_symbol", "irs_current", "adi_right"),
    ("sim/custom/7x/z_irs_pilot", None, "adi_irs_symbol", "irs_partner", "adi_right"),
    ("sim/cockpit/autopilot/autopilot_mode", None, "adi_alt_symbol", "ap_mode", None),
    ("sim/cockpit2/autopilot/altitude_dial_ft", None, "adi_alt_symbol", "target_alt_ft", None),
    ("sim/cockpit2/autopilot/altitude_hold_armed", None, "adi_alt_symbol", "altitude_mode", None),
    ("sim/cockpit2/autopilot/vvi_status", None, "adi_alt_symbol", "vs_mode", None),
    ("sim/cockpit2/annunciators/reverser_deployed", None, "adi_reverse_symbol", "mode", None),
    ("sim/cockpit2/autopilot/altitude_dial_ft", None, "adi_asel", "target_alt_ft", None),
    ("sim/cockpit2/autopilot/altitude_hold_armed", None, "adi_asel", "mode", None),
    ("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot", None, "adi_alt", "radio_alt_ft", None),
    ("sim/custom/7x/z_ads_fail", None, "adi_shared_data", "ads_failed", None),

    ("sim/custom/7x/z_fms_pilot", None, "adi_shared_data", "fms_self", "adi_left"),
    ("sim/custom/7x/z_fms_copilot", None, "adi_shared_data", "fms_self", "adi_right"),
    ("sim/custom/7x/z_fms_copilot", None, "adi_shared_data", "fms_partner", "adi_left"),
    ("sim/custom/7x/z_fms_pilot", None, "adi_shared_data", "fms_partner", "adi_right"),

    ("sim/custom/7x/z_ra_pilot", None, "adi_shared_data", "ra_self", "adi_left"),
    ("sim/custom/7x/z_ra_copilot", None, "adi_shared_data", "ra_self", "adi_right"),
    ("sim/custom/7x/z_ra_copilot", None, "adi_shared_data", "ra_partner", "adi_left"),
    ("sim/custom/7x/z_ra_pilot", None, "adi_shared_data", "ra_partner", "adi_right"),

    ("sim/custom/7x/z_vor_pilot", None, "adi_shared_data", "vor_self", "adi_left"),
    ("sim/custom/7x/z_vor_copilot", None, "adi_shared_data", "vor_self", "adi_right"),
    ("sim/custom/7x/z_vor_copilot", None, "adi_shared_data", "vor_partner", "adi_left"),
    ("sim/custom/7x/z_vor_pilot", None, "adi_shared_data", "vor_partner", "adi_right"),
    ("sim/flightmodel/controls/sbrkrat", None, "adi_airspeed", "ab_pos", None),
    ("sim/flightmodel/controls/sbrkrat", None, "adi_flaps_slats", "airbrake_pos", None),
    ("sim/flightmodel/controls/flaprat", None, "adi_flaps_slats", "flaps_pos", None),
    ("sim/custom/7x/z_no_slip_comp", None, "adi_shared_data", "no_slip_comp", None),
    ("sim/operation/failures/rel_genera0", None, "elec_gen_1", "failed_off", None),
    ("sim/operation/failures/rel_genera1", None, "elec_gen_2", "failed_off", None),
    ("sim/operation/failures/rel_genera2", None, "elec_gen_3", "failed_off", None),

    ("sim/custom/7x/valeurstall", None, "adi_airspeed", "stall_speed", None),
]

dref_nested_dict = defaultdict(list)

for dref, array_idx, object_name, property_name, root_obj_name in dref_indicators:
    dref_nested_dict[dref].append((array_idx, object_name, property_name, root_obj_name))


class TestSingleton(QObject):
    xx = QtCore.Property(int)


class Backend(QObject):
    @Property(float)
    def scale_x(self):
        return 1

    @Property(float)
    def scale_y(self):
        return 1

    def __init__(self):
        super().__init__()

    @Slot(QObject, result=None)
    def on_click(self, button):
        rotation = button.property("state")

    # triger repaint for all canvas item in qml
    updateCanvas = Signal()

    def set_data_http(self, data: dict):
        overrides = data.get("overrides") or {}
        data = data.get("data") or {} 

        # override params from overrides
        for param, value in overrides.items():
            if param in param_overrides.enabled_overrides: 
                data[param] = value
        
        # remove items that must be overriden
        for param in param_overrides.enabled_overrides:
            if param in data and param not in overrides:
                del data[param]

        for dataref, value in data.items():
            indicator_list = dref_nested_dict.get(str(dataref))
            if not indicator_list:
                continue

            for idx, object_name, value_name, root_obj_name in indicator_list:
                items = view_helper.find_object(object_name, root_obj_name)
                if not items:
                    raise Exception(f"no such object_name {object_name}")

                val = value[idx] if idx is not None else value

                for item in items:
                    item.setProperty(value_name, val)

        backend.updateCanvas.emit()


backend = Backend()
