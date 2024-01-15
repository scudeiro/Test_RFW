#!/usr/bin/env python
# -*- coding: utf-8 -*-

class App(object):
    def __init__(self, url, browser, initial_page="Home", language='EN', version='',
                 download=None, download_folder="default", download_timeout=300,
                 maximize=False, fullscreen=False, headless=False, private=False, quiet=False, devtools=False, timeout='5'):
        self.url = url
        self.browser = browser.title()
        self.pageini = initial_page
        self.lang = language
        self.version = version
        self.maximize = maximize
        self.fullscreen = fullscreen
        self.timeout = timeout
        self.download = download
        self.download_folder = download_folder
        self.download_timeout = download_timeout
        self.headless = headless
        self.quiet = quiet
        self.devtools = devtools
        self.private = private
