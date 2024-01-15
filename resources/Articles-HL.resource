*** Settings ***
Resource    ML.resource
Resource    HL.resource

*** Keywords ***
## HOME PAGE ##
Search "${area}" Article With "${text}" Title
    [Documentation]    Search article by title.
    ...
    ...    *Description:*
    ...    Inputs the ``text`` in the search box for the defined ``area``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...    | text | Yes | Input text | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Search "News" Article With "Automation News 01" Title |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Search Article By Title    ${area}    ${text}

Select "${area}" Articles By "${category}" Category
    [Documentation]    Search article by category.
    ...
    ...    *Description:*
    ...    Selects the ``category`` option in the dropdown for the defined ``area``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...    | category | Yes | Category's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Select "News" Articles By "Procedures" Category |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Search Article By Category    ${area}    ${category}

Verify "${area}" Results With "${text}" In "${element}"
    [Documentation]    Verify searched results.
    ...
    ...    *Description:*
    ...    Checks the results of the search performed in the ``area`` by filtering the ``text`` in the ``element``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...    | text | Yes | Input text | <string> | N/A |
    ...    | element | Yes | Element's name | Title or Category | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify "News" Results With "Automation News 01" In "Title" |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Verify Searched Results    ${area}    ${text}    ${element}

Verify No "${area}" Results Displayed
    [Documentation]    Verify no results displayed.
    ...
    ...    *Description:*
    ...    Checks no results displayed for the pretended ``area``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify No "News" Results Displayed |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    No Results Displayed    ${area}
    Check Articles Displayed    ${area}    0
    Verify "${area}" List With Just One Page

Verify "${area}" List With Just One Page
    [Documentation]    Verify pagination area buttons disabled.
    ...
    ...    *Description:*
    ...    Checks the status disabled for the pagination buttons for the pretended ``area``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify "News" List With Just One Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Check Button Status    ${area}   Next    disabled
    Check Button Status    ${area}   First    disabled
    Check Button Status    ${area}   Previous    disabled
    Check Button Status    ${area}   Last    disabled

Verify "${area}" List On "${page}" Page
    [Documentation]    Checks the articles displayed on the pretended area.
    ...
    ...    *Description:*
    ...    Verifies the articles displayed in the pretended ``page`` for the pretended ``area``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | <string> | N/A |
    ...    | page | Yes | Page location | First, Last | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify "News" List On "First" Page |
    ...    | Verify "News" List On "Last" Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Verify Page List Displayed    ${area}    ${page}

Scroll "${area}" Articles Using "${button}" Button
    [Documentation]    Checks the changed of the articles displayed using the defined button.
    ...
    ...    *Description:*
    ...    Navigates thru the articles list of the ``area``, using the ``button`` and verifies the change of the
    ...    articles displayed.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | <string> | N/A |
    ...    | button | Yes | Button's name | Next, Previous, Last, First | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Scroll "News" Articles Using "Next" Button |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Go To List Page    ${area}    ${button}

Save Displayed "${area}" Articles Info
    [Documentation]    Save information of the first articles displayed.
    ...
    ...    *Description:*
    ...    Saves the information of the first articles shown in the defined ``area``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Save Displayed "News" Articles Info |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Save First Articles   ${area}

Unselect "${area}" Filter
    [Documentation]    Clear the filter of the category.
    ...
    ...    *Description:*
    ...    Clears the selection of category dropdown in the defined ``area``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Unselect "News" Filter |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Clear Category Filter   ${area}

Verify Displayed "${area}" Articles Info
    [Documentation]    Verify the articles displayed are the same as before the search.
    ...
    ...    *Description:*
    ...    Checks if the articles displayed in the defined ``area`` are the same as before the search.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify Displayed "News" Articles Info |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Check First Articles   ${area}

Display "${area}" "${state}" Articles
    [Documentation]    Selects the articles state for filter the articles displaed in the pretended area.
    ...
    ...    *Description:*
    ...    Selectes the ``state`` filter to displayed articles in the pretended ``area``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...    | state | Yes | Article's state | Active, Inactive | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Display "News" "Active" Articles |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Select State    ${area}    ${state}

Verify "${company}" Company Displayed
    [Documentation]    Verifies the company displayed in the page is the pretended one.
    ...
    ...    *Description:*
    ...    Checks if the ``company`` is displayed on the right corner of the home page header.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | company | Yes | Company's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify "OSQuay" Company Displayed |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Check Company View    ${company}

Change Home Page View To "${company}" Company
    [Documentation]    Changes company view in the Home page.
    ...
    ...    *Description:*
    ...    Changes to ``company`` view on the right corner of the home page header.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | company | Yes | Company's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Change Home Page View To "IT Up Portugal" Company |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Change Company View    ${company}
    Check Company View    ${company}

Update Inactive Article Code
    [Documentation]    Updates the code of an inactive article.
    ...
    ...    *Description:*
    ...    Edits the inactive ``article`` of the pretended ``area`` and updates his code.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Update Inactive Article Code    ${article}    ${area} |
    ...
    # Owner: Joana Ferreira
    [Tags]    TOREVIEW
    [Arguments]    ${article}    ${area}
    Login As "Admin1" User
    Select State    ${area}    "Inactive"
    ${article_value}=    Get Variable Value    ${${article}}
    Search Article By Title    ${area}    ${article_value.title}
    Edit Inactive Article    ${article}    ${area}
    Logout


## DETAILS PAGE ##

Access "${article}" Details Page
    [Documentation]    Access article details page.
    ...
    ...    *Description:*
    ...    Navigates to the ``article``'s details page and verifies the breadcrumbs diplayed.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Access "newsArticle01" Details Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Navigate To Article Details Page    ${article}
    Verify Details BreadCrumbs    ${article}

Verify Displayed "${article}" Article On Position "${position}" At Details Page
    [Documentation]    Checks the article data in the details page.
    ...
    ...    *Description:*
    ...    Verifies the ``article`` information, in the defined ``position``, diplayed on the Details page.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...    | position | Yes | Article's position | <integer> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify Displayed "NewsArticle01" Article On Position "1" At Details Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Verify Article Displayed    ${article}    ${position}

Change "${article}" Article State To "${state}"
    [Documentation]    Change the article state in the details page.
    ...
    ...    *Description:*
    ...    Changes the ``article`` state for the pretended ``state`` on the Details page.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...    | state | Yes | Article's state | Active, Inactive | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Change "newsArticle01" Article State To "Active" |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Change Article State    ${article}    ${state}

Delete "${article}" Article At Details Page
    [Documentation]    Deletes the article in the details page.
    ...
    ...    *Description:*
    ...    Deletes the ``article`` on the Details page.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Delete "newsArticle01" Article At Details Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Delete Article    ${article}
    Clean "${article}" Article Code

Verify "${article}" Not Displayed In Details Page
    [Documentation]    Verify that the article is not displayed in the details page.
    ...
    ...    *Description:*
    ...    Verifies that the ``article`` is not displayed on the Details page.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify "newsArticle01" Not Displayed In Details Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Article Not Displayed    ${article}

Navigate To Home Page And Verify "${user}" Logged In
    [Documentation]    Navigates to home page and verifies the user logged in.
    ...
    ...    *Description:*
    ...    Goes to the home page using the logo link in the details page and verifies the ``user`` logged in.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | user | Yes | user's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Navigate To Home Page And Verify "Employee1" Logged In |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Navigate Home Page
    User Logged In Should Be    ${user}

Display Last Article At Details Page
    [Documentation]    Scroll to the last article displayed in the details page.
    ...
    ...    *Description:*
    ...    Scroll to the last article displayed in the details page.
    ...
    ...    *Input Arguments:*
    ...    | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Display Last Article At Details Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Scroll To Last Article

Display Top Of "${area}" Details Page
    [Documentation]    Scroll to the top of the details page using red arrow.
    ...
    ...    *Description:*
    ...    Scroll to the top of the details page of the defined ``area`` using the red arrow displayed on the bottom
    ...    right of the page.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Display Top Of "News" Details Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Return To Top Details Page   ${area}

Search Article With "${text}" Title At Details Page
    [Documentation]    Search article by title.
    ...
    ...    *Description:*
    ...    Inputs the ``text`` in the search box in the Details page.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | text | Yes | Input text | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Search Article With "Automation News 01" Title At Details Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Search Detail Article By Title    ${text}

Verify Results With "${text}" In "${element}" At Details Page
    [Documentation]    Verify searched results in Details Page.
    ...
    ...    *Description:*
    ...    Checks the results of the search performed by filtering the ``text`` in the ``element`` in Details page.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | text | Yes | Input text | <string> | N/A |
    ...    | element | Yes | Element's name | Title or Category | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify Results With "Automation News 01" In "Title" At Details Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Verify Detail Searched Results    ${text}    ${element}

Verify No Results Displayed At Details Page
    [Documentation]    Verify no results displayed in Details Page.
    ...
    ...    *Description:*
    ...    Checks no results displayed message and no article displayed in Details Page.
    ...
    ...    *Input Arguments:*
    ...    | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify No Results Displayed At Details Page |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    No Detail Results Displayed
    Check No Detail Articles Displayed


## USING HRPortalAPI

Create "${article}" Article In "${area}"
    [Documentation]    Creates an article in the pretended area.
    ...
    ...    *Description:*
    ...    Creates the ``article`` in the defined ``area``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs or Career | N/A |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Create "NewsArticleInactive" Article In "News" |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    TOREVIEW
    Add Article   ${area}
    Input Article Data    ${article}
    Create Article

Update "${category}" Category
    [Documentation]    Changes Category Owner thru API.
    ...
    ...    *Description:*
    ...    Updates ``category`` properties thru API using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | category | Yes | Category's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Update "CategoryProceduresOwner" Category |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    ${article_id}=    Change Category Properties By Api    ${${category}}


## SETUPS

Create "${article}" Article
    [Documentation]    Creates article thru API.
    ...
    ...    *Description:*
    ...    Creates an ``article`` thru API using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Create "NewsArticle01" Article |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    ${article_id}=    Set Article By Api    ${${article}}

Create Several "${area}" Articles
    [Documentation]    Creates several articles thru API for the pretended area.
    ...
    ...    *Description:*
    ...    Creates a list of articles for defined ``area`` thru API using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs, Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Create Several "News" Articles |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    ${articles}=    Create List    ${${area}Article01}    ${${area}Article02}    ${${area}Article03}    ${${area}Article04}    ${${area}Article05}    ${${area}Article06}
    FOR    ${article}    IN    @{articles}
        Set Article By Api    ${article}
    END

Update "${category}" And Create "${article}" Article
    [Documentation]    Changes Category Owner and creates article thru API.
    ...
    ...    *Description:*
    ...    Updates ``category`` properties and creates an ``article`` thru API using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | category | Yes | Category's name | <string> | N/A |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Update "CategoryProceduresOwner" And Create "NewsArticle01" Article |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Create "${article}" Article
    Update "${category}" Category

Update "${category}" And Create Several "${area}" Articles
    [Documentation]    Changes Category Owner and creates several articles thru API.
    ...
    ...    *Description:*
    ...    Updates ``category`` properties and creates several articles for the ``area`` thru API, using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | category | Yes | Category's name | <string> | N/A |
    ...    | area | Yes | Area's name | News, Clubs, Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Update "CategoryProceduresOwner" And Create Several "News" Articles |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Create Several "${area}" Articles
    Update "${category}" Category

## TEARDOWNS

Delete "${article}" Article
    [Documentation]    Deletes article through API.
    ...
    ...    *Description:*
    ...    Deletes an ``article`` through API using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Delete "NewsArticle01" Article |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Run Keyword If    '${TEST STATUS}'=='FAIL'    Logout
    ${article_id}=    Delete Article By Api    ${${article}}

Delete Several "${area}" Articles
    [Documentation]    Deletes several articles through API.
    ...
    ...    *Description:*
    ...    Deletes a list of articles for the defined ``area`` through API using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | area | Yes | Area's name | News, Clubs, Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Delete Several "News" Articles |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Run Keyword If    '${TEST STATUS}'=='FAIL'    Logout
    ${articles}=    Create List    ${${area}Article01}    ${${area}Article02}    ${${area}Article03}    ${${area}Article04}    ${${area}Article05}    ${${area}Article06}
    FOR    ${article}    IN    @{articles}
        Delete Article By Api    ${article}
    END

Clean "${article}" Article Code
    [Documentation]    Deletes article through API.
    ...
    ...    *Description:*
    ...    Deletes an ``article`` through API using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Delete "NewsArticle01" Article |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    ${article_value}=    Get Variable Value    ${${article}}
    ${article_value.code}=    Set Variable    0

Update "${category}" And Delete "${article}" Article
    [Documentation]    Changes Category properties and deletes article thru API.
    ...
    ...    *Description:*
    ...    Updates ``category`` properties and deletes an ``article`` thru API using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | category | Yes | Category's name | <string> | N/A |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Update "CategoryProcedures" And Delete "NewsArticle01" Article |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Update "${category}" Category
    Delete "${article}" Article

Update "${category}" And Delete Several "${area}" Articles
    [Documentation]    Changes Category properties and deletes several articles thru API.
    ...
    ...    *Description:*
    ...    Updates ``category`` properties and deletes several articles for the ``area`` thru API using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | category | Yes | Category's name | <string> | N/A |
    ...    | area | Yes | Area's name | News, Clubs, Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Update "CategoryIOHUBTalkSessions" And Delete Several "Career" Articles |
    ...
    # Owner: Elisabete Escudeiro
    [Tags]    DONE
    Update "${category}" Category
    Delete Several "${area}" Articles

Delete "${article}" Inactive Article In "${area}"
    [Documentation]    Deletes an inactive article through API.
    ...
    ...    *Description:*
    ...    Deletes an inactive ``article`` of a certain ``area`` through API using HRPortalAPI library.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...    | area | Yes | Area's name | News, Clubs, Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Delete "CareerArticleInactive" Inactive Article In "Career" |
    ...
    # Owner: Joana Ferreira
    [Tags]    TOREVIEW
    Run Keyword If    '${TEST STATUS}'=='FAIL'    Logout
    Update Inactive Article Code    ${article}    ${area}
    Delete "${article}" Article

Update "${category}" And Delete "${article}" Inactive Article In "${area}"
    [Documentation]    Deletes an inactive article thru API of a specific area and changes Category properties.
    ...
    ...    *Description:*
    ...    Updates ``category`` properties and deletes an inactive ``article`` thru API using HRPortalAPI library of a
    ...    specific ``area``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | category | Yes | Category's name | <string> | N/A |
    ...    | article | Yes | Article's name | <string> | N/A |
    ...    | area | Yes | Area's name | News, Clubs, Career | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Update "CategoryIOHUBTalkSessions" And Delete "CareerArticleInactive" Inactive Article In "Career" |
    ...
    # Owner: Joana Ferreira
    [Tags]    TOREVIEW
    Run Keyword If    '${TEST STATUS}'=='FAIL'    Logout
    Update "${category}" Category
    Update Inactive Article Code    ${article}    ${area}
    Delete "${article}" Article
