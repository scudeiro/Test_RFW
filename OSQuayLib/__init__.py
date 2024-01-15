#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
##################################################
## OSQuay Test Automation Framework Library
##################################################
## OSQUAY CONFIDENTIAL
## [2021]  OSQuay, LDA
## All Rights Reserved.
##
## NOTICE:
## All information contained herein is, and remains the
## property of OSQuay and its suppliers, if any.
## The intellectual and technical concepts contained
## herein are proprietary to OSQuay and its suppliers and may be
## covered by PT and Foreign Patents, and are protected by
## trade secret or copyright law.
## Dissemination of this information or reproduction of this material
## is strictly forbidden unless prior written permission is obtained
## from OSQuay.
##################################################
## Author: Bruno Calado <bruno.calado@osquay.com>
## Copyright: 2021, AVV
## Version: 1.0.2
## Maintainer: Bruno Calado <bruno.calado@osquay.com>
##################################################
"""
from .bin.core import Core
from .version import __version__

class OSQuayLib(Core):
    ROBOT_LIBRARY_SCOPE = "SUITE"
    ROBOT_LIBRARY_VERSION = __version__


