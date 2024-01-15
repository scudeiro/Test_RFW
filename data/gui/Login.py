from OSQuayLib.bin.pom import *

class Login(Page):
    PAGE_TITLE = "Login"
    PAGE_URL   = "/Login.aspx"

    def __init__(self):
        Page.__init__(self)

    _id = {
        "ref"        : "xpath://button",
        "userbox"    : "id:Input_UsernameVal",
        "passbox"    : "id:Input_PasswordVal",
           }

    @keyword("Login")
    def login(self, user):
        user = self.bi.get_variable_value(f"${{{user}}}")
        self._run("Input", self.get_id("userbox"), user.username)
        self._run("Input", self.get_id("passbox"), user.password)
        self.navigation(self.get_id("ref"), "Home")

