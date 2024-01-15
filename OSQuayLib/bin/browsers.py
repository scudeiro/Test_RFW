from selenium.webdriver import FirefoxProfile, FirefoxOptions, ChromeOptions

# https://peter.sh/experiments/chromium-command-line-switches/
# https://developer.mozilla.org/en-US/docs/Mozilla/Firefox/Headless_mode
# https://cs.chromium.org/chromium/src/chrome/common/pref_names.cc


class _BrowserProfile(object):
    def __init__(self, browser='Chrome', download=None, download_folder='default', headless=False, fullscreen=False, private=False, quiet=False, devtools=False):
        MIME = {
               'zip'       : ['application/x-rar-compressed', 'application/octet-stream,', 'application/zip', 'application/x-zip-compressed', 'multipart/x-zip', 'application/x-tar', ' application/x-7z-compressed'],
               'pdf'       : ['application/epub+zip', 'application/pdf'],
               'text'      : ['text/plain', 'text/html', 'text/css', 'text/javascript', 'application/json', 'application/rtf', 'application/xml'],
               'imge'      : ['image/gif', 'image/png', 'image/jpeg', 'image/bmp', 'image/webp', 'image/x-icon', 'image/vnd.microsoft.icon', 'image/svg+xml'],
               'audio'     : ['audio/midi', 'audio/x-midi', 'audio/mpeg', 'audio/webm', 'audio/ogg', 'audio/wav', 'audio/wave', 'audio/x-wav', 'audio/x-pn-wav', 'audio/3gpp', 'audio/3gpp2'],
               'video'     : ['video/webm',' video/ogg', 'video/x-msvideo', 'video/mpeg', 'video/3gpp', 'video/3gpp2'],
               'multipart' : ['multipart/form-data', 'multipart/byteranges'],
               'office'    : ['application/msword', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', 'application/vnd.visio',
                              'application/vnd.ms-powerpoint', 'application/vnd.openxmlformats-officedocument.presentationml.presentation',
                              'application/vnd.ms-excel', 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet']
               }
        FOLDER = {
                 'desktop'  : 0,
                 'default'  : 1,
                 'download' : 1,
                 }
        OPTIONS = {
                  'firefox' : FirefoxOptions(),
                  'chrome'  : ChromeOptions(),
                  }
        OPTIONS_CHROME = {
                         'default'    : ['--disable-infobars'],
                         'headless'   : ['--headless', '--disable-gpu'],
                         'fullscreen' : ['--start-fullscreen'],
                         'private'    : ['--incognito'],
                         'quiet'      : ['--disable-notifications'],
                         'devtools'   : ['--auto-open-devtools-for-tabs'],
                         }
        OPTIONS_FIREFOX = {
                          'default'    : None,
                          'headless'   : ['--headless'],
                          'fullscreen' : None,
                          'private'    : ['--private'],
                          'quiet'      : [("dom.webnotifications.enabled", False), ("geo.enabled", False)],
                          'devtools'   : ['-devtools'],
                          }

        self.browser = None
        self.profile = None
        self.options = None
        self.download_folder = None

        if not browser.lower() in OPTIONS:
            raise AssertionError("ERROR! Browser '%s' not supported." % browser)
        self.browser = browser
        self.options = OPTIONS[browser.lower()]
        if self.browser.lower() == 'firefox':
            self.profile = FirefoxProfile()

        browser_options = [OPTIONS_FIREFOX, OPTIONS_CHROME][self.browser.lower() == 'chrome']
        for key, values in browser_options.items():
            if values is None: continue
            if key == 'default' :
                [self.options.add_argument(value) for value in values]
            else:
                evaluated_key = eval(key)
                if not isinstance(evaluated_key, bool) : evaluated_key = eval(evaluated_key)
                if evaluated_key:
                    [self.options.add_argument(value) for value in values if not isinstance(value, tuple)]
                    [self.profile.set_preference(value[0], value[1]) for value in values if isinstance(value, tuple)]

        if download is not None:
            if self.browser.lower() == 'firefox':
                if download_folder.lower() in FOLDER:
                    folderlist = FOLDER[download_folder.lower()]
                else:
                    folderlist = 2
                    self.download_folder = download_folder.replace('/', '\\')
                    self.profile.set_preference("browser.download.dir", self.download_folder)
                self.profile.set_preference("browser.download.folderList", folderlist)
            else:
                chrome_dict = dict({"download.prompt_for_download": False, "safebrowsing.enabled": True})
                if download_folder is not None and download_folder.lower() not in FOLDER:
                    self.download_folder = download_folder
                    chrome_dict["download.default_directory"] = self.download_folder
                    chrome_dict["download.directory_upgrade"] = True

            if self.browser.lower() == 'firefox':
                if not download.lower() in MIME:
                    download = 'text'
                apps = ', '.join(MIME[download.lower()])
                self.profile.set_preference("browser.helperApps.neverAsk.saveToDisk", apps)
                # self.profile.set_preference("browser.helperApps.neverAsk.openFile", prefs)
                self.profile.set_preference("browser.helperApps.alwaysAsk.force", False)
                self.profile.set_preference("browser.download.manager.alertOnEXEOpen", False)
                # self.profile.set_preference("browser.download.manager.showWhenStarting", False)
                # self.profile.set_preference("browser.download.manager.focusWhenStarting", False)
                # self.profile.set_preference("browser.download.manager.closeWhenDone", True)
                # self.profile.set_preference("browser.download.manager.showAlertOnComplete", False)
            else:
                self.options.add_experimental_option("prefs", chrome_dict)


class Browser(_BrowserProfile):
    def __init__(self, url, browser='Chrome', download=None, download_folder='default', headless=False, fullscreen=False, private=False, quiet=False, devtools=False):
        super(Browser, self).__init__(browser=browser, download=download, download_folder=download_folder, headless=headless, fullscreen=fullscreen, private=private, quiet=quiet, devtools=devtools)
        self.url = url
        self.name = self.browser
        del self.browser
