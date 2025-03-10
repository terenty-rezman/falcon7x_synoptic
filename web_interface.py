import asyncio
from quart import Quart, request
from quart_schema import QuartSchema, validate_request, validate_response

from dataclasses import dataclass

from backend import backend
import param_overrides
from falcon7x_core.xplane.params import Params


quart_task = None
app = Quart(__name__)

# fix bug KeyError: 'QUART_SCHEMA_CONVERT_CASING'
app.config["QUART_SCHEMA_CONVERT_CASING"] = None
app.config["QUART_SCHEMA_CONVERSION_PREFERENCE"] = None


@app.post("/api/set_data")
async def set_data():
    data = await request.json

    # transform string keys to Params keys
    data_ = data.get("data") or {}
    param_data = {}
    for p, v in data_.items():
        param_data[Params[p]] = v 
    
    overrides = data.get("overrides") or {}
    param_overrides = {}
    for p, v in overrides.items():
        param_overrides[Params[p]] = v

    backend.set_data_http({"data": param_data, "overrides": param_overrides})
    return {"result": "ok"}


@app.post("/api/enable_param_overrides")
async def enable_param_overrides():
    data = await request.json
    param_overrides.enable_param_overrides(data)
    return {"result": "ok"}


@app.post("/api/disable_param_overrides")
async def disable_param_overrides():
    data = await request.json
    param_overrides.disable_param_overrides(data)
    return {"result": "ok"}


def run_server_task(listen_host, listen_port):
    global quart_task

    quart_task = app.run_task(host=listen_host, port=listen_port)
    quart_task = asyncio.create_task(quart_task)

