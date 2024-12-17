import asyncio
from quart import Quart, request
from quart_schema import QuartSchema, validate_request, validate_response

from dataclasses import dataclass

from backend import backend


quart_task = None
app = Quart(__name__)

# fix bug KeyError: 'QUART_SCHEMA_CONVERT_CASING'
app.config["QUART_SCHEMA_CONVERT_CASING"] = None
app.config["QUART_SCHEMA_CONVERSION_PREFERENCE"] = None


@app.post("/api/set_data")
async def mfi_mouse_click():
    data = await request.json
    backend.set_data_http(data)
    return {"result": "ok"}


def run_server_task(listen_host, listen_port):
    global quart_task

    quart_task = app.run_task(host=listen_host, port=listen_port)
    quart_task = asyncio.create_task(quart_task)
