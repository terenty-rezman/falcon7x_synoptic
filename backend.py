from collections import defaultdict

from PySide6.QtCore import QObject, Slot, Property, SLOT, SIGNAL, QByteArray, QTimer, QMetaObject, Signal

import view_helper
import param_overrides

from falcon7x_core.xplane.params import Params


dref_indicators = [
    # (dataref, idx, "object_name", "property", cast type, round_digits)
    ("sim/cockpit2/engine/indicators/N1_percent[0]", None, "eng_engn1", "n1"),
    ("sim/cockpit2/engine/actuators/throttle_ratio[0]", None, "eng_engn1", "rotation_purpure_circle"),
    ("sim/custom/7x/z_syn_eng_start1", None, "eng_engn1", "start"),
    ("sim/custom/xap/maxin1", None, "eng_engn1", "top_digit"),
    ("sim/custom/7x/z_syn_eng_ab1", None, "eng_engn1", "ab"),
    ("sim/cockpit2/engine/indicators/N1_percent[1]", None,"eng_engn2", "n1"),
    ("sim/cockpit2/engine/actuators/throttle_ratio[1]", None, "eng_engn2", "rotation_purpure_circle"),
    ("sim/custom/7x/z_syn_eng_start2", None, "eng_engn2", "start"),
    ("sim/custom/xap/maxin1", None, "eng_engn2", "top_digit"),
    ("sim/custom/7x/z_syn_eng_ab2", None, "eng_engn2", "ab"),
    ("sim/cockpit2/engine/indicators/N1_percent[2]", None, "eng_engn3", "n1"),
    ("sim/cockpit2/engine/actuators/throttle_ratio[2]", None, "eng_engn3", "rotation_purpure_circle"),
    ("sim/custom/7x/z_syn_eng_start3", None, "eng_engn3", "start"),
    ("sim/custom/xap/maxin1", None, "eng_engn3", "top_digit"),
    ("sim/custom/7x/z_syn_eng_ab3", None, "eng_engn3", "ab"),
    ("sim/cockpit2/electrical/APU_N1_percent", None, "eng_apun1t5", "n1"),
    ("sim/cockpit2/electrical/APU_EGT_c", None, "eng_apun1t5", "t5"),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[0]", None, "eng_itt1", "rotation_green_arrow_deg"),
    ("sim/custom/7x/z_syn_eng_ign1", None, "eng_itt1", "ign"),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[1]", None, "eng_itt2", "rotation_green_arrow_deg"),
    ("sim/custom/7x/z_syn_eng_ign2", None, "eng_itt2", "ign"),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[2]", None, "eng_itt3", "rotation_green_arrow_deg"),
    ("sim/custom/7x/z_syn_eng_ign3", None, "eng_itt3", "ign"),
    ("sim/cockpit2/engine/indicators/N2_percent[0]", None, "eng_n2_1", "value"),
    ("sim/cockpit2/engine/indicators/N2_percent[1]", None, "eng_n2_2", "value"),
    ("sim/cockpit2/engine/indicators/N2_percent[2]", None, "eng_n2_3", "value"),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[0]", None, "eng_ff_1", "value"),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[1]", None, "eng_ff_2", "value"),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[2]", None, "eng_ff_3", "value"),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[0]", None, "eng_oil1", "psi"),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[1]", None, "eng_oil2", "psi"),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[2]", None, "eng_oil3", "psi"),
    ("sim/custom/7x/z_oil_min_height_1", None, "eng_oil1", "oil_min_temp"),
    ("sim/custom/7x/z_oil_min_height_2", None, "eng_oil2", "oil_min_temp"),
    ("sim/custom/7x/z_oil_min_height_3", None, "eng_oil3", "oil_min_temp"),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[0]", None, "eng_oil1", "temp"),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[1]", None, "eng_oil2", "temp"),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[2]", None, "eng_oil3", "temp"),
    ("sim/cockpit2/engine/indicators/N1_percent[0]", None, "eng_vib1", "vib"),
    ("sim/cockpit2/engine/indicators/N1_percent[1]", None, "eng_vib2", "vib"),
    ("sim/cockpit2/engine/indicators/N1_percent[2]", None, "eng_vib3", "vib"),
    ("sim/custom/7x/lhisol", None, "elec_contactor_lh", "state"),
    ("sim/custom/7x/rhisol", None, "elec_contactor_rh", "state"),
    ("sim/cockpit2/electrical/cross_tie", None, "elec_bus_tie_contactor", "state"),
    # ("sim/cockpit2/electrical/battery_on", 0, "elec_bat_1", "state"),
    ("sim/cockpit2/electrical/battery_on[0]", None, "elec_bat_1", "state"),
    ("sim/cockpit2/electrical/battery_on", 1, "elec_bat_2", "state"),
    ("sim/cockpit2/electrical/generator_on", 0, "elec_gen_1", "state"),
    ("sim/cockpit2/engine/indicators/N2_percent[0]", None, "elec_gen_1", "n2"),
    ("sim/cockpit2/electrical/generator_on", 1, "elec_gen_2", "state"),
    ("sim/cockpit2/engine/indicators/N2_percent[1]", None, "elec_gen_2", "n2"),
    ("sim/cockpit2/electrical/generator_on", 2, "elec_gen_3", "state"),
    ("sim/cockpit2/engine/indicators/N2_percent[2]", None, "elec_gen_3", "n2"),
    ("sim/cockpit2/electrical/APU_generator_on", None, "elec_apu", "master_on"),
    ("sim/cockpit2/electrical/APU_N1_percent", None, "elec_apu", "n1"),

    ("sim/custom/7x/z_line_gen2_on", None, "elec_line_gen2", "state"),
    ("sim/custom/7x/z_line_bat2_ratgen_on", None, "elec_line_bat2_ratgen", "state"),
    ("sim/custom/7x/z_line_apu_bat1_on", None, "elec_line_apu_bat1", "state"),
    ("sim/custom/7x/z_line_gen1_gen3_on", None, "elec_line_gen1_gen3", "state"),

    ("sim/cockpit2/electrical/bus_volts[0]", None, "elec_left_voltage", "v"),
    ("sim/cockpit2/electrical/bus_volts[1]", None, "elec_right_voltage", "v"),
    ("sim/cockpit2/electrical/generator_amps[0]", None, "elec_current_gen_1", "amps"),
    ("sim/cockpit2/electrical/generator_amps[1]", None, "elec_current_gen_2", "amps"),
    ("sim/cockpit2/electrical/generator_amps[2]", None, "elec_current_gen_3", "amps"),
    ("sim/cockpit2/electrical/battery_amps[0]", None, "elec_current_bat_1", "amps"),
    ("sim/cockpit2/electrical/battery_amps[1]", None, "elec_current_bat_2", "amps"),
    ("sim/custom/7X/TBAT", None, "elec_temperature_bat1", "temp"),
    ("sim/custom/7X/TBAT", None, "elec_temperature_bat2", "temp"),
    ("sim/cockpit/electrical/gpu_on", None, "ext_power", "state"),
    ("sim/custom/7X/TBAT", None, "elec_bat_temp_scane_1", "temp"),
    ("sim/custom/7X/TBAT", None, "elec_bat_temp_scane_2", "temp"),

    ("sim/custom/7x/z_apu_startup_stage", None, "elec_apu", "startup_stage"),
    ("sim/cockpit2/electrical/APU_generator_amps", None, "elec_current_apu", "amps"),
    ("sim/cockpit2/electrical/APU_N1_percent", None, "elec_current_apu", "apu_n1"),
    ("sim/custom/7x/z_thrust_purple_max_deg_1", None, "eng_engn1", "max_thrust_deg"),
    ("sim/custom/7x/z_thrust_purple_max_deg_2", None, "eng_engn2", "max_thrust_deg"),
    ("sim/custom/7x/z_thrust_purple_max_deg_3", None, "eng_engn3", "max_thrust_deg"),

    ("sim/cockpit2/gauges/indicators/pitch_electric_deg_pilot", None, "adi_horizon", "pitch_deg"),
    ("sim/cockpit2/gauges/indicators/roll_electric_deg_pilot", None, "adi_horizon", "bank_deg"),
]

dref_nested_dict = defaultdict(list)

for dref, idx, object_name, value_name in dref_indicators:
    dref_nested_dict[dref].append((idx, object_name, value_name))


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

            for idx, object_name, value_name in indicator_list:
                items = view_helper.find_object(object_name)
                if not items:
                    raise Exception(f"no such object_name {object_name}")

                val = value[idx] if idx is not None else value

                for item in items:
                    item.setProperty(value_name, val)

        backend.updateCanvas.emit()


backend = Backend()
