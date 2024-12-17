import xplane.params_to_subscribe as ps
from xplane.params import Params

# replace original subscribe list content
ps.to_subscribe.clear()
ps.to_subscribe.extend([
    (Params["sim/cockpit2/engine/indicators/N1_percent[0]"], 4, "udp"), # synoptic indicator - eng - N1
    (Params["sim/cockpit2/engine/indicators/N1_percent[1]"], 4, "udp"), # synoptic indicator - eng - N1
    (Params["sim/cockpit2/engine/indicators/N1_percent[2]"], 4, "udp"), # synoptic indicator - eng - N1
    (Params["sim/cockpit2/engine/actuators/throttle_ratio[0]"], 4, "udp"), # synoptic - eng - throttle
    (Params["sim/cockpit2/engine/actuators/throttle_ratio[1]"], 4, "udp"), # synoptic - eng - throttle
    (Params["sim/cockpit2/engine/actuators/throttle_ratio[2]"], 4, "udp"), # synoptic - eng - throttle
])

ps.update_udp_lists()
