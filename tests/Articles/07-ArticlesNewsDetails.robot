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
