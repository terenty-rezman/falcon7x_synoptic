from collections import defaultdict

from PySide6.QtCore import QObject, Slot, Property, SLOT, SIGNAL, QByteArray, QTimer, QMetaObject, Signal

import view_helper


dref_indicator_map = {
    # (dataref, idx): ("object_name", "property", cast type, round_digits)
    ("sim/cockpit2/engine/indicators/N1_percent[0]", None): ("eng_engn1", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/actuators/throttle_ratio[0]", None): ("eng_engn1", "rotation_purpure_circle"),
    ("sim/cockpit2/engine/indicators/N1_percent[1]", None): ("eng_engn2", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/actuators/throttle_ratio[1]", None): ("eng_engn2", "rotation_purpure_circle"),
    ("sim/cockpit2/engine/indicators/N1_percent[2]", None): ("eng_engn3", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/actuators/throttle_ratio[2]", None): ("eng_engn3", "rotation_purpure_circle"),
    ("sim/cockpit2/electrical/APU_N1_percent", None): ("eng_apun1t5", "n1"),
    ("sim/cockpit2/electrical/APU_EGT_c", None): ("eng_apun1t5", "t5"),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[0]", None): ("eng_itt1", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[1]", None): ("eng_itt2", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/indicators/ITT_deg_C[2]", None): ("eng_itt3", "rotation_green_arrow_deg"),
    ("sim/cockpit2/engine/indicators/N2_percent[0]", None): ("eng_n2_1", "value"),
    ("sim/cockpit2/engine/indicators/N2_percent[1]", None): ("eng_n2_2", "value"),
    ("sim/cockpit2/engine/indicators/N2_percent[2]", None): ("eng_n2_3", "value"),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[0]", None): ("eng_ff_1", "value"),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[1]", None): ("eng_ff_2", "value"),
    ("sim/cockpit2/engine/indicators/fuel_flow_kg_sec[2]", None): ("eng_ff_3", "value"),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[0]", None): ("eng_oil1", "psi"),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[1]", None): ("eng_oil2", "psi"),
    ("sim/cockpit2/engine/indicators/oil_pressure_psi[2]", None): ("eng_oil3", "psi"),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[0]", None): ("eng_oil1", "temp"),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[1]", None): ("eng_oil2", "temp"),
    ("sim/cockpit2/engine/indicators/oil_temperature_deg_C[2]", None): ("eng_oil3", "temp"),
    ("sim/cockpit2/engine/indicators/N1_percent[0]", None): ("eng_vib1", "vib"),
    ("sim/cockpit2/engine/indicators/N1_percent[1]", None): ("eng_vib2", "vib"),
    ("sim/cockpit2/engine/indicators/N1_percent[2]", None): ("eng_vib3", "vib"),
}

dref_nested_dict = defaultdict(dict)

for (dref, idx), indicator_property in dref_indicator_map.items():
    dref_nested_dict[dref][idx] = indicator_property


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

    updateCanvas = Signal()
    
    def set_data_http(self, data: dict):
        for dataref, value in data.items():
            indicators = dref_nested_dict.get(str(dataref))
            if not indicators:
                continue

            for idx, indicator_data in indicators.items():
                item = view_helper.find_object(indicator_data[0])
                if item is None:
                    raise Exception(f"no such object_name {indicator_data[0]}")
                    break

                val = value[idx] if idx is not None else value

                item.setProperty(indicator_data[1], val)

        backend.updateCanvas.emit()


backend = Backend()
