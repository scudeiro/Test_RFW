from OSQuayLib.bin.pom import *
from NavHeader import NavHeader
from classes.elements.ArticleElement import *
from classes.elements.ScrollElement import *
from classes.elements.DropdownElement import *


class Home(Page, NavHeader):
    PAGE_TITLE = "HomePage"
    PAGE_URL   = "/"

    def __init__(self):
        Page.__init__(self)
        NavHeader.__init__(self)
        self.initial_titles = []
        self.unique = []

    _id = {
        "ref"                : "xpath://img[@alt='Profile picture']",  ##TOREVIEW
        #"ref"                : "xpath://div[@data-block='Common.UserInfo_TraditionalView']//img",
        "page_title"         : "xpath://div[contains(@class,'page-title')]//span[text()='{text}']",
        "article_area"       : "xpath://div[@class='ThemeGrid_Width6']//span[text()='{text}']",
        "news_article"       : ArticleElement("News"),
        "clubs_article"      : ArticleElement("Clubs"),
        "career_article"     : ArticleElement("Career"),
        "updating"           : "//div[@class='list-updating']",
        "search_filter"      : "id:inp_{text}_Search",
        "no_results"         : "id:No{text}",
        "article_title"      : "xpath://div[@id='News']//div[contains(@class,'ArticleCard_Block')]//span[(@class='heading5') and (text()='{text}')]",
        "checkbox_state"     : "id:chk_{text}_Active",  # TOREVIEW
        "add_article"        : "xpath://a[contains(@id,'{text}_Add')]//i",  # TOREVIEW
        "popup_add_article"  : "xpath://div[@id='AddArticle']//div[contains(@class,'ArticleCard_Image')]//img",# TOREVIEW
        "popup-sub-category" : "xpath://label[text()='Sub-Category']//ancestor::div[contains(@class,'search')]",# TOREVIEW
        "popup-sub-option"   : "xpath:(//div[@role='option']//span[@data-tooltip='{text}'])[2]",  # TOREVIEW
        "popup_drop_company" : "xpath://div[contains(@id,'MultiSelectDrop')]",  # TOREVIEW
        "popup_drop_option"  : "xpath://span[@class='checkbox-icon']//following-sibling::span[@data-tooltip='{text}']", # TOREVIEW
        "popup_checkbox"     : "xpath://div//label[text()='Active']//following-sibling::span//input",  # TOREVIEW
        "popup_title"        : "xpath://input[contains(@aria-describedby,'Title')]",  # TOREVIEW
        "popup_summary"      : "xpath://input[contains(@aria-describedby,'Resume')]",  # TOREVIEW
        "popup_description"  : "xpath://textarea[contains(@id,'Description')]",  # TOREVIEW
        "article_save"       : "xpath://button[contains(text(),'Save')]",  # TOREVIEW
        "save_notification"  : "xpath://div[text()='Article saved successfully']",  # TOREVIEW
        "article_edit"       : "xpath://div[contains(@id,'{text}')]//i[contains(@class,'pencil')]",  # TOREVIEW
        "popup_article"      : "xpath://div[@class='articleDetailBlock']",  # TOREVIEW
        "close_popup"        : "xpath://a[contains(@id,'Popup_Close')]",  # TOREVIEW
           }

    _txt = {
        "page_title"       : {'EN': "Hi {text}!"},
        "article_area"     : {'EN': "{TEXT}"},
        "search_filter"    : {'EN': "{TEXT}"},
        "no_results"       : {'EN': "{TEXT}"},
        "article_title"    : {'EN': "{TEXT}"},
        "checkbox_state"   : {'EN': "{TEXT}"},  # TOREVIEW
        "add_article"      : {'EN': "{TEXT}"},  # TOREVIEW
        "popup_drop_option": {'EN': "{TEXT}"}, # TOREVIEW
        "popup-sub-option" : {'EN': "{TEXT}"},
        "article_edit"     : {'EN': "{TEXT}"},
           }

    @ keyword('User Logged In Should Be')
    def verify_user_logged_in(self, user):
        """ Verifies user is logged in.

        *Description:*
        Gets the user fullname, and waits until the greetings element with the fullname of the ``user`` appears on top
        of the home page.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | user | Yes | user's name | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | User Logged In Should Be    ${user} |
        | User Logged In Should Be    employee1 |
        """
        # Owner: Joana Ferreira
        # Tag: DONE
        user = self.bi.get_variable_value(f"${{{user}}}")
        self._run("Wait Until Element Is Visible", self.get_id("page_title").format(text=user.fullname))

    @ keyword('Search Article By Title')
    def search_article_tile(self, area, title):
        """ Search an article by the title.

        *Description:*
        Inputs in the search box of the ``area`` the pretended ``title``. Waits the page updated.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | area's name | <string> | N/A |
        | text | Yes | text | <string> | N/A |
        | title | Yes | article's title | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Search Article By Title    ${area}    ${text} |
        | Search Article By Title    News    News 1 |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        art = ArticleElement(area)
        self.sl.scroll_element_into_view(art.get_locator())
        self._run("Input", (self.get_id("search_filter", replace=area)), title)
        self.bi.sleep(0.5)
        count = self._run("Count Xpath", self.get_id("updating"))
        if count != 0:
            self._run("Wait", self.get_id("updating"), "~exist")

    @ keyword('Verify Searched Results')
    def verify_searched_results(self, area, text, element):
        """ Verifies the results of the performed search.

        *Description:*
        Checks if the displayed articles, in the ``area``, contains the ``text`` in the given ``element``.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | area's name | <string> | N/A |
        | text | Yes | text | <string> | N/A |
        | element | Yes | article's element | Title/Category | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Verify Searched Results    ${area}    ${text}    ${element} |
        | Verify Searched Results    News    News1    Title |
        """
        # Owner: Joana Ferreira
        # Tag: DONE
        count = self.get_id(f"{area.lower()}_article").get_count()
        if not count:
            raise AssertionError(f"No Article with '{text}' on '{element}' found!")
        for article in range(1, count + 1):
            art = ArticleElement(area, idx=article)
            displayed = [art.get_category(), art.get_title()][element.lower() == "title"]
            self._run("Should Contain", displayed, text)

    @keyword('No Results Displayed')
    def no_results_displayed(self, area):
        """ Verifies that no results are displayed.

        *Description:*
        Checks if there is no results displayed in the defined article's ``area``.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | area's name | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | No Results Displayed    ${area} |
        | No Results Displayed    News |
        """
        # Owner: Joana Ferreira
        # Tag: DONE
        self._run("Wait", self.get_id("no_results", replace=area), "exist")

    @keyword('Check Articles Displayed')
    def check_articles_displayed(self, area, number):
        """ Checks the number of articles displayed.

        *Description:*
        Checks the ``number`` of articles displayed in the defined article's ``area``.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | area's name | <string> | N/A |
        | number | Yes | article's number | <integer> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Check Articles Displayed    ${area}    0 |
        | Check Articles Displayed    News    0 |
        """
        # Owner: Joana Ferreira
        # Tag: DONE
        if not number.isdigit():
            raise AssertionError(f"Inputted '{number}' is not valid, please insert an integer!")
        count = self.get_id(f"{area.lower()}_article").get_count()
        self._run("Should Be Equal As Integers", count, number)

    @keyword('Check Button Status')
    def check_button_status(self, area, button, status):
        """ Checks the status of the button.

        *Description:*
        Checks the ``status`` of article's page ``button`` that navigates forward and backward in the defined article's
        ``area``.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | area's name | <string> | N/A |
        | button | Yes | article's button | next, previous, last or first | N/A |
        | status | Yes | element's status | enabled or disabled | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Check Button Status    ${area}   next    disabled |
        | Check Button Status    News    next     disabled |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        button = ScrollElement(area, button)
        self._run("Wait", button.get_locator())
        self._run("Should be equal as strings", button.get_status(), status)

    @keyword('Navigate To Article Details Page')
    def navigate_to_article_details_page(self, article):
        """ Navigate to article's details page.

        *Description:*
        Navigate to article's details page clicking on the title of the pretended ``article``.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | article | Yes | article's reference | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Navigate To Article Details Page    ${article} |
        | Navigate To Article Details Page    newsArticle01 |
        """
        # Owner: Joana Ferreira
        # Tag: DONE
        article = self.bi.get_variable_value(f"${{{article}}}")
        article_displayed = self.get_id(f"{article.main_category.name.lower()}_article")
        self.navigation(article_displayed.title, "ArticleDetails")

    @keyword('Verify Page List Displayed')
    def verify_page_list_displayed(self, area, page):
        """ Verifies the page list displayed.

        *Description:*
        Compares the status of the scroll buttons of a defined ``area`` accordingly with the ``page`` displayed.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | article's area | <string> | N/A |
        | page | Yes | page | <string> | N/A

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Verify Page List Displayed    ${area}    ${page} |
        | Verify Page List Displayed    News    Last |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        art = ArticleElement(area)
        self.sl.scroll_element_into_view(art.get_locator())
        if page.lower() == "first":
            self.check_button_status(area, "Previous", "disabled")
            self.check_button_status(area, "First", "disabled")
        else:
            self.check_button_status(area, "Next", "disabled")
            self.check_button_status(area, "Last", "disabled")

    @keyword('Go To List Page')
    def go_to_list_page(self, area, button):
        """ Goes to list page.

        *Description:*
        Gets the titles of the first articles displayed on the home page. Clicks on the ``button`` of the referred
        ``area`` and navigates through the articles list. And after the clicks gets the titles of the last articles
        displayed at the same page and compares if they are different of the first ones.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | article's area | <string> | N/A |
        | button | Yes | scroll button | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Go To List Page    ${area}    ${button} |
        | Go To List Page    News    Next |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        #unique = []
        rang = ArticleElement(area).get_count()
        while ScrollElement(area, button).get_status() == "enabled":
            titles = self._navigate_through_articles(area, rang, button)
            self._run("Click", ScrollElement(area, button).get_locator())
            count = self.sl.get_element_count(self.get_id("updating"))
            if count != 0:
                self.sl.wait_until_page_does_not_contain_element(self.get_id("updating"))
            last_titles = self._navigate_through_articles(area, rang, button)
            if button == "Next":
                self._run("Should be equal", titles[1:], last_titles[:-1])
            if button == "Previous":
                self._run("Should be equal", titles[:-1], last_titles[1:])
            elif button == "Last":
                self._run("Should be equal as strings", last_titles, self.unique[-4:])
            elif button == "First":
                self._run("Should be equal as strings", last_titles, self.unique[:4])

    @keyword('Search Article By Category')
    def search_articles_category(self, area, category):
        """ Search articles by category.

        *Description:*
        Search articles on the dropdown of the referred area by the pretended category.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | article's area | <string> | N/A |
        | category | Yes | article's category | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Search Articles By Category    ${area}    ${category} |
        | Search Articles By Category    News    Procedures |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        art = ArticleElement(area)
        self.sl.scroll_element_into_view(art.get_locator())
        dropdown = DropdownElement(area, category)
        self._run("Wait", dropdown.get_dropdown_locator())
        dropdown.searching()
        count = self.sl.get_element_count(self.get_id("updating"))
        if count != 0:
            self.sl.wait_until_page_does_not_contain_element(self.get_id("updating"))

    @keyword('Save First Articles')
    def save_first_articles(self, area):
        """ Save first articles.

        *Description:*
        Saves the first articles displayed in a list (initial_articles = []).

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | article's area | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Save First Articles    ${area} |
        | Save First Articles    News |
        """
        # Owner: Joana Ferreira
        # Tag: DONE
        rang = ArticleElement(area).get_count()
        titles = self._navigate_through_articles(area, rang)
        self.initial_titles = titles

    @keyword('Clear Category Filter')
    def clear_category_filters(self, area):
        """ Clear category dropdown filter.

        *Description:*
        Clicks in the 'x' button to reset the option in the dropdown of the referred area.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | article's area | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Clear Category Filter    ${area} |
        | Clear Category Filter    News |
        """
        # Owner: Joana Ferreira
        # Tag: DONE
        dropdown = DropdownElement(area)
        dropdown.clean_selection()
        count = self.sl.get_element_count(self.get_id("updating"))
        if count != 0:
            self.sl.wait_until_page_does_not_contain_element(self.get_id("updating"))

    @keyword('Check First Articles')
    def checks_first_articles(self, area):
        """ Checks the first articles displayed.

        *Description:*
        Checks if the articles displayed are the same that the first articles displayed of the referred area.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | article's area | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Checks First Articles    ${area} |
        | Checks First Articles    News |
        """
        # Owner: Joana Ferreira
        # Tag: DONE
        rang = ArticleElement(area).get_count()
        titles = self._navigate_through_articles(area, rang)
        self._run("Should be equal as strings", titles, self.initial_titles)

    @keyword('Add Article')
    def add_article(self, area):
        """ Add an article.

        *Description:*
        Opens the pop-up to add an article in the referred ``area``.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | article's area | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Add Article    ${area} |
        | Add Article    News |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        self._run("Click", self.get_id("add_article", replace=area))

    @keyword('Input Article Data')
    def input_article_data(self, article):
        """ Inputs the inactive article data.

        *Description:*
        Inserts the inactive article data in the supposed inputs such as Company(ies), Title, Summary and Description.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | article | Yes | Article's name | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Input Article Data    ${article} |
        | Input Article Data    NewsArticleInactive |
        """
        # Owner: Joana Ferreira
        # Tag: WORK
        article = self.bi.get_variable_value(f"${{{article}}}")
        self._run("Wait", self.get_id("popup_add_article"))
        count_subcategory = self._run("Get Element Count", (self.get_id("popup-sub-category")))
        if count_subcategory == 1:
            self._run("Click", self.get_id("popup-sub-category"))
            self.bi.sleep(1)
            self.sl.wait_until_element_is_enabled(self.get_id("popup-sub-option", replace=article.category.name))
            self._run("Click", self.get_id("popup-sub-option", replace=article.category.name))
        self._run("Wait", self.get_id("popup_drop_company"))
        self._run("Click", self.get_id("popup_drop_company"))
        self.bi.sleep(1)
        self.sl.wait_until_element_is_enabled(self.get_id("popup_drop_option", replace=article.companies[0].name))
        self._run("Click", self.get_id("popup_drop_option", replace=article.companies[0].name))
        self._run("Click", self.get_id("popup_checkbox"))
        self._run("Input", self.get_id("popup_title"), article.title)
        self._run("Input", self.get_id("popup_summary"), article.summary)
        self._run("Input", self.get_id("popup_description"), article.description)

    @keyword('Create Article')
    def create_article(self):
        """ Creates a new article in the Home page.

        *Description:*
        Clicks on the Publish button of the Add Article pop-up and waits for the published article notification appears
        on the Home page.

        *Input Arguments:*
        | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Create Article |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        self._run("Click", self.get_id("article_save"))
        self._run("Wait", self.get_id("save_notification"))

    @keyword('Edit Inactive Article')
    def edit_inactive_article(self, article, area):
        """ Edit an inactive article.

        *Description:*
        Edits the referred ``article`` of the pretended ``area`` and returns the article code.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | article | Yes | Article's name | <string> | N/A |
        | area | Yes | article's area | <string> | N/A |

        *Output Arguments:*
        | Argument | Summary | Values |
        | articles.code | article code | <integer> |

        *Examples:*
        | Edit Inactive Article    ${article}    ${area} |
        | Edit Inactive Article    CareerArticleInactive    Career |
        """
        # Tag: TOREVIEW
        # Owner: Joana Ferreira
        article = self.bi.get_variable_value(f"${{{article}}}")
        self._run("Wait", self.get_id("article_edit", replace=area))
        self._run("Click", self.get_id("article_edit", replace=area))
        article.code = self.sl.get_element_attribute(self.get_id("popup_article"), "data-id")
        self._run("Click", self.get_id("close_popup"))




 ### Private Keywords ###

    def _navigate_through_articles(self, area, articles, button=None):
        """ Navigates through articles.

        *Description:*
        Navigates through ``articles`` and add them to two separated lists, one list with all the articles (``unique``)
        of the respective ``area`` and another one that is returned with the articles that are displayed in that area.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | article's area | <string> | N/A |
        | unique | Yes | empty list | <dictionary list> | N/A |
        | articles | Yes | number of articles displayed | <integer> | N/A |

        *Output Arguments:*
         result = [{'title': 'AUTOMATION News JF 01', 'category': 'News', 'resume': 'Automation News 01 Resume'},
         {'title': 'Teste', 'category': 'News', 'resume': 'teste'},
         {'title': "2023 OSQuay's Performance Evaluation", 'category': 'News', 'resume': 'Performance review model,
         KPIs, Behaviors, 360 , Bonus'}, {'title': 'Testing email', 'category': 'Procedures', 'resume': 'test email'}]

        *Examples:*
        | unique = [] |
        | gamut = ArticleElement(area).get_count() |
        | self._navigate_through_articles("News", unique, gamut) |
        """
        # Tag: TOREVIEW
        # Owner: Joana Ferreira
        result = []
        for article in range(1, articles+1):
            info = ArticleElement(area, idx=article).get_info_displayed()
            result.append(info)
            if button == "Next":
                if self.unique.count(info) == 0:
                    self.unique.append(info)
        return result

    @keyword('Select State')
    def select_state(self, area, state):
        """ Select the article's state.

        *Description:*
        Select the article's ``state`` that will be displayed at the home page in the referred ``area``.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | article's area | <string> | N/A |
        | state | Yes | article's state | Active, Inactive | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Select State    ${area}    ${state} |
        | Select State    News    Active |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        if state == "Active":
            self.sl.checkbox_should_not_be_selected(self.get_id("checkbox_state", replace=area))
            self._click_checkbox(area)
        else:
            self.sl.checkbox_should_be_selected(self.get_id("checkbox_state", replace=area))
            self._click_checkbox(area)

    def _click_checkbox(self, area):
        """ Clicks in the state checkbox.

        *Description:*
        Clicks in the state checkbox and waits for the articles of the referred ``area`` appears.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | article's area | <string> | N/A |

        *Output Arguments:*
        N/A

        *Examples:*
        | self._clicks_checkbox("News") |
        | self._clicks_checkbox(area) |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        self._run("Click", self.get_id("checkbox_state", replace=area))
        self.bi.sleep(1)
