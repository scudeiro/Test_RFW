*** Settings ***
Documentation    *Description:* Testes Cases of News Articles Details Page
     ...    *Version:* 1.0
Library           ../../OSQuayLib/
Library           HRPortalAPI.py    ${ENVIRONMENT}
Variables         data/test/data.py
Resource          resources/HL.resource
Resource          resources/Articles-HL.resource
Suite Setup       Start On Environment
Suite Teardown    Finish

*** Variables ***
${ENVIRONMENT}    dev

*** Test Cases ***
ART-AND-01-a) - News Details Page Scroll (Employee)
    [Documentation]     *Title:* ART-AND-01-a) - News Details Page Scroll (Employee)
    ...
    ...    *Description:*
    ...    Verify correct behavior of scroll of news details page using red arrow.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "NewsArticle01" Article
    Login As "Employee1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "News" Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-01-b) - News Details Page Scroll (Admin)
    [Documentation]     *Title:* ART-AND-01-b) - News Details Page Scroll (Admin)
    ...
    ...    *Description:*
    ...    Verify correct behavior of scroll of news details page using red arrow.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "NewsArticle01" Article
    Login As "Admin1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "News" Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-01-c) - News Details Page Scroll (TeamManager)
    [Documentation]     *Title:* ART-AND-01-c) - News Details Page Scroll (TeamManager)
    ...
    ...    *Description:*
    ...    Verify correct behavior of scroll of news details page using red arrow.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "NewsArticle01" Article
    Login As "Manager1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "News" Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-01-d) - News Details Page Scroll (HRSalaryManager)
    [Documentation]     *Title:* ART-AND-01-d) - News Details Page Scroll (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Verify correct behavior of scroll of news details page using red arrow.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "NewsArticle01" Article
    Login As "SalaryAdmin1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "News" Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-02-a) - Filter News by Title (Employee)
    [Documentation]     *Title:* ART-AND-02-a) - Filter News by Title (Employee)
    ...
    ...    *Description:*
    ...    Search news article by title in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "Employee1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Search Article With "Automation News 01" Title At Details Page
    Verify Results With "Automation News 01" In "Title" At Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-02-b) - Filter News by Title (Admin)
    [Documentation]     *Title:* ART-AND-02-b) - Filter News by Title (Admin)
    ...
    ...    *Description:*
    ...    Search news article by title in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "Admin1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Search Article With "Automation News 01" Title At Details Page
    Verify Results With "Automation News 01" In "Title" At Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-02-c) - Filter News by Title (TeamManager)
    [Documentation]     *Title:* ART-AND-02-c) - Filter News by Title (TeamManager)
    ...
    ...    *Description:*
    ...    Search news article by title in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "Manager1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Search Article With "Automation News 01" Title At Details Page
    Verify Results With "Automation News 01" In "Title" At Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-02-d) - Filter News by Title (HRSalaryManager)
    [Documentation]     *Title:* ART-AND-02-d) - Filter News by Title (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Search news article by title in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "SalaryAdmin1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Search Article With "Automation News 01" Title At Details Page
    Verify Results With "Automation News 01" In "Title" At Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-03-a) - Filter News by Invalid Title (Employee)
    [Documentation]     *Title:* ART-AND-03-a) - Filter News by Invalid Title (Employee)
    ...
    ...    *Description:*
    ...    Search not existing expression on article title and no result is shown in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "Employee1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Search Article With "abcd" Title At Details Page
    Verify No Results Displayed At Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-03-b) - Filter News by Invalid Title (Admin)
    [Documentation]     *Title:* ART-AND-03-b) - Filter News by Invalid Title (Admin)
    ...
    ...    *Description:*
    ...    Search not existing expression on article title and no result is shown in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "Admin1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Search Article With "abcd" Title At Details Page
    Verify No Results Displayed At Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-03-c) - Filter News by Invalid Title (TeamManager)
    [Documentation]     *Title:* ART-AND-03-c) - Filter News by Invalid Title (TeamManager)
    ...
    ...    *Description:*
    ...    Search not existing expression on article title and no result is shown in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "Manager1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Search Article With "abcd" Title At Details Page
    Verify No Results Displayed At Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-AND-03-d) - Filter News by Invalid Title (HRSalaryManager)
    [Documentation]     *Title:* ART-AND-03-d) - Filter News by Invalid Title (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Search not existing expression on article title and no result is shown in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "SalaryAdmin1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "NewsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Search Article With "abcd" Title At Details Page
    Verify No Results Displayed At Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

