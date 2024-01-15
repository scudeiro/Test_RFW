from OSQuayLib.bin.nom import *

class NavHeader(Navigator):
    NAV_TITLE = "Header Navigation"

    def __init__(self):
        Navigator.__init__(self, 'h')

    _hid = {
        "home_page_icon" : "//div[@data-block='Common.Menu']//img[@alt='IO Hub logo']",
        "user_area"      : "//div[contains(@data-block,'Common.UserInfo_V2')]",
        #"user_area"      : "//div[@data-block='Common.UserInfo_TraditionalView']//img",
        "logout"         : "//div[contains(@id,'employeeContainer')]//a[.='Logout']",
        #"logout"         : "//div[contains(@id,'Tooltip')]//span[text()='Logout']",
           }

    _htxt = {
           }

    @not_keyword
    def is_open(self):
        states = {"false" : False, "true" : True, None : False}
        expanded = self.sl.get_element_attribute(self.get_hid("user_area"), 'aria-expanded')
        return states[expanded]

    @keyword("Navigate By User Menu")
    def navigate_user_menu(self, navigation):
        state = self.is_open()
        if not state:
            self._run("Click", self.get_hid("user_area"))
            self.bi.sleep(0.3)
        if navigation.lower() == "logout":
            locator = self.get_hid("logout")
            page = "Login"
        self.navigation(locator, page)
