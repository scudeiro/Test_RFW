#!/usr/bin/env python
# -*- coding: utf-8 -*-

from OSQuayLib.bin.BaseElement import BaseElement


class ArticleDetailElement(BaseElement):
    XPATH = "//div[@data-block='Blocks.ArticleDetail_Block']"
    TITLE = "//span[contains(@id,'Title')]"
    CATEGORY = "//span[contains(@id,'exp_Category')]"
    RESUME = "//span[contains(@id,'exp_Resume')]"
    DESCRIPTION = "//span[contains(@id,'exp_Description')]"
    IMAGE = "//img"
    DELETE = "//i[contains(@class,'trash')]"  # TOREVIEW
    DELETE_BUTTON = "//button[contains(@id,'Accept')]"  # TOREVIEW
    EDIT = "//i[contains(@class, 'pencil')]"  # TOREVIEW
    CHECKBOX_STATUS = "//div//label[text()='Active']//following-sibling::span//input"  # TOREVIEW
    SAVE = "//button[contains(text(),'Save')]"  # TOREVIEW
    PUBLISH = "//button[contains(text(),'Publish')]"  # TOREVIEW
    COMPANY_DROPDOWN = "//div[@class='articleDetailBlock']//div[@role='combobox']"
    COMPANY_SELECTED = "//div[@class='articleDetailBlock']//div[@role='combobox']//div[@class='vscomp-value']"
    COMPANY_OPTION = "//span[@class='vscomp-option-text'][normalize-space()='OSQuay']"

    def __init__(self, id=None, idx=None):
        super().__init__(xpath=self.XPATH, id=id, idx=idx)
        self.xpath = self.XPATH
        self.title = f"{self.xid}{self.TITLE}"
        self.category = f"{self.xid}{self.CATEGORY}"
        self.resume = f"{self.xid}{self.RESUME}"
        self.description = f"{self.xid}{self.DESCRIPTION}"
        self.image = f"{self.xid}{self.IMAGE}"
        self.delete = f"{self.xid}{self.DELETE}"  # TOREVIEW
        self.delete_button = self.DELETE_BUTTON  # TOREVIEW
        self.edit = self.EDIT  # TOREVIEW
        self.checkbox_status = self.CHECKBOX_STATUS  # TOREVIEW
        self.save = self.SAVE  # TOREVIEW
        self.publish = self.PUBLISH  # TOREVIEW
        self.selected_popup_company = self.COMPANY_SELECTED
        self.company_dropdown = self.COMPANY_DROPDOWN
        self.company_option = self.COMPANY_OPTION

    def get_count(self):
        """
        Returns the number of elements displayed in the page.
        """
        # Owner: Elisabete Escudeiro
        # Tag: DONE
        return self.sl.get_element_count(self.xid)

    def get_title(self):
        """
        Returns the text of the title element.
        """
        # Owner: Elisabete Escudeiro
        # Tag: DONE
        return self.sl.get_text(self.title)

    def get_category(self):
        """
        Returns the text of the category element.
        """
        # Owner: Elisabete Escudeiro
        # Tag: DONE
        return self.sl.get_text(self.category)

    def get_resume(self):
        """
        Returns the text of the resume element.
        """
        # Owner: Elisabete Escudeiro
        # Tag: DONE
        return self.sl.get_text(self.resume)

    def get_description(self):
        """
        Returns the text of the description element.
        """
        # Owner: Elisabete Escudeiro
        # Tag: DONE
        return self.sl.get_text(self.description)

    def is_displayed(self):
        """
        Waits until the image element is displayed in the page.
        """
        # Owner: Elisabete Escudeiro
        # Tag: DONE
        self.sl.wait_until_element_is_visible(self.image)

    def delete_article(self):
        """
        Deletes the first article displayed in detail's page.
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        self._run("Click", self.delete)
        self._run("Click", self.delete_button)

    def edit_article(self, state):
        """
        Click 'pencil' icon of the article to edit it.
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        self._run("Click", self.edit)
        self.bi.sleep(0.5)

    def change_state(self, state):
        """
        Click the 'Active' checkbox in the article's 'Edit' pop-up to change its status.
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        if state == "Inactive":
            self._run("Wait", self.publish)
            self._run("Click", self.checkbox_status)
            self._run("Wait", self.save)
        else:
            self._run("Wait", self.save)
            self._run("Click", self.checkbox_status)
            self._run("Wait", self.publish)

    def save_article(self):
        """
        Click 'Save' button of the article to save it.
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        self._run("Click", self.save)

    def publish_article(self):
        """
        Click 'Publish' button of the article to publish it.
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        self._run("Click", self.publish)

    def get_locator(self):
        """
        Returns the locator of the pretended article element of the details page.
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        return self.xid