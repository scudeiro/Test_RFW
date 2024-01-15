#!/usr/bin/env python
# -*- coding: utf-8 -*-

from robot.api.deco import keyword
import os
import time

class Keywords(object):

    @keyword('Click')
    def click(self, locator, timeout=5):
        timeout = self.bi.get_variable_value(f"${{ENV.timeout}}")
        self.sl.wait_until_element_is_visible(locator, timeout=str(timeout))
        self.sl.click_element(locator)

    @keyword('Input')
    def input(self, locator, txt, timeout=5):
        self.sl.wait_until_element_is_visible(locator, timeout=str(timeout))
        self.sl.input_text(locator, txt)

    @keyword('Check Page')
    def check_page(self):
        self._run("Wait Until Element Is Visible", self.get_id("title"))
        self._run("Wait Until Element Is Visible", self.get_id("subtitle"))

    @keyword('Show Page Title')
    def show_title(self):
        self.log("console", self.PAGE_TITLE)

    @keyword('Scroll To Element')
    def scroll_to_element(self, locator, position="center"):
        position = position.lower()
        if not position in ["top", "bottom", "center"]:
            self.log("error", "*scroll_to_element*: position is not valid")
        if position == "top":
            arg = ""
        elif position == "bottom":
            arg = "false"
        else:
            arg = "{block:'center'}"
        cmd = f"arguments[0].scrollIntoView({arg});"
        el = self.sl.get_webelement(locator)
        self.driver.execute_script(cmd, el)

    @keyword('Get Actual Language')
    def get_actual_language(self):
        return self.bi.get_variable_value("${LANG}")

    @keyword('Verify File Downloaded')
    def verify_file_downloaded(self, folder, file_name):
        timeout = self.bi.get_variable_value(f"${{ENV.download_timeout}}")
        poll_time = 1
        file = os.path.join(folder, file_name)
        curr_time = 0.0
        while not os.path.isfile(file) and curr_time <= timeout:
            time.sleep(poll_time)
            curr_time += poll_time
        if not os.path.isfile(file):
            self.log("error", f"File '{file_name}' not in the '{folder}' folder")
        size = 0
        curr_time = 0.0
        while not size and curr_time <= timeout:
            time.sleep(poll_time)
            size = os.stat(file).st_size
            curr_time += poll_time
        if not size:
            self.log("error", f"File '{file_name}' not downloaded in to the '{folder}' folder")

    @keyword('Flash Elements')
    def flash_elements(self, locator, all=True, n_blink=3):
        """
        Blinks the page elements that match the given locator for a number of times.

        Parameters
        ----------
        locator : str
            Element identifier
        all : bool, optional
            Sets if all elements should blink or just the first one found.
        n_blink : int, optional
            Is the number of blinks each locator will flash.

        Returns
        -------
        n_visible : int
            Number of visible elements
        n_hidden : int
            Number of hidden elements
        """
        changed_style = "background: {0}; border: {1}px solid {2};".format("red", 4, "yellow")
        strategies_all = {
            'id'          : self.driver.find_element_by_id,
            'name'        : self.driver.find_elements_by_name,
            'xpath'       : self.driver.find_elements_by_xpath,
            'link'        : self.driver.find_elements_by_link_text,
            'partial link': self.driver.find_elements_by_partial_link_text,
            'tag'         : self.driver.find_elements_by_tag_name,
            'class'       : self.driver.find_elements_by_class_name,
            'css'         : self.driver.find_elements_by_css_selector,
        }
        strategies_one = {
            'id'          : self.driver.find_element_by_id,
            'name'        : self.driver.find_element_by_name,
            'xpath'       : self.driver.find_element_by_xpath,
            'link'        : self.driver.find_element_by_link_text,
            'partial link': self.driver.find_element_by_partial_link_text,
            'tag'         : self.driver.find_element_by_tag_name,
            'class'       : self.driver.find_element_by_class_name,
            'css'         : self.driver.find_element_by_css_selector,
        }
        strategies = [strategies_one, strategies_all][all]
        ## Find locator
        (strategy, locator) = locator.split(':')
        elements = strategies[strategy](locator)
        if not isinstance(elements, list):
            elements = [elements]
        ## Blink locator
        n_visible = 0
        for element in elements:
            original_style = element.get_attribute('style')
            if element.is_displayed():
                n_visible = n_visible + 1
                for n in range(n_blink):
                    self.bi.sleep(.5)
                    self.driver.execute_script("arguments[0].setAttribute('style', arguments[1]);", element, changed_style)
                    self.bi.sleep(.5)
                    self.driver.execute_script("arguments[0].setAttribute('style', arguments[1]);", element, original_style)

        n_hidden = len(elements) - n_visible
        return (n_visible, n_hidden)

    @keyword('Wait')
    def wait(self, locator, mode="visible", timeout=15):
        """
        Waits until the state of the element identified by the `locator` corresponds to the given `mode`.

        Parameters
        ----------
        locator : str
            Element identifier
        mode : bool, optional
            String that indicates the state of the element to be waited for.
        timeout : int, optional
            Maxime time of waiting for the action to be performed.
        """
        # Owner: Elisabete Escudeiro
        # Tag: DONE
        if mode.lower() == "~visible":
            self.sl.wait_until_element_is_not_visible(locator, timeout=str(timeout))
        elif mode.lower() == "enabled":
            self.sl.wait_until_element_is_enabled(locator, timeout=str(timeout))
        elif mode.lower() == "~enabled":
            self.sl.wait_until_element_is_visible(locator, timeout=str(timeout))
            self.sl.element_attribute_value_should_be(locator, "disabled", "true")
        elif mode.lower() == "exist":
            self.sl.wait_until_page_contains_element(locator, timeout=str(timeout))
        elif mode.lower() == "~exist":
            self.sl.wait_until_page_does_not_contain_element(locator, timeout=str(timeout))
        else:
            self.sl.wait_until_element_is_visible(locator, timeout=str(timeout))

    @keyword('Get Element Text')
    def get_element_text(self, locator, timeout=10):
        """
        Waits for the element identified by the ``locator`` be visible and returns the text of the element.

        Parameters
        ----------
        locator : str
            Element identifier
        timeout : int, optional
            Maxime time of waiting for the action to be performed.

        Returns
        ----------
        text : str
            Text of the identified element.
        """
        # Owner: Elisabete Escudeiro
        # Tag: DONE
        self.sl.wait_until_element_is_visible(locator, timeout=str(timeout))
        return self.sl.get_text(locator)

    @keyword('Count Xpath')
    def count_xpath(self, locator):
        """
        Returns the number of elements identified by the ``locator`` displayed in the page.

        Parameters
        ----------
        locator : str
            Element identifier

        Returns
        ----------
        count : integer
            Number of elements identified by the ``locator``.
        """
        # Owner: Elisabete Escudeiro
        # Tag: DONE
        return self.sl.get_element_count(locator)

    '''
    
    @keyword('Wait Page To Change')
    def wait_page_to_change(self, status, locator_status="__OSVSTATE", timeout="5"):
        condition = f"return ( document.getElementById('{locator_status}').value != '{status}' )"
        self.sl.wait_for_condition(condition, timeout)

    @keyword('Get Page Status')
    def get_page_status(self, locator_status="__OSVSTATE"):
        return self.sl.get_element_attribute(locator_status, "value")
    
    @keyword('Click to Submit')
    def click_to_submit(self, locator, timeout=2):
        """
            *Wait until element is visible, clicks the element and then waits for the page to refresh*
            :param locator: Locator of the element.
            :param timeout: Timeout for the element to be visible.
            | Wait until element is visible for the length of the timeout |
            | Click on the element to submit |
        """
        self.sl.wait_until_element_is_visible(locator, timeout=str(timeout))
        with self._wait_for_page_refresh():
            self.sl.click_element(locator)

    @keyword('Click')
    def click(self, locator, timeout=10):
        """
            *Waits until element is visible and then clicks it*
            :param locator: Locator of the element.
            :param timeout: Timeout for the element to be visible.
            | Wait until element is visible for the length of the timeout |
            | Clicks the element |
        """
        self.sl.wait_until_element_is_visible(locator, timeout=str(timeout))
        self.sl.click_element(locator)

    @keyword('Wait')
    def wait(self, locator, timeout=10, type="visible"):
        """
            *Wait until the state of the element corresponds to the given type*
            :param locator: Locator of the element.
            :param timeout: Timeout for the element to be visible.
            :param type: String that indicates the state of the element to be waited for.
            | If the type is "~visible" it will wait until the element is not visible |
            | If the type is "enabled" it will wait until the element is enabled |
            | If the type is "~enabled" it will wait until the element is disabled or read-only |
            | If the type is "exist" it will wait until the page contains the element |
            | If the type is "~exist" it will wait until the page does not contains the element |
            | If the type is any other value it will wait until element is visible |
        """
        if type.lower() == "~visible":
            self.sl.wait_until_element_is_not_visible(locator, timeout=str(timeout))
        elif type.lower() == "enabled":
            self.sl.wait_until_element_is_enabled(locator, timeout=str(timeout))
        elif type.lower() == "~enabled":
            self.sl.wait_until_element_is_visible(locator, timeout=str(timeout))
            self.sl.element_should_be_disabled(locator)
        elif type.lower() == "exist":
            self.sl.wait_until_page_contains_element(locator, timeout=str(timeout))
        elif type.lower() == "~exist":
            self.sl.wait_until_page_does_not_contain_element(locator, timeout=str(timeout))
        else:
            self.sl.wait_until_element_is_visible(locator, timeout=str(timeout))

    @keyword('Wait Text Exist')
    def wait_text(self, text, timeout=10, type="exist"):
        """
            *Wait until text exists in the page or wait until text does not exist in the page*
            :param text: the text to be checked.
            :param timeout: Timeout for the element to be visible.
            :param type: String that indicates the state of the element to be waited for.
            | If the type is "~exist" it will wait until the page does not contain the element |
            | If the type is any other value it will wait until the page contains the element |
        """
        if type.lower() == "~exist":
            self.sl.wait_until_page_does_not_contain(text, timeout=str(timeout))
        else:
            self.sl.wait_until_page_contains(text.lower(), timeout=str(timeout))

    @keyword('Verify')
    def verify(self, locator, type="exist"):
        """
            *Verify if the page contains or does not contain the element*
            :param locator: Locator of the element.
            :param type: String that indicates the state of the element to be waited for.
            | If the type is "exist" it will wait until the page contains the element |
            | If the type is any other value it will wait until the page does not contain the element |
        """
        if type.lower() == "~exist":
            self.sl.page_should_not_contain_element(locator)
        else:
            self.sl.page_should_contain_element(locator)

    @keyword('Verify Text Element')
    def verify_text_element(self, locator, text, type="exist"):
        """
            *Check if the element contains or not the text*
            :param locator: element who should contain or not the text
            :param text: string object with the
            :param type: string object
        """
        if type.lower() == "~exist":
            self.sl.element_should_not_contain(locator, text)
        else:
            self.sl.element_should_contain(locator, text)

    @keyword('Wait Pop Up')
    def wait_pop_up(self, locator, timeout=10):
        """
            *Wait for the pop up to appear and then disappear from the screen.*
            :param locator: Locator of the pop up
            :param timeout: Timeout for the pop up appear and disappear
            | Wait until pop-up is visible |
            | Wait until pop-up is not visible |
        """
        self.sl.wait_until_element_is_visible(locator, timeout=str(timeout))
        self.sl.wait_until_element_is_not_visible(locator, timeout=str(timeout))

    @keyword('Count Xpath')
    def count_xpath(self, locator):
        """
            *Wait for the pop up to appear and then disappear from the screen.*
            :param locator: Locator of the element
            | get the count of many elements exists with that xpath |
            :return: integer
        """
        count = self.sl.get_element_count(locator)
        logger.debug("Number of xpath found: " + str(count))
        return count

    @keyword('Go To url')
    def go_to_url(self, url):
        """
        *Go to the informed url*
        :param url: informed url
        """
        self.sl.go_to(url)

    @keyword('Get URL')
    def get_url(self):
        """
        *Get the current url*
        :return: the current url as string
        """
        return self.sl.get_location()

    @keyword('Get Query ObjectID from URL')
    def get_query_objectid_from_url(self, url):
        """
        *Get the objectID in the end of the url in search query*
        :param url: url to get the ObjectID
        :return: the object ID
        """
        obj_id = url[-24:]
        return obj_id
    '''
