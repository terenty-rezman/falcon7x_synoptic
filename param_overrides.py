from typing import List
import asyncio
import time

from falcon7x_core.xplane.params import Params


enabled_overrides = set()
override_last_update_from_core = None


def enable_param_overrides(params_list: List[str]):
    global enabled_overrides
    global override_last_update_from_core
    params_list = [Params[p] for p in params_list]
    enabled_overrides |= set(params_list)

    override_last_update_from_core = time.time()


def disable_param_overrides(params_list: List[str]):
    global enabled_overrides
    params_list = [Params[p] for p in params_list]
    enabled_overrides -= set(params_list)


def disable_all_overrides():
    global enabled_overrides
    enabled_overrides.clear()


async def param_overrides_auto_disable_task():
    global override_last_update_from_core
    while True:
        await asyncio.sleep(3)
        if override_last_update_from_core is not None:
            elapsed = time.time() - override_last_update_from_core
            if elapsed > 3:
                disable_all_overrides()
                override_last_update_from_core = None
