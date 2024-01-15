#!/usr/bin/env python
# -*- coding: utf-8 -*-

from OSQuayLib.bin.BaseElement import BaseElement


class ScrollElement(BaseElement):
    ID = "lnk_{id_category}_{id_button}"

    def __init__(self, category, button, idx=None):
        super().__init__(id=self.ID.format(id_category=category, id_button=button.capitalize()), idx=idx)
        self.category = category
        self.button = button

    def get_locator(self):
        """
        Returns the element's locator.
        """
        # Tag: DONE
        # Owner: Joana Ferreira
        return self.id

    def get_status(self):
        """
        Returns the element's status.
        """
        # Tag: DONE
        # Owner: Joana Ferreira
        attribute = self.sl.get_element_attribute(self.id, "disabled")
        status = ["enabled", "disabled"][attribute == 'true']
        return status

    def click_element(self):
        """
        Clicks on the element.
        """
        # Tag: DONE
        # Owner: Joana Ferreira
        self._run("Click", self.id)
