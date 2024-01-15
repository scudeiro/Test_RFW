*** Settings ***
Documentation    *Description:* Testes Cases of Clubs Articles Details Page
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
ART-CDE-01-a) - Clubs Details page Scroll (Employee)
    [Documentation]     *Title:* ART-CDE-01-a) - Clubs Details page Scroll (Employee)
    ...
    ...    *Description*:
    ...    Verify correct behavior of scroll of news details page using red arrow.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "Employee1" User
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Access "ClubsArticle01" Details Page
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "Clubs" Details Page
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-CDE-01-b) - Clubs Details page Scroll (Admin)
    [Documentation]     *Title:* ART-CDE-01-b) - Clubs Details page Scroll (Admin)
    ...
    ...    *Description*:
    ...    Verify correct behavior of scroll of news details page using red arrow.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system
    ...
    [Tags]    DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "Admin1" User
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Access "ClubsArticle01" Details Page
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "Clubs" Details Page
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-CDE-01-c) - Clubs Details page Scroll (TeamManager)
    [Documentation]     *Title:* ART-CDE-01-c) - Clubs Details page Scroll (TeamManager)
    ...
    ...    *Description*:
    ...    Verify correct behavior of scroll of news details page using red arrow.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system
    ...
    [Tags]    DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "Manager1" User
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Access "ClubsArticle01" Details Page
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "Clubs" Details Page
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-CDE-01-d) - Clubs Details page Scroll (HRSalaryManager)
    [Documentation]     *Title:* ART-CDE-01-d) - Clubs Details page Scroll (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Verify correct behavior of scroll of news details page using red arrow.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system
    ...
    [Tags]    DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "SalaryAdmin1" User
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Access "ClubsArticle01" Details Page
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "Clubs" Details Page
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

