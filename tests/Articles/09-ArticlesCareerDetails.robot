*** Settings ***
Documentation    *Description:* Testes Cases of Career Articles Details Page
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
ART-ACD-01-a) - Career Details page Scroll (Employee)
    [Documentation]     *Title:* ART-ACD-01-a) - Career Details page Scroll (Employee)
    ...
    ...    *Description*:
    ...    Search articles Career that has the input string in article title.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Career" Articles
    Login As "Employee1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "Career" Details Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACD-01-b) - Career Details page Scroll (Admin)
    [Documentation]     *Title:* ART-ACD-01-b) - Career Details page Scroll (Admin)
    ...
    ...    *Description*:
    ...    Search articles Career that has the input string in article title.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Career" Articles
    Login As "Admin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "Career" Details Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACD-01-c) - Career Details page Scroll (TeamManager)
    [Documentation]     *Title:* ART-ACD-01-c) - Career Details page Scroll (TeamManager)
    ...
    ...    *Description*:
    ...    Search articles Career that has the input string in article title.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Career" Articles
    Login As "Manager1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "Career" Details Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACD-01-d) - Career Details page Scroll (HRSalaryManager)
    [Documentation]     *Title:* ART-ACD-01-d) - Career Details page Scroll (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Search articles Career that has the input string in article title.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Career" Articles
    Login As "SalaryAdmin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Display Last Article At Details Page
    Display Top Of "Career" Details Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACD-02-a) - Filter Career by Title (Employee)
    [Documentation]     *Title:* ART-ACD-02-a) - Filter Career by Title (Employee)
    ...
    ...    *Description*:
    ...    Search career article by title in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Employee1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Search Article With "Automation Career 01" Title At Details Page
    Verify Results With "Automation Career 01" In "Title" At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACD-02-b) - Filter Career by Title (Admin)
    [Documentation]     *Title:* ART-ACD-02-b) - Filter Career by Title (Admin)
    ...
    ...    *Description*:
    ...    Search career article by title in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Admin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Search Article With "Automation Career 01" Title At Details Page
    Verify Results With "Automation Career 01" In "Title" At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACD-02-c) - Filter Career by Title (TeamManager)
    [Documentation]     *Title:* ART-ACD-02-c) - Filter Career by Title (TeamManager)
    ...
    ...    *Description*:
    ...    Search career article by title in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Manager1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Search Article With "Automation Career 01" Title At Details Page
    Verify Results With "Automation Career 01" In "Title" At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACD-02-d) - Filter Career by Title (HRSalaryManager)
    [Documentation]     *Title:* ART-ACD-02-d) - Filter Career by Title (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Search career article by title in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "SalaryAdmin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Search Article With "Automation Career 01" Title At Details Page
    Verify Results With "Automation Career 01" In "Title" At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACD-03-a) - Filter Career by Invalid Title (Employee)
    [Documentation]     *Title:* ART-ACD-03-a) - Filter Career by Invalid Title (Employee)
    ...
    ...    *Description*:
    ...    Search not existing expression on career article title and no result is shown in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Employee1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Search Article With "abcd" Title At Details Page
    Verify No Results Displayed At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACD-03-b) - Filter Career by Invalid Title (Admin)
    [Documentation]     *Title:* ART-ACD-03-b) - Filter Career by Invalid Title (Admin)
    ...
    ...    *Description*:
    ...    Search not existing expression on career article title and no result is shown in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Admin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Search Article With "abcd" Title At Details Page
    Verify No Results Displayed At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACD-03-c) - Filter Career by Invalid Title (TeamManager)
    [Documentation]     *Title:* ART-ACD-03-c) - Filter Career by Invalid Title (TeamManager)
    ...
    ...    *Description*:
    ...    Search not existing expression on career article title and no result is shown in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Manager1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Search Article With "abcd" Title At Details Page
    Verify No Results Displayed At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACD-03-d) - Filter Career by Invalid Title (HRSalaryManager)
    [Documentation]     *Title:* ART-ACD-03-d) - Filter Career by Invalid Title (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Search not existing expression on career article title and no result is shown in the details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "SalaryAdmin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Search Article With "abcd" Title At Details Page
    Verify No Results Displayed At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article
