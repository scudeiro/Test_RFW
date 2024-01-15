#!/usr/bin/env python
# -*- coding: utf-8 -*-

from classes.data.App import App


dev = App(url="https://hrportaldev.iohub.pt/HRPR_TH/Login",
          browser="Chrome",
          initial_page="Login",
          language='EN',
          version='1.0',
          maximize=True,
          fullscreen=False,
          timeout='10',
          download_folder=r'C:\Users\admin\Downloads',
          download=None,
          download_timeout=300,
          devtools=False,
          headless=False,
          quiet=False,
          private=False)

