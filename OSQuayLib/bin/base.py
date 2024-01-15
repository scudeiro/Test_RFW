#!/usr/bin/env python
# -*- coding: utf-8 -*-

from abc import ABCMeta
from six import with_metaclass
from robot.libraries.BuiltIn import BuiltIn
from robot.libraries.BuiltIn import RobotNotRunningError
from SeleniumLibrary.errors import NoOpenBrowser
from robot.api.deco import keyword, not_keyword
from .logger import Logger

__all__ = ['Base', "keyword", "not_keyword"]

class Base(with_metaclass(ABCMeta, Logger, object)):
    def __init__(self):
        self.bi = BuiltIn()

    @property
    def sl(self):
        try:
            lib = self.bi.get_library_instance("SeleniumLibrary")
        except RuntimeError:
            self.bi.import_library("SeleniumLibrary")
            lib = self.bi.get_library_instance("SeleniumLibrary")
        except RobotNotRunningError:
            from SeleniumLibrary import SeleniumLibrary
            lib = SeleniumLibrary()
        return lib

    @property
    def driver(self):
        try:
            driver = self.sl.driver
        except NoOpenBrowser:
            driver = None
        return driver

    @property
    def debug(self):
        try:
            lib = self.bi.get_library_instance("DebugLibrary")
        except RuntimeError:
            self.bi.import_library("DebugLibrary")
            lib = self.bi.get_library_instance("DebugLibrary")
        except RobotNotRunningError:
            from DebugLibrary import DebugLibrary
            lib = DebugLibrary()
        return lib

    @keyword("Breakpoint")
    def breakpoint(self):
        self.debug.debug()

    def _run(self, name, *args):
        try:
            return self.bi.run_keyword(name, *args)
        except Exception:
            self.bi.run_keyword("Capture Page Screenshot")
            raise
