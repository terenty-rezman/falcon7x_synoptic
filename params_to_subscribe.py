import falcon7x_core.xplane.params_to_subscribe as ps
from falcon7x_core.xplane.params import Params

# replace original subscribe list content
to_subscribe = [
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
    (Params["sim/custom/7x/z_syn_eng_ign1"], None, "tcp"), # synoptic eng 1 ign indication
]
