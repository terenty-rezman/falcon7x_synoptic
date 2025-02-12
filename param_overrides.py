from typing import List

from falcon7x_core.xplane.params import Params


enabled_overrides = set()


def enable_param_overrides(params_list: List[str]):
    global enabled_overrides
    params_list = [Params[p] for p in params_list]
    enabled_overrides |= set(params_list)


def disable_param_overrides(params_list: List[str]):
    global enabled_overrides
    params_list = [Params[p] for p in params_list]
    enabled_overrides -= set(params_list)
