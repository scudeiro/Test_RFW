#!/usr/bin/python
# -*- coding: UTF-8 -*-

from .om import *
from contextlib import contextmanager
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.expected_conditions import staleness_of

__all__= ['Page', "keyword", "not_keyword"]

class Page(OM):
    PAGE_URL = None
    PAGE_TITLE = None

    @not_keyword
    @contextmanager
    def _wait_for_ready(self, timeout=10):
        old_page = self.driver.find_element_by_tag_name('html')
        yield
        WebDriverWait(self.driver, timeout).until(staleness_of(old_page), message="Old page did not go stale within {seconds} sec".format(seconds=timeout))
        try:
            self.sl.wait_for_condition("return (document.readyState == 'complete')", timeout=timeout)
        except:
            self.log("error", "Web page was not loaded correctly!")

    @not_keyword
    def _change_myself(self, page_name, check_by='element'):
        me = self._get_page(page_name)
        me._is_current_page(check_by)
        old_order = self.bi.set_library_search_order()
        self.log("debug", f"Old libraries order: {old_order}")
        new_order = [str(me)] + [lib for lib in old_order if lib != str(me)]
        self.bi.set_library_search_order(*new_order)
        self.log("debug", f"New libraries order: {new_order}")
 
    @not_keyword
    def _get_page(self, page_name):
        try:
            page_obj = self.bi.get_library_instance(page_name)
            self.log("debug", f"Page '{page_name}' already imported")
        except RuntimeError:
            try:
                self.bi.import_library(page_name)
                page_obj = self.bi.get_library_instance(page_name)
            except RuntimeError as e:
                self.log("warn", f"Library '{page_name}' is not implemented!")
                raise ImportError(e)
            self.log("debug", f"Page '{page_name}' imported")
        return page_obj

    @not_keyword
    def _is_current_page(self, check_by='title'):
        search_in = False
        if check_by.lower()=='title':
            actual = self.sl.get_title()
            expected = self.PAGE_TITLE
        elif check_by.lower()=='url':
            actual = self.sl.get_location()
            expected = self.PAGE_URL
        else:
            search_in = True
        if search_in:
            try:
                locator = self.get_id("ref")
                self._run("Wait", locator, "exist")
            except AssertionError:
                self.log("error", f"Page reference locator '{locator}' to not exist in page")
        else:
            if actual != expected:
                self.log("error", f"Target page '{check_by}' expected to be '{expected}' but it was '{actual}'")

    @not_keyword
    def navigation(self, trigger, page_name):
        self.log("debug", f"Start navigation to '{page_name}' by '{trigger}'")
        self._run("Click", trigger)
        (old, new) = (self.PAGE_TITLE, page_name)
        self.log("info", f" Turning '{old}' to '{new}' Page")
        self._change_myself(page_name.replace(" ","").replace(".",""))
