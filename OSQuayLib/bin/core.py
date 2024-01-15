#!/usr/bin/python
# -*- coding: UTF-8 -*-

import sys
from os.path import dirname, abspath, join
from .base import *
from .pom import Page
from .browsers import Browser

__all__= ['Core']

class Core(Base):
    def __init__(self):
        super().__init__()
        self.rootpath = None
        self._prepare_to_environnement()

    @not_keyword
    def _prepare_to_environnement(self):
        self.rootpath = abspath(join(dirname(__file__), "..", ".."))
        sys.path.insert(0, abspath(self.rootpath))
        sys.path.insert(0, join(self.rootpath, "data", "gui"))
        sys.path.insert(0, join(self.rootpath, "classes", "data"))
        sys.path.insert(0, join(self.rootpath, "classes", "elements"))
        sys.path.insert(0, join(self.rootpath, "classes", "libs"))

    @not_keyword
    def get_rfw_var_by_name(self, varname):
        return self.bi.get_variable_value(f"${{{varname}}}")

    @keyword("Start")
    def start(self, app_name, delay_for_redirect='0'):
       self.bi.set_library_search_order()  # Reset Library Order
       app = self.get_rfw_var_by_name(app_name)
       lang = self.bi.get_variable_value("${LANG}")
       if lang is None:
           lang = self.bi.set_global_variable("${LANG}", app.lang)
       browser = Browser(app.url, browser=app.browser, download=app.download,
                         download_folder=app.download_folder,
                         headless=app.headless, fullscreen=app.fullscreen, private=app.private, quiet=app.quiet,
                         devtools=app.devtools)
       if browser.name.lower() == 'firefox':
           self.sl.create_webdriver(browser.name, options=browser.options, firefox_profile=browser.profile)
       elif browser.name.lower() == 'chrome':
           self.sl.create_webdriver(browser.name, chrome_options=browser.options)
       if app.maximize:
           self.sl.maximize_browser_window()
       self.sl.go_to(browser.url)
       self.bi.sleep(delay_for_redirect)
       Page()._change_myself(app.pageini)
