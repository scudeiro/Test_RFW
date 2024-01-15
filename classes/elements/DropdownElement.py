#!/usr/bin/env python
# -*- coding: utf-8 -*-

from OSQuayLib.bin.BaseElement import BaseElement

#TOREVIEW
class DropdownElement(BaseElement):
    XPATH = "//div[@id='drop_{id_area}_Categories']"
    PREDICATE = "//span[contains(text(),'{id_text}')]"
    EDIT = "//input"
    SEARCH = "//div[@name='{id_name}']//input[contains(@class,'search-input')]"
    SELECTED = "//span[@data-tooltip='{id_category}']"  #TOREVIEW
    OPTION = "//div[contains(@role,'option')]"  #TOREVIEW
    CLEAN = "//div[@data-tooltip='Clear']//i"  #TOREVIEW
    CLOSED = "//div[@aria-expanded='false']"  #TOREVIEW

    def __init__(self, area, category=None, xpath=None, id=None, idx=None):
        super().__init__(xpath=[xpath, self.XPATH.format(id_area=area)][xpath is None], id=id, idx=idx)
        self.area = area
        self.category = category
        self.xedit = f"{self.xid}{self.EDIT}"
        self.search = self.SEARCH
        self.selected = f"{self.SELECTED.format(id_category=category)}"
        self.clean = f"{self.xid}{self.CLEAN}"
        self.option = f"{self.OPTION}{self.PREDICATE.format(id_text=category)}"
        self.closed = f"{self.xid}{self.CLOSED}"

    def get_dropdown_locator(self):
        """
        Returns the locator of the pretended dropdown.
        """
        # Tag: DONE
        # Owner: Joana Ferreira
        return self.xid

    def clean_selection(self):
        """
        Clicks in the 'x' button to reset the option in the dropdown.
        """
        # Tag: DONE
        # Owner: Joana Ferreira
        self._run("Click", self.clean)

    def searching(self):
        """
        Clicks on the dropdown of the referred area and selects the pretended category.
        """
        # Tag: DONE
        # Owner: Joana Ferreira
        self.sl.click_element(self.xid)
        id_name = self.sl.get_element_attribute(self.xedit, "name")
        self.bi.sleep(0.5)
        self._run("Input", self.search.format(id_name=id_name), self.category)
        self._run("Click", self.option)

    def get_option(self):
        """
        Returns the locator of the option selected in the dropdown.
        """
        # Tag: TOREVIEW
        # Owner: Joana Ferreira
        return self.selected

    def select(self):
        """
        Returns the locator of the pretended option of the dropdown.
        """
        # Tag: TOREVIEW
        # Owner: Joana Ferreira
        return self.option





