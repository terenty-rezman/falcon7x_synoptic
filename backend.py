from collections import defaultdict

from PySide6.QtCore import QObject, Slot, Property, SLOT, SIGNAL, QByteArray, QTimer, QMetaObject, Signal

import view_helper


dref_indicator_map = {
    ("sim/cockpit2/engine/indicators/N1_percent[0]", None): ("eng_engn1", "rotation_green_arrow_deg", float, 1),
    ("sim/cockpit2/engine/actuators/throttle_ratio[0]", None): ("eng_engn1", "rotation_purpure_circle", float, 2),
    ("sim/cockpit2/engine/indicators/N1_percent[1]", None): ("eng_engn2", "rotation_green_arrow_deg", float, 1),
    ("sim/cockpit2/engine/actuators/throttle_ratio[1]", None): ("eng_engn2", "rotation_purpure_circle", float, 2),
    ("sim/cockpit2/engine/indicators/N1_percent[2]", None): ("eng_engn3", "rotation_green_arrow_deg", float, 1),
    ("sim/cockpit2/engine/actuators/throttle_ratio[2]", None): ("eng_engn3", "rotation_purpure_circle", float, 2),
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
                    break

                val = value[idx] if idx is not None else value

                if indicator_data[2] == float:
                    val = round(val, indicator_data[3])

                item.setProperty(indicator_data[1], val)

        backend.updateCanvas.emit()


backend = Backend()
