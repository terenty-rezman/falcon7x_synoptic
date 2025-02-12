from collections import defaultdict

from PySide6.QtCore import QObject, Slot, Property, SLOT, SIGNAL, QByteArray, QTimer, QMetaObject, Signal

import view_helper
import param_overrides


dref_indicators = [
    # (dataref, idx, "object_name", "property", cast type, round_digits)
    ("sim/cockpit2/engine/indicators/N1_percent[0]", None, "eng_engn1", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/actuators/throttle_ratio[0]", None, "eng_engn1", "rotation_purpure_circle"),
    ("sim/custom/7x/z_syn_eng_start1", None, "eng_engn1", "start"),
    ("sim/cockpit2/engine/indicators/N1_percent[1]", None,"eng_engn2", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/actuators/throttle_ratio[1]", None, "eng_engn2", "rotation_purpure_circle"),
    ("sim/cockpit2/engine/indicators/N1_percent[2]", None, "eng_engn3", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/actuators/throttle_ratio[2]", None, "eng_engn3", "rotation_purpure_circle"),
    ("sim/cockpit2/electrical/APU_N1_percent", None, "eng_apun1t5", "n1"),
    ("sim/cockpit2/electrical/APU_EGT_c", None, "eng_apun1t5", "t5"),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[0]", None, "eng_itt1", "rotation_green_arrow_deg"),
    ("sim/custom/7x/z_syn_eng_ign1", None, "eng_itt1", "ign"),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[1]", None, "eng_itt2", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[2]", None, "eng_itt3", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/indicators/N2_percent[0]", None, "eng_n2_1", "value"),
    ("sim/cockpit2/engine/indicators/N2_percent[1]", None, "eng_n2_2", "value"),
    ("sim/cockpit2/engine/indicators/N2_percent[2]", None, "eng_n2_3", "value"),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[0]", None, "eng_ff_1", "value"),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[1]", None, "eng_ff_2", "value"),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[2]", None, "eng_ff_3", "value"),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[0]", None, "eng_oil1", "psi"),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[1]", None, "eng_oil2", "psi"),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[2]", None, "eng_oil3", "psi"),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[0]", None, "eng_oil1", "temp"),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[1]", None, "eng_oil2", "temp"),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[2]", None, "eng_oil3", "temp"),
    ("sim/cockpit2/engine/indicators/N1_percent[0]", None, "eng_vib1", "vib"),
    ("sim/cockpit2/engine/indicators/N1_percent[1]", None, "eng_vib2", "vib"),
    ("sim/cockpit2/engine/indicators/N1_percent[2]", None, "eng_vib3", "vib"),
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
                item = view_helper.find_object(object_name)
                if item is None:
                    raise Exception(f"no such object_name {object_name}")

                val = value[idx] if idx is not None else value

                item.setProperty(value_name, val)

        backend.updateCanvas.emit()


backend = Backend()
