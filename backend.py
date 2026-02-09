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
    ("sim/cockpit2/electrical/APU_generator_on", None, "eng_apun1t5", "master_on", None),
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

    # adi
    ("sim/flightmodel/weight/m_fuel_total", None, "adi_fq_text", "fq", None),
    ("sim/flightmodel/weight/m_fuel_total", None, "adi_fr_text", "fr", None),
    ("sim/flightmodel/weight/m_total", None, "adi_gw_text", "gw", None),
    ("sim/cockpit2/gauges/indicators/pitch_electric_deg_pilot", None, "adi_horizon", "pitch_deg", None),
    ("sim/cockpit2/gauges/indicators/roll_electric_deg_pilot", None, "adi_horizon", "bank_deg", None),
    ("sim/cockpit2/gauges/indicators/roll_electric_deg_pilot", None, "adi_bank", "bank_deg", None),
    ("sim/cockpit2/gauges/indicators/altitude_ft_pilot", None, "adi_alt", "altitude_ft", "pdu_left"),
    ("sim/cockpit2/gauges/indicators/altitude_ft_copilot", None, "adi_alt", "altitude_ft", "pdu_right"),
    ("sim/cockpit2/gauges/indicators/heading_AHARS_deg_mag_pilot", None, "adi_heading", "heading_deg", "pdu_left"),
    ("sim/cockpit2/gauges/indicators/heading_AHARS_deg_mag_copilot", None, "adi_heading", "heading_deg", "pdu_right"),
    ("sim/cockpit2/gauges/indicators/airspeed_kts_pilot", None, "adi_airspeed", "speed", "pdu_left"),
    ("sim/cockpit2/gauges/indicators/airspeed_kts_copilot", None, "adi_airspeed", "speed", "pdu_right"),
    ("sim/cockpit2/gauges/indicators/mach_pilot", None, "adi_airspeed", "mach", None),
    ("sim/custom/7x/z_flight_regime", None, "adi_airspeed", "flight_regime", None),
    ("sim/cockpit2/gauges/indicators/vvi_fpm_pilot", None, "adi_vertical_speed", "vy_ft_per_min", None),
    ("sim/cockpit2/gauges/actuators/barometer_setting_in_hg_pilot", None, "adi_alt", "baro_settings", "pdu_left"),
    ("sim/cockpit2/gauges/actuators/barometer_setting_in_hg_copilot", None, "adi_alt", "baro_settings", "pdu_right"),
    ("sim/cockpit2/clock_timer/local_time_hours", None, "adi_current_time", "hours", None),
    ("sim/cockpit2/clock_timer/local_time_minutes", None, "adi_current_time", "minutes", None),
    ("sim/cockpit2/switches/ram_air_turbine_on", None, "elec_rat_gen", "rat_reset", None),
    ("sim/custom/7x/z_rat_manual", None, "elec_rat_gen", "manual_on", None),
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
    ("sim/custom/7x/z_ads_pilot", None, "adi_shared_data", "ads_self", "pdu_left"),
    ("sim/custom/7x/z_ads_copilot", None, "adi_shared_data", "ads_partner", "pdu_left"),
    ("sim/custom/7x/z_ads_copilot", None, "adi_shared_data", "ads_self", "pdu_right"),
    ("sim/custom/7x/z_ads_pilot", None, "adi_shared_data", "ads_partner", "pdu_right"),
    ("sim/cockpit2/autopilot/altitude_dial_ft", None, "adi_alt", "target_alt_ft", None),
    ("sim/custom/7x/z_irs_pilot", None, "adi_irs_symbol", "irs_current", "pdu_left"),
    ("sim/custom/7x/z_irs_copilot", None, "adi_irs_symbol", "irs_partner", "pdu_left"),
    ("sim/custom/7x/z_irs_copilot", None, "adi_irs_symbol", "irs_current", "pdu_right"),
    ("sim/custom/7x/z_irs_pilot", None, "adi_irs_symbol", "irs_partner", "pdu_right"),
    ("sim/cockpit/autopilot/autopilot_mode", None, "adi_alt_symbol", "ap_mode", None),
    ("sim/cockpit2/autopilot/altitude_dial_ft", None, "adi_alt_symbol", "target_alt_ft", None),
    ("sim/cockpit2/autopilot/altitude_hold_armed", None, "adi_alt_symbol", "altitude_mode", None),
    ("sim/cockpit2/autopilot/vvi_status", None, "adi_alt_symbol", "vs_mode", None),
    # ("sim/cockpit2/annunciators/reverser_deployed", None, "adi_reverse_symbol", "mode", None),
    ("sim/cockpit2/annunciators/reverser_deployed", None, "eng_engn2", "reverse_deployed", None),
    ("sim/cockpit2/autopilot/altitude_dial_ft", None, "adi_asel", "target_alt_ft", None),
    ("sim/cockpit2/autopilot/altitude_hold_armed", None, "adi_asel", "mode", None),
    ("sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot", None, "adi_alt", "radio_alt_ft", None),
    ("sim/custom/7x/z_ads_fail", None, "adi_shared_data", "ads_failed", None),

    ("sim/custom/7x/z_fms_pilot", None, "adi_shared_data", "fms_self", "pdu_left"),
    ("sim/custom/7x/z_fms_copilot", None, "adi_shared_data", "fms_self", "pdu_right"),
    ("sim/custom/7x/z_fms_copilot", None, "adi_shared_data", "fms_partner", "pdu_left"),
    ("sim/custom/7x/z_fms_pilot", None, "adi_shared_data", "fms_partner", "pdu_right"),

    ("sim/custom/7x/z_ra_pilot", None, "adi_shared_data", "ra_self", "pdu_left"),
    ("sim/custom/7x/z_ra_copilot", None, "adi_shared_data", "ra_self", "pdu_right"),
    ("sim/custom/7x/z_ra_copilot", None, "adi_shared_data", "ra_partner", "pdu_left"),
    ("sim/custom/7x/z_ra_pilot", None, "adi_shared_data", "ra_partner", "pdu_right"),

    ("sim/custom/7x/z_vor_pilot", None, "adi_shared_data", "vor_self", "pdu_left"),
    ("sim/custom/7x/z_vor_copilot", None, "adi_shared_data", "vor_self", "pdu_right"),
    ("sim/custom/7x/z_vor_copilot", None, "adi_shared_data", "vor_partner", "pdu_left"),
    ("sim/custom/7x/z_vor_pilot", None, "adi_shared_data", "vor_partner", "pdu_right"),
    ("sim/flightmodel/controls/sbrkrat", None, "adi_airspeed", "ab_pos", None),
    ("sim/flightmodel/controls/sbrkrat", None, "adi_flaps_slats", "airbrake_pos", None),
    ("sim/flightmodel/controls/flaprat", None, "adi_flaps_slats", "flaps_pos", None),
    ("sim/custom/7x/z_no_slip_comp", None, "adi_shared_data", "no_slip_comp", None),
    ("sim/operation/failures/rel_genera0", None, "elec_gen_1", "failed_off", None),
    ("sim/operation/failures/rel_genera1", None, "elec_gen_2", "failed_off", None),
    ("sim/operation/failures/rel_genera2", None, "elec_gen_3", "failed_off", None),
    ("sim/custom/7x/valeurstall", None, "adi_airspeed", "stall_speed", None),

    ("sim/custom/7x/z_fuel_xtk_13", None, "fuel_xtk_13", "state", None),
    ("sim/custom/7x/z_fuel_xtk_12", None, "fuel_xtk_12", "state", None),
    ("sim/custom/7x/z_fuel_xtk_23", None, "fuel_xtk_23", "state", None),
    ("sim/custom/7x/z_fuel_xbp_12", None, "fuel_xbp_12", "state", None),
    ("sim/custom/7x/z_fuel_xbp_13", None, "fuel_xbp_13", "state", None),
    ("sim/custom/7x/z_fuel_xbp_23", None, "fuel_xbp_23", "state", None),
    ("sim/custom/7x/z_fuel_pipe_t1t3", None, "fuel_pipe_t1t3", "state", None),
    ("sim/custom/7x/z_fuel_pipe_t1t2", None, "fuel_pipe_t1t2", "state", None),
    ("sim/custom/7x/z_fuel_pipe_t2t3", None, "fuel_pipe_t2t3", "state", None),
    ("sim/custom/7x/z_fuel_pipe_t1e1", None, "fuel_pipe_t1e1", "state", None),
    ("sim/custom/7x/z_fuel_pipe_t3e3", None, "fuel_pipe_t3e3", "state", None),
    ("sim/custom/7x/z_fuel_pipe_t2e2", None, "fuel_pipe_t2e2", "state", None),
    ("sim/custom/7x/z_fuel_pipe_xbp12", None, "fuel_pipe_xbp12", "state", None),
    ("sim/custom/7x/z_fuel_pipe_xbp23", None, "fuel_pipe_xbp23", "state", None),
    ("sim/custom/7x/z_fuel_pipe_xbp13", None, "fuel_pipe_xbp13", "state", None),
    ("sim/custom/7x/z_fuel_pipe_t2apu", None, "fuel_pipe_t2apu", "state", None),
    ("sim/custom/7x/z_fuel_boost1", None, "fuel_boost1", "state", None),
    ("sim/custom/7x/z_fuel_boost2", None, "fuel_boost2", "state", None),
    ("sim/custom/7x/z_fuel_boost3", None, "fuel_boost3", "state", None),
    ("sim/custom/7x/z_fuel_eng1", None, "fuel_eng1", "state", None),
    ("sim/custom/7x/z_fuel_eng2", None, "fuel_eng2", "state", None),
    ("sim/custom/7x/z_fuel_eng3", None, "fuel_eng3", "state", None),
    ("sim/custom/7x/z_fuel_apu", None, "fuel_apu", "state", None),
    ("sim/flightmodel/weight/m_fuel1", None, "fuel_tank1", "fuel_weight", None),
    ("sim/flightmodel/weight/m_fuel2", None, "fuel_tank2", "fuel_weight", None),
    ("sim/flightmodel/weight/m_fuel3", None, "fuel_tank3", "fuel_weight", None),
    ("sim/flightmodel/weight/m_fuel1", None, "fuel_level_t1", "fuel_weight", None),
    ("sim/flightmodel/weight/m_fuel2", None, "fuel_level_t2", "fuel_weight", None),
    ("sim/flightmodel/weight/m_fuel3", None, "fuel_level_t3", "fuel_weight", None),
    ("sim/cockpit2/fuel/fuel_quantity[0]", None, "fuel_fq1", "value", None),
    ("sim/cockpit2/fuel/fuel_quantity[1]", None, "fuel_fq2", "value", None),
    ("sim/cockpit2/fuel/fuel_quantity[2]", None, "fuel_fq3", "value", None),
    ("sim/flightmodel/weight/m_fuel_total", None, "fuel_fq", "value", None),
    ("sim/flightmodel/weight/m_fuel_total", None, "fuel_fr", "value", None),
    ("sim/custom/7x/fuel_used", None, "fuel_fu", "value", None),
    ("sim/custom/7x/fuel_used1", None, "fuel_fu1", "value", None),
    ("sim/custom/7x/fuel_used2", None, "fuel_fu2", "value", None),
    ("sim/custom/7x/fuel_used3", None, "fuel_fu3", "value", None),
    ("sim/custom/7X/TBAT", None, "fuel_temp", "value", None),
    ("sim/custom/7x/z_et_timer_left", None, "et_timer", "secs", "pdu_left"),
    ("sim/custom/7x/z_et_timer_right", None, "et_timer", "secs", "pdu_right"),
    
    # hyd tab
    ("sim/custom/7x/z_hyd_pump_a1", None, "hyd_pump_a1", "state", None),
    ("sim/custom/7x/z_hyd_pump_a3", None, "hyd_pump_a3", "state", None),
    ("sim/custom/7x/z_hyd_pump_bu", None, "hyd_pump_bu", "state", None),
    ("sim/custom/7x/z_hyd_pump_b2", None, "hyd_pump_b2", "state", None),
    ("sim/custom/7x/z_hyd_pump_b3", None, "hyd_pump_b3", "state", None),
    ("sim/custom/7x/z_hyd_pump_c2", None, "hyd_pump_c2", "state", None),
    ("sim/custom/7x/z_hyd_pump_a1_text", None, "hyd_pump_a1_text", "state", None),
    ("sim/custom/7x/z_hyd_pump_a3_text", None, "hyd_pump_a3_text", "state", None),
    ("sim/custom/7x/z_hyd_pump_bu_text", None, "hyd_pump_bu_text", "state", None),
    ("sim/custom/7x/z_hyd_pump_b2_text", None, "hyd_pump_b2_text", "state", None),
    ("sim/custom/7x/z_hyd_pump_b3_text", None, "hyd_pump_b3_text", "state", None),
    ("sim/custom/7x/z_hyd_pump_c2_text", None, "hyd_pump_c2_text", "state", None),
    ("sim/custom/7x/z_hyd_pipe_a1", None, "hyd_pipe_a1", "state", None),
    ("sim/custom/7x/z_hyd_pipe_a3", None, "hyd_pipe_a3", "state", None),
    ("sim/custom/7x/z_hyd_pipe_a1a3", None, "hyd_pipe_a1a3", "state", None),
    ("sim/custom/7x/z_hyd_pipe_b2", None, "hyd_pipe_b2", "state", None),
    ("sim/custom/7x/z_hyd_pipe_b3", None, "hyd_pipe_b3", "state", None),
    ("sim/custom/7x/z_hyd_pipe_b2b3", None, "hyd_pipe_b2b3", "state", None),
    ("sim/custom/7x/z_hyd_pipe_c2", None, "hyd_pipe_c2", "state", None),
    ("sim/custom/7x/z_hyd_pipe_ebha", None, "hyd_pipe_ebha", "state", None),
    ("sim/custom/7x/z_hyd_pipe_brake2", None, "hyd_pipe_brake2", "state", None),
    ("sim/custom/7x/z_hyd_pipe_bu", None, "hyd_pipe_bu", "state", None),
    ("sim/custom/7x/z_hyd_text_om_slats", None, "hyd_text_om_slats", "state", None),
    ("sim/custom/7x/z_hyd_text_rh_ail", None, "hyd_text_rh_ail", "state", None),
    ("sim/custom/7x/z_hyd_text_rh_elev", None, "hyd_text_rh_elev", "state", None),
    ("sim/custom/7x/z_hyd_text_spoilers", None, "hyd_text_spoilers", "state", None),
    ("sim/custom/7x/hyd11", None, "hyd_psi_1", "psi", None),
    ("sim/custom/7x/hyd22", None, "hyd_psi_2", "psi", None),
    ("sim/custom/7x/hyd3", None, "hyd_psi_3", "psi", None),
    ("sim/cockpit2/hydraulics/indicators/hydraulic_fluid_ratio_1", None, "hyd_qty_1", "fluid_ratio", None),
    ("sim/cockpit2/hydraulics/indicators/hydraulic_fluid_ratio_2", None, "hyd_qty_2", "fluid_ratio", None),
    ("sim/cockpit2/hydraulics/indicators/hydraulic_fluid_ratio_2", None, "hyd_qty_3", "fluid_ratio", None),

    # fcs tab
    ("sim/flightmodel/controls/wing1l_ail1def", None, "fcs_lh_ail", "ail_def", None),
    ("sim/flightmodel/controls/wing1r_ail1def", None, "fcs_rh_ail", "ail_def", None),
    ("sim/flightmodel/controls/lsplrdef", None, "fcs_lh_spoil", "deflection", None),
    ("sim/flightmodel/controls/wing1r_spo1def", None, "fcs_rh_spoil", "deflection", None),
    ("sim/flightmodel/controls/hstab1_elv1def", None, "fcs_lh_elev", "deflection", None),
    ("sim/flightmodel/controls/hstab1_elv1def", None, "fcs_rh_elev", "deflection", None),
    ("sim/flightmodel/controls/vstab1_rud1def", None, "fcs_rudder", "deflection", None),
    ("sim/cockpit2/controls/aileron_trim", None, "fcs_roll_trim", "value", None),
    ("sim/cockpit2/controls/rudder_trim", None, "fcs_yaw_trim", "value", None),
    ("sim/cockpit2/controls/elevator_trim", None, "fcs_pitch_trim", "value", None),
    ("sim/flightmodel/controls/slatrat", None, "fcs_slats_right", "value", None),
    ("sim/custom/7x/z_fcs_mfcc_1", None, "fcs_mfcc", "sys1_ok", None),
    ("sim/custom/7x/z_fcs_mfcc_2", None, "fcs_mfcc", "sys2_ok", None),
    ("sim/custom/7x/z_fcs_mfcc_3", None, "fcs_mfcc", "sys3_ok", None),
    ("sim/custom/7x/z_fcs_sfcc_1", None, "fcs_sfcc", "sys1_ok", None),
    ("sim/custom/7x/z_fcs_sfcc_2", None, "fcs_sfcc", "sys2_ok", None),
    ("sim/custom/7x/z_fcs_sfcc_3", None, "fcs_sfcc", "sys3_ok", None),

    ("sim/cockpit2/pressurization/indicators/cabin_altitude_ft", None, "ecs_cabin_alt", "alt_ft", None),
    ("sim/cockpit2/oxygen/indicators/o2_bottle_rem_liter", None, "ecs_o2_volume", "o2_liter", None),
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

    # triger blue border in qml
    updateMousePos = Signal(int, int, int, int)

    def update_mouse(self):
        self.updateMousePos.emit(0, 1, 2, 3)

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
        # backend.update_mouse()


backend = Backend()
