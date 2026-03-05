import sys
import asyncio

import traceback

from PySide6.QtGui import QGuiApplication, QCursor

from qasync import QEventLoop, QApplication

import backend
import web_interface
import view_helper
import param_overrides

import falcon7x_core.xplane.master as xp
from falcon7x_core.xplane.params import Params
import falcon7x_core.common.sane_tasks as sane_tasks

import params_to_subscribe
import screen_control
import cas
import udp_2_mouse

import settings as s

import window_manager.manager as manager
from window_manager.avia_menu_manager import top_level_avia_menu_manager


def on_new_xp_data(type, dataref, value):
    data = {"data": {Params[dataref]: value}}

    backend.backend.set_data_http(data)
    screen_control.set_data_http_tcp(data)
    cas.set_regime_xp_data(data)


def on_data_exception(ex: Exception):
    print(traceback.format_exc())


def on_new_xp_data_udp(received_vals):
    backend.backend.set_data_http({"data": received_vals})
    screen_control.set_data_http_udp({"data": received_vals})
    pass


def on_data_exception_udp(ex):
    print(traceback.format_exc())


val = 0
async def test_qml():
    global val
    speed = 0.1

    while True:
        if val < 0:
            speed = 0.05 
        elif val > 1:
            speed = -0.05

        val += speed
        
        fake = {
            Params["sim/cockpit2/engine/indicators/N1_percent[0]"]: val*90,
            Params["sim/cockpit2/engine/indicators/N1_percent[1]"]: val*90,
            Params["sim/cockpit2/engine/indicators/N1_percent[2]"]: val*90,
            Params["sim/cockpit2/engine/actuators/throttle_ratio[0]"]: val,
            Params["sim/cockpit2/engine/actuators/throttle_ratio[1]"]: val,
            Params["sim/cockpit2/engine/actuators/throttle_ratio[2]"]: val
        }

        backend.backend.set_data_http(fake)
        await asyncio.sleep(0.016)


def blue_border_mouse_update():
        # global_pos = QCursor.pos()  
        # backend.backend.updateMousePos.emit(global_pos.x(), global_pos.y(), 0, 0)

        backend.backend.updateMousePos.emit(
            udp_2_mouse.mouse_coords[0],
            udp_2_mouse.mouse_coords[1],
            udp_2_mouse.mouse_coords[2],
            udp_2_mouse.mouse_coords[3]
        )


async def window_manager_test():
    from window_manager.manager import current_screen_tiles, ScreenPosition, WindowTile

    while True:
        global_mouse_pos = QCursor.pos()  
        backend.backend.updateMousePos.emit(global_mouse_pos.x(), global_mouse_pos.y(), 0, 0)
        top_level_avia_menu_manager.invoke_menu(1, global_mouse_pos)

        await asyncio.sleep(4)


from INAV.inav import markerModel
import random
import numpy as np
import pickle
import os
import string
from sortedcontainers import SortedDict

from PySide6.QtPositioning import QGeoCoordinate

nav_map = {}

def generate_nav_map():
    i = 0
    for lat in np.arange(0, 70, 0.05):
        for lon in np.arange(0, 100, 0.1):
            i+=1
            # randomly generate some markers around the base coordinate
            item_lat = lat + (random.uniform(-0.05, 0.05))
            item_lon = lon + (random.uniform(-0.05, 0.05))

            letters = string.ascii_letters
            random_chars = random.choices(letters, k=4)
            random_string = "".join(random_chars)

            name = random_string.upper()

            nav_map[f"{lat:.2f}{lon:.2f}"] = (item_lat, item_lon, name)

# generate_nav_map()

old_rows = None

def request_nav_items():
    inav_map = view_helper.find_object("inav_map")
    if not inav_map:
        print("INAV map not found, cannot generate markers")
        return
    inav_map = inav_map[1]  # Assuming we get a list of objects, take the first one
    center = inav_map.property("center")
    base_lat = center.latitude()
    base_lon = center.longitude()

    base_lat = round(base_lat / 0.05) * 0.05
    base_lon = round(base_lon / 0.1) * 0.1    

    markerModel.clear()

    new_rows = SortedDict()
    for lat in np.arange(base_lat - 0.5, base_lat + 0.5, 0.05):
        for lon in np.arange(base_lon - 0.7, base_lon + 0.7, 0.1):
            key = f"{lat:.2f}{lon:.2f}"
            if key in nav_map:
                item_lat, item_lon, name = nav_map[key] 
                # markerModel.addMarker(item_lat, item_lon, name)   
                coordinate = QGeoCoordinate(item_lat, item_lon)
                new_rows[name] = {'position': coordinate, 'name': name}
                # new_rows.append({'position': coordinate, 'name': name})

    markerModel.replace_rows(new_rows)


async def inav_test():
    while True: 
        request_nav_items()
        await asyncio.sleep(1)


async def main():
    try:
        sane_tasks.spawn(process_qt_events())    

        web_interface.run_server_task("0.0.0.0", s.WEB_INTERFACE_PORT)

        # replace suscribe values
        xp.set_subscribe_params(params_to_subscribe.to_subscribe)

        # sane_tasks.spawn(inav_test())

        await xp.xp_master_udp.connect(
            s.XP_MASTER_HOST, s.XP_MASTER_UDP_PORT, on_new_xp_data_udp, on_data_exception_udp, listen_port=s.UDP_LOCAL_PORT
        )
        await xp.xp_master.connect_until_success(s.XP_MASTER_HOST, s.XP_MASTER_PORT, on_new_xp_data, on_data_exception)

        xp.param_subscriber.run_subsriber_task()
        xp.udp_param_subscriber.run_subsriber_task()

        sane_tasks.spawn(param_overrides.param_overrides_auto_disable_task())    

        await udp_2_mouse.run_receive_2_mouse_task(s.MOUSE_RECEIVE_HOST, s.MOUSE_RECEIVE_PORT, blue_border_mouse_update)

        await app_close_event.wait()
        # asyncio.create_task(test_qml())
    except asyncio.exceptions.CancelledError:
        pass

async def process_qt_events():
    while app_close_event.is_set() is False:
        app.processEvents()
        await asyncio.sleep(0.02)


def quit():
    screen_control.restore_brightness()
    app.quit()


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    manager.update_screen_sizes()
    manager.Watcher.update()

    cas.create_cas_objects()

    screen_control.create_black_screens()

    app_close_event = asyncio.Event()
    app.aboutToQuit.connect(app_close_event.set)
    
    asyncio.run(main())
