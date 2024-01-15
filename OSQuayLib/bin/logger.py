#!/usr/bin/python
# -*- coding: UTF-8 -*-

from robot.api.logger import trace, debug, info, warn, error, console
from robot.api.deco import not_keyword

class Logger(object):
    msgs = {
           "TRACE"   : trace,
           "DEBUG"   : debug,
           "INFO"    : info,
           "WARN"    : warn,
           "ERROR"   : error,
           "CONSOLE" : console,
           }

    @not_keyword
    def log(self, category, msg):
        if not isinstance(category, str):
            raise AssertionError("*Logger*: category parameter should be a string")
        if not isinstance(msg, str):
            raise AssertionError("*Logger*: msg parameter should be a string")
        category = category.lower()
        try:
            fun = eval(category)
        except:
            raise AssertionError(f"*Logger*: category '{category}' do not exist!")
        if category == "error":
            raise AssertionError(msg)
        else:
            fun(f"->{msg}")
