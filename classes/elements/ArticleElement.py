#!/usr/bin/env python
# -*- coding: utf-8 -*-

from OSQuayLib.bin.BaseElement import BaseElement


class ArticleElement(BaseElement):
    XPATH = "//div[@id='{id_area}']//div[@data-block='Blocks.ArticleCard_Block']"
    TITLE = "//span[@class='heading5']"
    CATEGORY = "//span[contains(@id,'Category_Label')]"
    RESUME = "//span[contains(@id,'Article_Resume')]"
    IMAGE = "//img"

    def __init__(self, area, id=None, idx=None):
        super().__init__(xpath=self.XPATH.format(id_area=area), id=id, idx=idx)
        self.area = area
        self.title = f"{self.xid}{self.TITLE}"
        self.category = f"{self.xid}{self.CATEGORY}"
        self.resume = f"{self.xid}{self.RESUME}"
        self.image = f"{self.xid}{self.IMAGE}"

    def get_count(self):
        return self.sl.get_element_count(self.xid)

    def get_title(self):
        self.sl.wait_until_element_is_visible(self.image)
        return self.sl.get_text(self.title)

    def get_category(self):
        self.sl.wait_until_element_is_visible(self.image)
        return self.sl.get_text(self.category)

    def get_info_displayed(self):
        """
        Returns a dictionary with the title, category and resume of an article (art).
        """
        # Tag: TOREVIEW
        # Owner: Joana Ferreira
        self.sl.wait_until_element_is_enabled(self.image)
        title = self.sl.get_text(self.title)
        category = self.sl.get_text(self.category)
        resume = self.sl.get_text(self.resume)
        art = {"title"   : title,
               "category": category,
               "resume"  : resume,
               }
        return art

    def get_locator(self):
        """
        Returns the article's locator.
        """
        # Tag: TOREVIEW
        # Owner: Joana Ferreira
        return self.xid
