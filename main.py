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


def on_new_xp_data(type, dataref, value):
    data = {"data": {Params[dataref]: value}}

    backend.backend.set_data_http(data)
    screen_control.set_data_http_tcp(data)
    cas.set_regime_xp_data(data)


def on_data_exception(ex: Exception):
    print(traceback.format_exc())


def on_new_xp_data_udp(received_vals):
    backend.backend.set_data_http({"data": received_vals})
    # screen_control.set_data_http_udp({"data": received_vals})
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


async def blue_border_mouse_update():
    while True:
        # global_pos = QCursor.pos()  
        # backend.backend.updateMousePos.emit(global_pos.x(), global_pos.y(), 0, 0)

        backend.backend.updateMousePos.emit(
            udp_2_mouse.mouse_coords[0],
            udp_2_mouse.mouse_coords[1],
            udp_2_mouse.mouse_coords[2],
            udp_2_mouse.mouse_coords[3]
        )
        await asyncio.sleep(0.2)


async def window_manager_test():
    from window_manager.manager import screen_tiles, ScreenPosition, WindowTile

    await asyncio.sleep(2)
    screen_tiles[ScreenPosition.MDU_DOWN][1][0] = WindowTile.INAV
    manager.Watcher.update()

    await asyncio.sleep(2)
    screen_tiles[ScreenPosition.MDU_DOWN][0][0] = WindowTile.INAV
    manager.Watcher.update()

    await asyncio.sleep(2)
    screen_tiles[ScreenPosition.MDU_DOWN][1][0] = WindowTile.SYNOPTIC
    manager.Watcher.update()

    await asyncio.sleep(2)
    screen_tiles[ScreenPosition.MDU_DOWN][0][0] = WindowTile.SYNOPTIC
    manager.Watcher.update()


async def main():
    try:
        sane_tasks.spawn(blue_border_mouse_update())    

        web_interface.run_server_task("0.0.0.0", s.WEB_INTERFACE_PORT)

        # replace suscribe values
        xp.set_subscribe_params(params_to_subscribe.to_subscribe)

        await xp.xp_master_udp.connect(
            s.XP_MASTER_HOST, s.XP_MASTER_UDP_PORT, on_new_xp_data_udp, on_data_exception_udp, listen_port=s.UDP_LOCAL_PORT
        )
        await xp.xp_master.connect_until_success(s.XP_MASTER_HOST, s.XP_MASTER_PORT, on_new_xp_data, on_data_exception)

        xp.param_subscriber.run_subsriber_task()
        xp.udp_param_subscriber.run_subsriber_task()

        sane_tasks.spawn(param_overrides.param_overrides_auto_disable_task())    

        await udp_2_mouse.run_receive_2_mouse_task(s.MOUSE_RECEIVE_HOST, s.MOUSE_RECEIVE_PORT)

        # sane_tasks.spawn(window_manager_test())    

        await app_close_event.wait()
        # asyncio.create_task(test_qml())
    except asyncio.exceptions.CancelledError:
        pass


def quit():
    main_future.cancel()
    screen_control.restore_brightness()
    app.quit()


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)

    # mdu_down = view_helper.create_toplevel_qml_view(
    #     "components/mdu_down.qml", "mdu_down", "mdu - falcon7x",
    #     s.SYNOPTIC_WINDOW_WIDTH, s.PDU_WINDOW_HEIGHT, backend.backend
    # )
    
    # mdu_down.show()
    # view_helper.all_views.append(mdu_down)

    # mdu_up = view_helper.create_toplevel_qml_view(
    #     "components/mdu_up.qml", "mdu_up", "mdu - falcon7x",
    #     s.PDU_WINDOW_WIDTH, s.PDU_WINDOW_HEIGHT, backend.backend
    # )
    # mdu_up.show()
    # view_helper.all_views.append(mdu_up)

    # pdu_left = view_helper.create_toplevel_qml_view(
    #     "components/pdu_left.qml", "pdu_left", "pdu left - falcon7x", 
    #     s.PDU_WINDOW_WIDTH, s.PDU_WINDOW_HEIGHT, backend.backend
    # )
    # pdu_left.show()
    # view_helper.all_views.append(pdu_left)

    # pdu_right = view_helper.create_toplevel_qml_view(
    #     "components/pdu_right.qml", "pdu_right", "pdu right - falcon7x", 
    #     s.PDU_WINDOW_WIDTH, s.PDU_WINDOW_HEIGHT, backend.backend
    # )
    # pdu_right.show()
    # view_helper.all_views.append(pdu_right)

    manager.update_screen_sizes()
    manager.Watcher.update()

    cas.create_cas_objects()

    screen_control.create_black_screens()

    event_loop = QEventLoop(app)
    asyncio.set_event_loop(event_loop)

    app_close_event = asyncio.Event()
    app.aboutToQuit.connect(app_close_event.set)
    
    with event_loop:
        main_future = asyncio.Task(main())
        event_loop.run_until_complete(main_future)
