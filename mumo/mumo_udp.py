import asyncio
import traceback
import json

from falcon7x_core.common.aioudp import open_local_endpoint
import falcon7x_core.common.sane_tasks as sane_tasks
import mumo.mouse_state as mouse_state


receive_task = None


async def run_receive_2_mouse_task(uso_host, uso_receive_port, on_udp_callback):
    endpoint = await open_local_endpoint(host=uso_host, port=uso_receive_port)
    print(f"The UDP 2 MOUSE server is running on port {endpoint.address[1]}...")

    global receive_task
    receive_task = sane_tasks.spawn(receive_uso_task(endpoint, on_udp_callback))    


async def receive_uso_task(udp_endpoint, on_udp_callback):
    clear_uso_buffer = True

    while True:
        try:
            packet = None

            if clear_uso_buffer == True:
                # receive all datagrams and continue with the last one
                recv_count = 0
                while True:
                    try:
                        packet, (host, port) = udp_endpoint.receive_nowait()
                        recv_count += 1 
                    except asyncio.QueueEmpty:
                        break
            else:
                packet, (host, port) = await udp_endpoint.receive()
            
            if packet is None:
                packet, (host, port) = await udp_endpoint.receive()

            str_packet = packet.decode("ascii")
            str_packet = str_packet[:-2]

            data = json.loads(str_packet)

            mouse_state.mouse_1.set_position(data["mouse1_x"], data["mouse1_y"])
            mouse_state.mouse_2.set_position(data["mouse2_x"], data["mouse2_y"])

            mouse_state.mouse_1.set_hidden(data["mouse1_hidden"])
            mouse_state.mouse_2.set_hidden(data["mouse2_hidden"])

            on_udp_callback()

            # print(data)

        except Exception as e:
            print(traceback.format_exc())
