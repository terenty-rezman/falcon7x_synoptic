import httpx
import settings as s
import falcon7x_core.common.sane_tasks as sane_tasks
import asyncio
import requests


async_client = httpx.AsyncClient()


async def _make_post_async(path, json: dict, host: str, port: int):
    try:
        url = f"http://{host}:{port}"
        await async_client.post(url + path, json=json)
    except httpx.HTTPError as e:
        print("momo Exception:", type(e).__name__, "–", e) 


def _make_post_sync(path, json: dict, host: str, port: int):
    return
    try:
        url = f"http://{host}:{port}"
        requests.post(url + path, json=json, timeout=0.1)
    except Exception as e:
        print("mumo Exception:", type(e).__name__, "–", e) 


async def _enable_boundrect(mouse_id, x, y, w, h, debug=0):
    json = {
        "mouse": mouse_id,
        "enable": 1,
        "draw": debug,
        "rectX": x,
        "rectY": y,
        "rectW": w,
        "rectH": h
    }

    await _make_post_async(
        "/boundrect", json, 
        s.MUMO_HOST,
        s.MUMO_PORT
    )


async def _disable_boundrect(mouse_id):
    json = {
        "mouse": mouse_id,
        "enable": 0,
        "draw": 0,
        "rectX": 0,
        "rectY": 0,
        "rectW": 0,
        "rectH": 0
    }

    await _make_post_async(
        "/boundrect", json, 
        s.MUMO_HOST,
        s.MUMO_PORT
    )


async def _ban_mouse(mouse_id):
    json = {
        "mouse": mouse_id,
        "ban": 1
    }

    await _make_post_async(
        "/boundrect", json, 
        s.MUMO_HOST,
        s.MUMO_PORT
    )


async def _unban_mouse(mouse_id):
    json = {
        "mouse": mouse_id,
        "ban": 0
    }

    await _make_post_async(
        "/boundrect", json, 
        s.MUMO_HOST,
        s.MUMO_PORT
    )


def enable_boundrect(mouse_id, x, y, w, h, debug=0):
    return asyncio.create_task(_enable_boundrect(mouse_id, x, y, w, h, debug))


def disable_boundrect(mouse_id):
    return asyncio.create_task(_disable_boundrect(mouse_id))


def ban_mouse(mouse_id):
    return asyncio.create_task(_ban_mouse(mouse_id))


def unban_mouse(mouse_id):
    return asyncio.create_task(_unban_mouse(mouse_id))
