from falcon7x_core.xplane.params import Params

# replace original subscribe list content
to_subscribe = [
    # param, freq, protocol
    (Params["sim/cockpit2/engine/indicators/N1_percent[0]"], 15, "udp"), # synoptic indicator - eng - N1
    (Params["sim/cockpit2/engine/indicators/N1_percent[1]"], 15, "udp"), # synoptic indicator - eng - N1
    (Params["sim/cockpit2/engine/indicators/N1_percent[2]"], 15, "udp"), # synoptic indicator - eng - N1
    (Params["sim/cockpit2/engine/actuators/throttle_ratio[0]"], 15, "udp"), # synoptic - eng - throttle
    (Params["sim/cockpit2/engine/actuators/throttle_ratio[1]"], 15, "udp"), # synoptic - eng - throttle
    (Params["sim/cockpit2/engine/actuators/throttle_ratio[2]"], 15, "udp"), # synoptic - eng - throttle
    (Params["sim/cockpit2/electrical/APU_N1_percent"], 8, "udp"), # synoptic - eng - apu n1
    (Params["sim/cockpit2/electrical/APU_EGT_c"], 8, "udp"), # synoptic - eng - t5
    (Params["sim/cockpit2/engine/indicators/ITT_deg_C[0]"], 8, "udp"), # synoptic - eng - itt 
    (Params["sim/cockpit2/engine/indicators/ITT_deg_C[1]"], 8, "udp"), # synoptic - eng - itt 
    (Params["sim/cockpit2/engine/indicators/ITT_deg_C[2]"], 8, "udp"), # synoptic - eng - itt 
    (Params["sim/cockpit2/engine/indicators/N2_percent[0]"], 8, "udp"), # synoptic - eng - n2
    (Params["sim/cockpit2/engine/indicators/N2_percent[1]"], 8, "udp"), # synoptic - eng - n2
    (Params["sim/cockpit2/engine/indicators/N2_percent[2]"], 8, "udp"), # synoptic - eng - n2
    (Params["sim/cockpit2/engine/indicators/fuel_flow_kg_sec[0]"], 8, "udp"), # synoptic - eng - ff
    (Params["sim/cockpit2/engine/indicators/fuel_flow_kg_sec[1]"], 8, "udp"), # synoptic - eng - ff
    (Params["sim/cockpit2/engine/indicators/fuel_flow_kg_sec[2]"], 8, "udp"), # synoptic - eng - ff
    (Params["sim/cockpit2/engine/indicators/oil_pressure_psi[0]"], 8, "udp"), # synoptic - eng - oil psi
    (Params["sim/cockpit2/engine/indicators/oil_pressure_psi[1]"], 8, "udp"), # synoptic - eng - oil psi
    (Params["sim/cockpit2/engine/indicators/oil_pressure_psi[2]"], 8, "udp"), # synoptic - eng - oil psi
    (Params["sim/cockpit2/engine/indicators/oil_temperature_deg_C[0]"], 8, "udp"), # synoptic - eng - oil temp
    (Params["sim/cockpit2/engine/indicators/oil_temperature_deg_C[1]"], 8, "udp"), # synoptic - eng - oil temp
    (Params["sim/cockpit2/engine/indicators/oil_temperature_deg_C[2]"], 8, "udp"), # synoptic - eng - oil temp
    (Params["sim/custom/7x/z_syn_eng_start1"], None, "tcp"), # synoptic eng 1 start indication
    (Params["sim/custom/7x/z_syn_eng_start2"], None, "tcp"), # synoptic eng 1 start indication
    (Params["sim/custom/7x/z_syn_eng_start3"], None, "tcp"), # synoptic eng 1 start indication
    (Params["sim/custom/7x/z_syn_eng_ign1"], None, "tcp"), # synoptic eng 1 ign indication
    (Params["sim/custom/7x/z_syn_eng_ign2"], None, "tcp"), # synoptic eng 1 ign indication
    (Params["sim/custom/7x/z_syn_eng_ign3"], None, "tcp"), # synoptic eng 1 ign indication
    (Params["sim/custom/xap/maxin1"], None, "tcp"), # synoptic eng n1 top digit
    (Params["sim/custom/7x/z_syn_eng_ab1"], None, "tcp"), # synoptic eng 1 A or B
    (Params["sim/custom/7x/z_syn_eng_ab2"], None, "tcp"), # synoptic eng 2 A or B
    (Params["sim/custom/7x/z_syn_eng_ab3"], None, "tcp"), # synoptic eng 3 A or B
    (Params["sim/custom/7x/lhisol"], None, "tcp"), # synoptic elec lh isol
    (Params["sim/custom/7x/rhisol"], None, "tcp"), # synoptic elec rh isol
    (Params["sim/cockpit2/electrical/cross_tie"], None, "tcp"), # synoptic elec bus tie
    (Params["sim/cockpit2/electrical/battery_on"], None, "tcp"), # synoptic elec bat 1
    (Params["sim/cockpit2/electrical/battery_on[0]"], 2, "udp"), # to override battery 1 state
    (Params["sim/cockpit2/electrical/generator_on"], None, "tcp"), # synoptic elec gens
    (Params["sim/cockpit2/electrical/APU_generator_on"], None, "tcp"), # synoptic elec apu

    (Params["sim/custom/7x/z_line_gen2_on"], None, "tcp"), # synoptic elec line power 
    (Params["sim/custom/7x/z_line_bat2_ratgen_on"], None, "tcp"), # synoptic elec
    (Params["sim/custom/7x/z_line_apu_bat1_on"], None, "tcp"), # synoptic elec
    (Params["sim/custom/7x/z_line_gen1_gen3_on"], None, "tcp"), # synoptic elec

    (Params["sim/cockpit2/electrical/bus_volts[0]"], 3, "udp"), # synoptic elec bus voltage lh
    (Params["sim/cockpit2/electrical/bus_volts[1]"], 3, "udp"), # synoptic elec bus voltage rh
    (Params["sim/cockpit2/electrical/generator_amps[0]"], 6, "udp"), # synoptic elec gen amps
    (Params["sim/cockpit2/electrical/generator_amps[1]"], 6, "udp"), # synoptic elec gen amps
    (Params["sim/cockpit2/electrical/generator_amps[2]"], 6, "udp"), # synoptic elec gen amps
    (Params["sim/cockpit2/electrical/battery_amps[0]"], 6, "udp"), # synoptic elec bat amps
    (Params["sim/cockpit2/electrical/battery_amps[1]"], 6, "udp"), # synoptic elec bat amps
    (Params["sim/custom/7X/TBAT"], 3, "udp"), # synoptic elec bat temp
    (Params["sim/cockpit/electrical/gpu_on"], None, "tcp"), # synoptic elec ext power
    (Params["sim/custom/7x/z_apu_startup_stage"], None, "tcp"), # synoptic elec ext power
    (Params["sim/cockpit2/electrical/APU_generator_amps"], 3, "udp"), # synoptic elec apu amps

    (Params["sim/custom/7x/z_oil_min_height_1"], 2, "udp"), # synoptic eng min oil level
    (Params["sim/custom/7x/z_oil_min_height_2"], 2, "udp"), # synoptic eng min oil level
    (Params["sim/custom/7x/z_oil_min_height_3"], 2, "udp"), # synoptic eng min oil level

    (Params["sim/custom/7x/z_left_black_screen"], None, "tcp"), # pdu left
    (Params["sim/custom/7x/z_right_black_screen"], None, "tcp"), # pdu right
    (Params["sim/custom/7x/z_middle_up_black_screen"], None, "tcp"), # mdu up 
    (Params["sim/custom/7x/z_middle_down_black_screen"], None, "tcp"), # mdu down
    (Params["sim/custom/7x/z_mini_black_screen"], None, "tcp"), # aux screen

    (Params["sim/custom/7x/z_thrust_purple_max_deg_1"], None, "tcp"), #  # max thrust degree of purple circle on synoptic indicator
    (Params["sim/custom/7x/z_thrust_purple_max_deg_2"], None, "tcp"), #  # max thrust degree of purple circle on synoptic indicator
    (Params["sim/custom/7x/z_thrust_purple_max_deg_3"], None, "tcp"), #  # max thrust degree of purple circle on synoptic indicator

    (Params["sim/cockpit2/gauges/indicators/pitch_electric_deg_pilot"], 24, "udp"), #  # max thrust degree of purple circle on synoptic indicator
    (Params["sim/cockpit2/gauges/indicators/roll_electric_deg_pilot"], 24, "udp"), #  # max thrust degree of purple circle on synoptic indicator
    (Params["sim/cockpit2/gauges/indicators/altitude_ft_pilot"], 20, "udp"), # altitude
    (Params["sim/cockpit2/gauges/indicators/heading_AHARS_deg_mag_pilot"], 20, "udp"), # heading
    (Params["sim/cockpit2/gauges/indicators/airspeed_kts_pilot"], 20, "udp"), # airspeed
    (Params["sim/cockpit2/gauges/indicators/vvi_fpm_pilot"], 20, "udp"), # vertical speed ft per min
    (Params["sim/cockpit2/gauges/actuators/barometer_setting_in_hg_pilot"], 15, "udp"), # adi alt baro settings
    (Params["sim/cockpit2/clock_timer/local_time_hours"], None, "tcp"), # hours
    (Params["sim/cockpit2/clock_timer/local_time_minutes"], None, "tcp"), # minutes
    (Params["sim/flightmodel/position/true_airspeed"], 10, "udp"), # adi tas
    (Params["sim/flightmodel2/position/groundspeed"], 10, "udp"), # adi gs
    (Params["sim/cockpit2/gauges/indicators/mach_pilot"], 5, "udp"), # adi mach current pilot
    (Params["sim/flightmodel/controls/elv_trim"], 5, "udp"), # adi pitch elev
    (Params["sim/cockpit2/switches/ram_air_turbine_on"], None, "tcp"), # rat gen
    (Params["sim/cockpit2/annunciators/gear_unsafe"], None, "tcp"), # gear transition state
    (Params["sim/cockpit2/controls/gear_handle_down"], None, "tcp"), # gear handle
    (Params["sim/cockpit/autopilot/autopilot_mode"], None, "tcp"), # autopilot mode
    (Params["sim/cockpit/radios/ap_src"], None, "tcp"), # autopilot pilot side
    (Params["sim/cockpit2/autopilot/heading_mode"], None, "tcp"), # autopilot heading mode
    (Params["sim/cockpit/autopilot/heading_mag"], 5, "udp"), # target heading
    (Params["sim/cockpit2/autopilot/altitude_dial_ft"], 5, "udp"), # target alt
    (Params["sim/cockpit2/autopilot/airspeed_dial_kts"], 10, "udp"), # target speed kts
    (Params["sim/cockpit2/autopilot/autothrottle_enabled"], None, "tcp"), # autothrust enabled
    (Params["sim/custom/7x/z_ads_pilot"], None, "tcp"), # ads
    (Params["sim/custom/7x/z_ads_copilot"], None, "tcp"), # ads
    (Params["sim/custom/7x/z_irs_pilot"], None, "tcp"), # irs
    (Params["sim/custom/7x/z_irs_copilot"], None, "tcp"), # irs
    (Params["sim/cockpit2/autopilot/altitude_hold_armed"], None, "tcp"), # ap alt
    (Params["sim/cockpit2/autopilot/vvi_status"], None, "tcp"), # ap vs
    (Params["sim/cockpit2/annunciators/reverser_deployed"], None, "tcp"), # thrust reverse
    (Params["sim/cockpit2/gauges/indicators/radio_altimeter_height_ft_pilot"], 10, "udp"), # radio altitude
    (Params["sim/custom/7x/z_ads_fail"], None, "tcp"), # failed ads id
    (Params["sim/custom/7x/z_fms_pilot"], None, "tcp"), # curr fms
    (Params["sim/custom/7x/z_fms_copilot"], None, "tcp"), # curr fms
    (Params["sim/custom/7x/z_ra_pilot"], None, "tcp"), # curr ra
    (Params["sim/custom/7x/z_ra_copilot"], None, "tcp"), # curr ra
    (Params["sim/custom/7x/z_vor_pilot"], None, "tcp"), # curr vor
    (Params["sim/custom/7x/z_vor_copilot"], None, "tcp"), # curr vor
]
