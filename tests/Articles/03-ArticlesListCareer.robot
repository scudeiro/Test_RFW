*** Settings ***
Documentation    *Description:* Testes Cases of Career Articles
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
ART-ACR-01-a) - Career Articles Filter by Title (Employee)
    [Documentation]     *Title:* ART-ACR-01-a) - Career Articles Filter by Title (Employee)
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
    [Setup]    Create "CareerArticle01" Article
    Login As "Employee1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-01-b) - Career Articles Filter by Title (Admin)
    [Documentation]     *Title:* ART-ACR-01-b) - Career Articles Filter by Title (Admin)
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
    [Setup]    Create "CareerArticle01" Article
    Login As "Admin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-01-c) - Career Articles Filter by Title (TeamManager)
    [Documentation]     *Title:* ART-ACR-01-c) - Career Articles Filter by Title (TeamManager)
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
    [Setup]    Create "CareerArticle01" Article
    Login As "Manager1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-01-d) - Career Articles Filter by Title (HRSalaryManager)
    [Documentation]     *Title:* ART-ACR-01-d) - Career Articles Filter by Title (HRSalaryManager)
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
    [Setup]    Create "CareerArticle01" Article
    Login As "SalaryAdmin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-02-a) - Career Articles Filter by Invalid Title (Employee)
    [Documentation]     *Title:* ART-ACR-02-a) - Career Articles Filter by Invalid Title (Employee)
    ...
    ...    *Description*:
    ...    Search not existing expression on Career article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "Employee1" User
    Search "Career" Article With "abcd" Title
    Verify No "Career" Results Displayed
    [Teardown]    Logout

ART-ACR-02-b) - Career Articles Filter by Invalid Title (Admin)
    [Documentation]     *Title:* ART-ACR-02-b) - Career Articles Filter by Invalid Title (Admin)
    ...
    ...    *Description*:
    ...    Search not existing expression on Career article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "Admin1" User
    Search "Career" Article With "abcd" Title
    Verify No "Career" Results Displayed
    [Teardown]    Logout

ART-ACR-02-c) - Career Articles Filter by Invalid Title (TeamManager)
    [Documentation]     *Title:* ART-ACR-02-c) - Career Articles Filter by Invalid Title (TeamManager)
    ...
    ...    *Description*:
    ...    Search not existing expression on Career article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "Manager1" User
    Search "Career" Article With "abcd" Title
    Verify No "Career" Results Displayed
    [Teardown]    Logout

ART-ACR-02-d) - Career Articles Filter by Invalid Title (HRSalaryManager)
    [Documentation]     *Title:* ART-ACR-02-d) - Career Articles Filter by Invalid Title (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Search not existing expression on Career article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "SalaryAdmin1" User
    Search "Career" Article With "abcd" Title
    Verify No "Career" Results Displayed
    [Teardown]    Logout

ART-ACR-03-a) - Career Articles Filter by Category (Employee)
    [Documentation]     *Title:* ART-ACR-03-a) - Career Articles Filter by Category (Employee)
    ...
    ...    *Description:*
    ...    Filter Career articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Career Article in "IOHUB Talk Sessions" category with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "CareerArticle01" Article
    Login As "Employee1" User
    Save Displayed "Career" Articles Info
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Unselect "Career" Filter
    Verify Displayed "Career" Articles Info
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-03-b) - Career Articles Filter by Category (Admin)
    [Documentation]     *Title:* ART-ACR-03-b) - Career Articles Filter by Category (Admin)
    ...
    ...    *Description:*
    ...    Filter Career articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Career Article in "IOHUB Talk Sessions" category with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "CareerArticle01" Article
    Login As "Admin1" User
    Save Displayed "Career" Articles Info
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Unselect "Career" Filter
    Verify Displayed "Career" Articles Info
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-03-c) - Career Articles Filter by Category (TeamManager)
    [Documentation]     *Title:* ART-ACR-03-c) - Career Articles Filter by Category (TeamManager)
    ...
    ...    *Description:*
    ...    Filter Career articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Career Article in "IOHUB Talk Sessions" category with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "CareerArticle01" Article
    Login As "Manager1" User
    Save Displayed "Career" Articles Info
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Unselect "Career" Filter
    Verify Displayed "Career" Articles Info
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-03-d) - Career Articles Filter by Category (HRSalaryManager)
    [Documentation]     *Title:* ART-ACR-03-d) - Career Articles Filter by Category (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Filter Career articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Career Article in "IOHUB Talk Sessions" category with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "CareerArticle01" Article
    Login As "SalaryAdmin1" User
    Save Displayed "Career" Articles Info
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Unselect "Career" Filter
    Verify Displayed "Career" Articles Info
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-04-a) - Career Articles Category Link (Employee)
    [Documentation]     *Title:* ART-ACR-04-a) - Career Articles Category Link (Employee)
    ...
    ...    *Description*:
    ...    Verify after clicking on the Career article is redirect to the article details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "CareerArticle01" Article
    Login As "Employee1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-04-b) - Career Articles Category Link (Admin)
    [Documentation]     *Title:* ART-ACR-04-b) - Career Articles Category Link (Admin)
    ...
    ...    *Description*:
    ...    Verify after clicking on the Career article is redirect to the article details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "CareerArticle01" Article
    Login As "Admin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-04-c) - Career Articles Category Link (TeamManager)
    [Documentation]     *Title:* ART-ACR-04-c) - Career Articles Category Link (TeamManager)
    ...
    ...    *Description*:
    ...    Verify after clicking on the Career article is redirect to the article details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "CareerArticle01" Article
    Login As "Manager1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-04-d) - Career Articles Category Link (HRSalaryManager)
    [Documentation]     *Title:* ART-ACR-04-d) - Career Articles Category Link (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Verify after clicking on the Career article is redirect to the article details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "CareerArticle01" Article
    Login As "SalaryAdmin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-05-a) - Career Articles Pagination Buttons (Employee)
    [Documentation]     *Title:* ART-ACR-05-a) - Career Articles Pagination Buttons (Employee)
    ...
    ...    *Description*:
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    6 Career Article in the system with "Automation Career 01", "Automation Career 02", "Automation Career 03",
    ...    "Automation Career 04", "Automation Career 05" and "Automation Career 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Career 01", "Automation Career 02", "Automation Career 03", "Automation Career 04",
    ...    "Automation Career 05" and "Automation Career 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Career" Articles
    Login As "Employee1" User
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Next" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "First" Button
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Last" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "Previous" Button
    Verify "Career" List On "First" Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-05-b) - Career Articles Pagination Buttons (Admin)
    [Documentation]     *Title:* ART-ACR-05-b) - Career Articles Pagination Buttons (Admin)
    ...
    ...    *Description*:
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    6 Career Article in the system with "Automation Career 01", "Automation Career 02", "Automation Career 03",
    ...    "Automation Career 04", "Automation Career 05" and "Automation Career 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Career 01", "Automation Career 02", "Automation Career 03", "Automation Career 04",
    ...    "Automation Career 05" and "Automation Career 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Career" Articles
    Login As "Admin1" User
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Next" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "First" Button
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Last" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "Previous" Button
    Verify "Career" List On "First" Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACR-05-c) - Career Articles Pagination Buttons (TeamManager)
    [Documentation]     *Title:* ART-ACR-05-c) - Career Articles Pagination Buttons (TeamManager)
    ...
    ...    *Description*:
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    6 Career Article in the system with "Automation Career 01", "Automation Career 02", "Automation Career 03",
    ...    "Automation Career 04", "Automation Career 05" and "Automation Career 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Career 01", "Automation Career 02", "Automation Career 03", "Automation Career 04",
    ...    "Automation Career 05" and "Automation Career 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Career" Articles
    Login As "Manager1" User
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Next" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "First" Button
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Last" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "Previous" Button
    Verify "Career" List On "First" Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACR-05-d) - Career Articles Pagination Buttons (HRSalaryManager)
    [Documentation]     *Title:* ART-ACR-05-d) - Career Articles Pagination Buttons (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    6 Career Article in the system with "Automation Career 01", "Automation Career 02", "Automation Career 03",
    ...    "Automation Career 04", "Automation Career 05" and "Automation Career 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Career 01", "Automation Career 02", "Automation Career 03", "Automation Career 04",
    ...    "Automation Career 05" and "Automation Career 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Career" Articles
    Login As "SalaryAdmin1" User
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Next" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "First" Button
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Last" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "Previous" Button
    Verify "Career" List On "First" Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACR-06-a) - Career Articles Pagination Buttons after Search With One Result (Employee)
    [Documentation]     *Title:* ART-ACR-06-a) - Career Articles Pagination Buttons after Search With One Result (Employee)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]   DONE
    [Setup]    Create "CareerArticle01" Article
    Login As "Employee1" User
    Verify "Career" List On "First" Page
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Verify "Career" List With Just One Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-06-b) - Career Articles Pagination Buttons after Search With One Result (Admin)
    [Documentation]     *Title:* ART-ACR-06-b) - Career Articles Pagination Buttons after Search With One Result (Admin)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "CareerArticle01" Article
    Login As "Admin1" User
    Verify "Career" List On "First" Page
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Verify "Career" List With Just One Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-06-c) - Career Articles Pagination Buttons after Search With One Result (TeamManager)
    [Documentation]     *Title:* ART-ACR-06-c) - Career Articles Pagination Buttons after Search With One Result (TeamManager)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]     Create "CareerArticle01" Article
    Login As "Manager1" User
    Verify "Career" List On "First" Page
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Verify "Career" List With Just One Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-06-d) - Career Articles Pagination Buttons after Search With One Result (HRSalaryManager)
    [Documentation]     *Title:* ART-ACR-06-d) - Career Articles Pagination Buttons after Search With One Result (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]      Create "CareerArticle01" Article
    Login As "SalaryAdmin1" User
    Verify "Career" List On "First" Page
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Verify "Career" List With Just One Page
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-07-a) - Career Articles Pagination Buttons after Search With Results in More Than One Page (Employee)
    [Documentation]     *Title:* ART-ACR-07-a) - Career Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (Employee)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    6 Career Article in "IOHUB Talk Sessions" Category in the system with "Automation Career 01", "Automation Career 02",
    ...    "Automation Career 03", "Automation Career 04", "Automation Career 05" and "Automation Career 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Career 01", "Automation Career 02", "Automation Career 03", "Automation Career 04",
    ...    "Automation Career 05" and "Automation Career 06" in title not in the system.
    ...
    [Tags]   DONE
    [Setup]    Create Several "Career" Articles
    Login As "Employee1" User
    Verify "Career" List On "First" Page
    Search "Career" Article With "Automation" Title
    Verify "Career" Results With "Automation" In "Title"
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Next" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "First" Button
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Last" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "Previous" Button
    Verify "Career" List On "First" Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACR-07-b) - Career Articles Pagination Buttons after Search With Results in More Than One Page (Admin)
    [Documentation]     *Title:* ART-ACR-07-b) - Career Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (Admin)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    6 Career Article in "IOHUB Talk Sessions" Category in the system with "Automation Career 01", "Automation Career 02",
    ...    "Automation Career 03", "Automation Career 04", "Automation Career 05" and "Automation Career 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Career 01", "Automation Career 02", "Automation Career 03", "Automation Career 04",
    ...    "Automation Career 05" and "Automation Career 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Career" Articles
    Login As "Admin1" User
    Verify "Career" List On "First" Page
    Search "Career" Article With "Automation" Title
    Verify "Career" Results With "Automation" In "Title"
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Next" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "First" Button
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Last" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "Previous" Button
    Verify "Career" List On "First" Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACR-07-c) - Career Articles Pagination Buttons after Search With Results in More Than One Page (TeamManager)
    [Documentation]     *Title:* ART-ACR-07-c) - Career Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (TeamManager)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    6 Career Article in "IOHUB Talk Sessions" Category in the system with "Automation Career 01", "Automation Career 02",
    ...    "Automation Career 03", "Automation Career 04", "Automation Career 05" and "Automation Career 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Career 01", "Automation Career 02", "Automation Career 03", "Automation Career 04",
    ...    "Automation Career 05" and "Automation Career 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]     Create Several "Career" Articles
    Login As "Manager1" User
    Verify "Career" List On "First" Page
    Search "Career" Article With "Automation" Title
    Verify "Career" Results With "Automation" In "Title"
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Next" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "First" Button
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Last" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "Previous" Button
    Verify "Career" List On "First" Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACR-07-d) - Career Articles Pagination Buttons after Search With Results in More Than One Page (HRSalaryManager)
    [Documentation]     *Title:* ART-ACR-07-d) - Career Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (HRSalaryManager)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    6 Career Article in "IOHUB Talk Sessions" Category in the system with "Automation Career 01", "Automation Career 02",
    ...    "Automation Career 03", "Automation Career 04", "Automation Career 05" and "Automation Career 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Career 01", "Automation Career 02", "Automation Career 03", "Automation Career 04",
    ...    "Automation Career 05" and "Automation Career 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]      Create Several "Career" Articles
    Login As "SalaryAdmin1" User
    Verify "Career" List On "First" Page
    Search "Career" Article With "Automation" Title
    Verify "Career" Results With "Automation" In "Title"
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Next" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "First" Button
    Verify "Career" List On "First" Page
    Scroll "Career" Articles Using "Last" Button
    Verify "Career" List On "Last" Page
    Scroll "Career" Articles Using "Previous" Button
    Verify "Career" List On "First" Page
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACR-08-a) - Company View Regarding Career Article Company (Employee)
    [Documentation]     *Title:* ART-ACR-08-a) - Company View Regarding Career Article Company (Employee)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Employee1" User
    Verify "Career" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "Career" Article With "Automation Career 01" Title
    Verify No "Career" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-08-b) -Company View Regarding Career Article Company (Admin)
    [Documentation]     *Title:* ART-ACR-08-b) - Company View Regarding Career Article Company (Admin)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Admin1" User
    Verify "Career" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "Career" Article With "Automation Career 01" Title
    Verify No "Career" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-08-c) - Company View Regarding Career Article Company (TeamManager)
    [Documentation]     *Title:* ART-ACR-08-c) - Company View Regarding Career Article Company (TeamManager)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed..
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Manager1" User
    Verify "Career" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "Career" Article With "Automation Career 01" Title
    Verify No "Career" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-08-d) - Company View Regarding Career Article Company (HRSalaryManager)
    [Documentation]     *Title:* ART-ACR-08-d) - Company View Regarding Career Article Company (HRSalaryManager)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "SalaryAdmin1" User
    Verify "Career" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "Career" Article With "Automation Career 01" Title
    Verify No "Career" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Logout
    [Teardown]    Delete "CareerArticle01" Article

ART-ACR-09-a) - Company View Regarding Career Category Company (Employee)
    [Documentation]     *Title:* ART-ACR-09-a) - Company View Regarding Career Category Company (Employee)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Employee1" User
    Verify "OSQuay" Company Displayed
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify No "Career" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Logout
    [Teardown]   Delete "CareerArticle01" Article

ART-ACR-09-b) -Company View Regarding Career Category Company (Admin)
    [Documentation]     *Title:* ART-ACR-09-b) - Company View Regarding Career Category Company (Admin)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Admin1" User
    Verify "OSQuay" Company Displayed
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify No "Career" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Logout
    [Teardown]   Delete "CareerArticle01" Article

ART-ACR-09-c) - Company View Regarding Career Category Company (TeamManager)
    [Documentation]     *Title:* ART-ACR-09-c) - Company View Regarding Career Category Company (TeamManager)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "Manager1" User
    Verify "OSQuay" Company Displayed
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify No "Career" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Logout
    [Teardown]   Delete "CareerArticle01" Article

ART-ACR-09-d) - Company View Regarding Career Category Company (HRSalaryManager)
    [Documentation]     *Title:* ART-ACR-09-d) - Company View Regarding Career Category Company (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Career 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "CareerArticle01" Article
    Login As "SalaryAdmin1" User
    Verify "OSQuay" Company Displayed
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify No "Career" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "Career" Articles By "IOHUB Talk Sessions" Category
    Verify "Career" Results With "IOHUB Talk Sessions" In "Category"
    Logout
    [Teardown]   Delete "CareerArticle01" Article

ART-ACR-10-e) - Inactivate Career Article (CareerOwner)
    [Documentation]     *Title:* ART-ACR-10-e) - Inactivate Career Article (CareerOwner)
    ...
    ...    *Description:*
    ...    Change to inactive state a Career Article, verifies the state change, change to active state and verifies the
    ...    state change.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role CareerOwner.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Employee with full name “Automation Employee1” not with role CareerOwner.
    ...    Article with “Automation Career 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Update "CategoryIOHUBTalkSessionsOwner" And Create Several "Career" Articles
    Login As "Employee1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Change "CareerArticle01" Article State To "Inactive"
    Verify "CareerArticle01" Not Displayed In Details Page
    Navigate To Home Page And Verify "Employee1" Logged In
    Search "Career" Article With "Automation Career 01" Title
    Verify No "Career" Results Displayed
    Display "Career" "Inactive" Articles
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Change "CareerArticle01" Article State To "Active"
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Navigate To Home Page And Verify "Employee1" Logged In
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Logout
    [Teardown]    Update "CategoryIOHUBTalkSessions" And Delete Several "Career" Articles

ART-ACR-10-f) - Inactivate Career Article (ArticlesManager)
    [Documentation]     *Title:* ART-ACR-10-f) - Inactivate Career Article (ArticlesManager)
    ...
    ...    *Description:*
    ...    Change to inactive state a Career Article, verifies the state change, change to active state and verifies the
    ...    state change.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ArticlesManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Article with “Automation Career 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Create Several "Career" Articles
    Login As "Admin1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Change "CareerArticle01" Article State To "Inactive"
    Verify "CareerArticle01" Not Displayed In Details Page
    Navigate To Home Page And Verify "Admin1" Logged In
    Search "Career" Article With "Automation Career 01" Title
    Verify No "Career" Results Displayed
    Display "Career" "Inactive" Articles
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Change "CareerArticle01" Article State To "Active"
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Navigate To Home Page And Verify "Admin1" Logged In
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Logout
    [Teardown]    Delete Several "Career" Articles

ART-ACR-11-e) - Delete a Career Article (CareerOwner)
    [Documentation]     *Title:* ART-ACR-11-e) - Delete a Career Article (CareerOwner)
    ...
    ...    *Description:*
    ...    Delete a Career Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role CareerOwner.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Employee with full name “Automation Employee1” not with role CareerOwner.
    ...    Article with “Automation Career 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Update "CategoryIOHUBTalkSessionsOwner" And Create "CareerArticle01" Article
    Login As "Employee1" User
    Search "Career" Article With "Automation Career 01" Title
    Verify "Career" Results With "Automation Career 01" In "Title"
    Access "CareerArticle01" Details Page
    Verify Displayed "CareerArticle01" Article On Position "1" At Details Page
    Delete "CareerArticle01" Article At Details Page
    Search "Career" Article With "Automation Career 01" Title
    Verify No "Career" Results Displayed
    Logout
    [Teardown]    Update "CategoryIOHUBTalkSessions" Category

ART-ACR-11-f) - Delete a Career Article (ArticlesManager)
    [Documentation]     *Title:* ART-ACR-11-f) - Delete a Career Article (ArticlesManager)
    ...
    ...    *Description:*
    ...    Delete a Career Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ArticlesManager.
    ...    1 Career Article with "Automation Career 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Article with “Automation Career 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Create "CareerArticle02" Article
    Login As "Admin1" User
    Search "Career" Article With "Automation Career 02" Title
    Verify "Career" Results With "Automation Career 02" In "Title"
    Access "CareerArticle02" Details Page
    Verify Displayed "CareerArticle02" Article On Position "1" At Details Page
    Delete "CareerArticle02" Article At Details Page
    Search "Career" Article With "Automation Career 02" Title
    Verify No "Career" Results Displayed
    [Teardown]    Logout

ART-ACR-12-e) - Create an Inactive Career Article (CareerOwner)
    [Documentation]     *Title:* ART-ACR-12-e) - Create an Inactive Career Article (CareerOwner)
    ...
    ...    *Description:*
    ...    Create an Inactive Career Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role CareerOwner.
    ...
    ...    *Post Conditions:*
    ...    Employee with full name “Automation Employee1” not with role CareerOwner.
    ...    Article with “Automation Career Inactive” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Update "CategoryIOHUBTalkSessionsOwner" Category
    Login As "Employee1" User
    Create "CareerArticleInactive" Article In "Career"
    Verify "Employee1" Logged In
    Search "Career" Article With "Automation Career Inactive" Title
    Verify No "Career" Results Displayed
    Display "Career" "Inactive" Articles
    Verify "Career" Results With "Automation Career Inactive" In "Title"
    Logout
    [Teardown]    Update "CategoryIOHUBTalkSessions" And Delete "CareerArticleInactive" Inactive Article In "Career"

ART-ACR-12-f) - Create an Inactive Career Article (ArticlesManager)
    [Documentation]     *Title:* ART-ACR-12-f) - Create an Inactive Career Article (ArticlesManager)
    ...
    ...    *Description:*
    ...    Create an Inactive Career Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ArticlesManager.
    ...
    ...    *Post Conditions:*
    ...    Article with “Automation Career Inactive” in title does not exist in the system.
    ...
    [Tags]   DONE
    Login As "Admin1" User
    Create "CareerArticleInactive" Article In "Career"
    Verify "Admin1" Logged In
    Search "Career" Article With "Automation Career Inactive" Title
    Verify No "Career" Results Displayed
    Display "Career" "Inactive" Articles
    Verify "Career" Results With "Automation Career Inactive" In "Title"
    Logout
    [Teardown]    Delete "CareerArticleInactive" Inactive Article In "Career"

