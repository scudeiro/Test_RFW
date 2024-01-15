from OSQuayLib.bin.pom import *
from NavHeader import NavHeader
from classes.elements.ArticleDetailElement import *

class ArticleDetails(Page, NavHeader):
    PAGE_TITLE = "Article"
    PAGE_URL   = ""

    def __init__(self):
        Page.__init__(self)
        NavHeader.__init__(self)

    _id = {
        "ref"                    : "id:inp_Article_Search",
        "breadcrumbs"            : "xpath:(//div[@data-block='Navigation.BreadcrumbsItem'])[{text}]",
        "title"                  : "id:exp_Article_Category",
        "deleted_notification"   : "xpath://div[text()='Article deleted successfully']",  #TOREVIEW
        "saved_notification"     : "xpath://div[text()='Article saved successfully']",  # TOREVIEW
        "published_notification" : "xpath://div[text()='Article published successfully']",  # TOREVIEW
        "IOHub_icon"             : "xpath:(//div[@data-block='Common.ApplicationTitle']//a[contains(@href,'Articles')])[2]", # TOREVIEW
        "arrow_up"               : "xpath://i[contains(@class,'arrow-up')]",  # TOREVIEW
        "footer"                 : "xpath://div[@class='footer']",  # TOREVIEW
         }

    _txt = {
        "breadcrumbs" : {'EN': "{TEXT}"},
            }

    @keyword('Verify Article Displayed')
    def verify_article_displayed(self, article, position):
        """ Verifies the article's displayed data.
        
        *Description:* Verifies the category, title, resume and description of the displayed ``article`` in the 
        pretended ``position``.
        
        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | article | Yes | article's reference | <string> | N/A |
        | position | Yes | article's position | <integer> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Verify Article Displayed    ${article}    ${position} |
        """
        # Owner: Joana Ferreira
        # Tag: DONE
        article = self.bi.get_variable_value(f"${{{article}}}")
        art_displayed = ArticleDetailElement(idx=position)
        self._run("Should be equal as strings", art_displayed.get_category(), article.category.name)
        self._run("Should be equal as strings", art_displayed.get_title(), article.title)
        self._run("Should be equal as strings", art_displayed.get_resume(), article.summary)
        self._run("Should be equal as strings", art_displayed.get_description(), article.description)

    @keyword('Verify Details BreadCrumbs')
    def verify_details_breadcrumbs(self, article):
        """ Verifies the breadcrumbs of the details page.

        *Description:* Verifies the main category and category of the pretended ``article`` in the breadcrumbs of the 
        details page.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | article | Yes | article's reference | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Verify Details BreadCrumbs    ${article} |
        """
        # Owner: Elisabete Escudeiro
        # Tag: DONE
        article = self.bi.get_variable_value(f"${{{article}}}")
        art_displayed = ArticleDetailElement(idx=1)
        art_displayed.is_displayed()
        home_page = self.sl.get_text(self.get_id("breadcrumbs", replace=1))
        self._run("Should be equal as strings", "Home", home_page)
        main_category = self.sl.get_text(self.get_id("breadcrumbs", replace=2))
        self._run("Should be equal as strings", main_category, article.main_category.name)
        if article.category.name != "News":
            category = self.sl.get_text(self.get_id("breadcrumbs", replace=3))
            self._run("Should be equal as strings", category, article.category.name)
        page_title = self.sl.get_text(self.get_id("title"))
        self._run("Should be equal as strings", page_title, article.category.name)

    @keyword('Delete Article')
    def delete_article(self, article):
        """ Deletes article in details page.

        *Description:*
        Deletes the referred ``article`` in details page and returns to home page.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | article | Yes | Article's name | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Delete Article    ${article} |
        | Delete Article    "newsArticle01" |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        art = ArticleDetailElement(idx=1)
        title = (self.bi.get_variable_value(f"${{{article}}}")).title
        self._run("Should be equal", (art.get_title()), title)
        art.delete_article()
        self._run("Wait", self.get_id("deleted_notification"))
        self.wait(self.get_id("deleted_notification"), mode="~visible")

    @keyword('Change Article State')
    def change_article_state(self, article, state):
        """ Change the article's state in the details page.

        *Description:*
        Change the ``state`` of the first ``article`` in the details page.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | article | Yes | Article's name | <string> | N/A |
        | state | Yes | Article's state | Active, Inactive | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Change Article State    ${article}    ${state} |
        | Change Article State    "newsArticle01"    "Active" |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        title = (self.bi.get_variable_value(f"${{{article}}}")).title
        art = ArticleDetailElement(idx=1)
        self._run("Should be equal", (art.get_title()), title)
        art.edit_article(state)
        art.change_state(state)
        if state == 'Inactive':
            art.save_article()
            self._run("Wait", self.get_id("saved_notification"))
            self.wait(self.get_id("saved_notification"), mode="~visible")
        else:
            art.publish_article()
            self._run("Wait", self.get_id("published_notification"))
            self.wait(self.get_id("published_notification"), mode="~visible")

    @keyword('Article Not Displayed')
    def article_not_displayed(self, article):
        """ Checks if an article is not displayed.

        *Description:*
        Verifies if the referred ``article`` is not displayed in detail's page.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | article | Yes | Article's name | <string> | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Article Not Displayed    ${article} |
        | Article Not Displayed    "newsArticle01" |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        title = (self.bi.get_variable_value(f"${{{article}}}")).title
        art = ArticleDetailElement(idx=1)
        art.is_displayed()
        self._run("Should not be equal", (art.get_title()), title)

    @keyword('Navigate Home Page')
    def navigate_home_page(self):
        """ Navigate to home page.

        *Description:*
        Click on IOHub icon and navigates to home page.

        *Input Arguments:*
        | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Navigate Home Page |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        self._run("Click", self.get_id("IOHub_icon"))

    @keyword('Scroll To Last Article')
    def scroll_to_last_article(self):
        """Scrolls to the last article.

        *Description:* Scrolls to the end of the detail's page to the last article.

        *Input Arguments:*
        | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Scroll To Last Article |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        article = ArticleDetailElement()
        number_articles = 0
        last_number_articles = article.get_count()
        while last_number_articles > number_articles:
            art = ArticleDetailElement(idx=last_number_articles)
            art.is_displayed()
            self.sl.scroll_element_into_view(art.get_locator())
            self.sl.execute_javascript("document.querySelector('.footer').scrollIntoView()")
            self.bi.sleep(2)
            number_articles = last_number_articles
            last_number_articles = article.get_count()

    @keyword('Return To Top Details Page')
    def return_to_top_details_page(self, area):
        """Returns to the top of the detail's page.

        *Description:* Clicks on the arrow and goes to the top of the page, and compares the text in the breadcrumbs if
        it belongs to the pretended ``area``.

        *Input Arguments:*
        | Argument | Mandatory | Summary | Values | Default |
        | area | Yes | Area's name | News, Clubs or Career | N/A |

        *Output Arguments:*
        | N/A |

        *Examples:*
        | Return To Top Details Page   ${area} |
        | Return To Top Details Page   "News" |
        """
        # Owner: Joana Ferreira
        # Tag: TOREVIEW
        self._run("Click", self.get_id("arrow_up"))
        self.bi.sleep(0.5)
        breadcrumb = self.get_id("breadcrumbs", replace="2")
        self._run("Wait", breadcrumb)
        self._run("Element Should Contain", breadcrumb, area)

