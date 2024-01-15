#!/usr/bin/python
# -*- coding: UTF-8 -*-

from six import with_metaclass
from abc import ABCMeta
from collections.abc import Callable
from .base import *
from .keywords import Keywords
from .locatormap import LocatorMap as lmap
from robotlibcore import DynamicCore

__all__ = ['OM', "keyword", "not_keyword"]

class OM(DynamicCore, Base, Keywords):
    ROBOT_LIBRARY_SCOPE = "TEST"

    def __init__(self, mod=''):
        self._verify_mod_arg(mod)
        DynamicCore.__init__(self, [])
        Base.__init__(self)
        props = ['txt', 'id']
        for prop in props:
            setattr(self, f"{mod}{prop}", self._mapping(f"_{mod}{prop}"))
            setattr(self, f"get_{mod}{prop}", GetAttrFun(self, mod, prop))

    ## DEPRECATED ##
    # def run_keyword(self, name, args, kwargs):
    #     self.bi.log_to_console(f"xxx {name}")
    #     try:
    #         return DynamicCore.run_keyword(self, name, args, kwargs)
    #     except Exception:
    #         self.bi.log_to_console(f"error {name}")
    #         self.bi.run_keyword("Capture Page Screenshot")
    #         raise

    def __str__(self):
        return self.__class__.__name__

    @not_keyword
    def _verify_mod_arg(self, mod):
        if not isinstance(mod, str):
            self.log("error", "*OM*: mod parameter should be a string")
        if not len(mod):
            return
        if mod[0].isdigit():
            self.log("error", "*OM*: mod parameter cannot start with a integer")
        return

    @not_keyword
    def _mapping(self, varname="_id"):
        return lmap(getattr(self, varname, {}))

class GetAttrFun(Callable):
    def __init__(self, cls, mod, base):
        self.prop = eval(f"cls.{mod}{base}")
        self.cls = cls
        if base=='id':
            self.prop_txt = eval(f"cls.{mod}txt")
    def __call__(self, name, replace=None):
        if not isinstance(name, str):
            raise AssertionError("*GetAttrFun*: name parameter should be a string")
        value = None
        if not name in self.prop.keys():
            raise AssertionError(f"*GetAttrFun*: key '{name}' not in page id structure")
        value = self.prop[name]
        if not isinstance(value, str):
            return value
        if '{text}' in value:
            lang = self.cls.get_actual_language()
            if not name in self.prop_txt.keys():
                raise AssertionError(f"*GetAttrFun*: key '{name}' not in page txt structure")
            if not (lang in self.prop_txt[name].keys()):
                raise AssertionError(f"*GetAttrFun*: language '{lang}' not defined in item '{name}' in page txt structure")
            text = self.prop_txt[name][lang]
            value = value.format(text=text)
        if '{TEXT}' in value:
            if replace is None:
                raise AssertionError(f"Composed Locator '{value}' from '{name}' contains text to be replaced")
            value = value.format(TEXT=replace)
        return value
