*** Settings ***
Documentation    *Description:* Testes Cases of Clubs Articles
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
ART-ACL-01-a) - Clubs Articles Filter by Title (Employee)
    [Documentation]     *Title:* ART-ACL-01-a) - Clubs Articles Filter by Title (Employee)
    ...
    ...    *Description*:
    ...    Search articles Clubs that has the input string in article title.
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
    Logout
    [Teardown]    Delete "ClubsArticle01" Article


ART-ACL-01-b) - Clubs Articles Filter by Title (Admin)
    [Documentation]     *Title:* ART-ACL-01-b) - Clubs Articles Filter by Title (Admin)
    ...
    ...    *Description*:
    ...    Search articles Clubs that has the input string in article title.
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
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-01-c) - Clubs Articles Filter by Title (TeamManager)
    [Documentation]     *Title:* ART-ACL-01-c) - Clubs Articles Filter by Title (TeamManager)
    ...
    ...    *Description*:
    ...    Search articles Clubs that has the input string in article title.
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
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-01-d) - Clubs Articles Filter by Title (HRSalaryManager)
    [Documentation]     *Title:* ART-ACL-01-d) - Clubs Articles Filter by Title (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Search articles Clubs that has the input string in article title.
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
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-02-a) - Clubs Articles Filter by Invalid Title (Employee)
    [Documentation]     *Title:* ART-ACL-02-a) - Clubs Articles Filter by Invalid Title (Employee)
    ...
    ...    *Description*:
    ...    Search not existing expression on clubs article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "Employee1" User
    Search "Clubs" Article With "abcd" Title
    Verify No "Clubs" Results Displayed
    [Teardown]    Logout

ART-ACL-02-b) - Clubs Articles Filter by Invalid Title (Admin)
    [Documentation]     *Title:* ART-ACL-02-b) - Clubs Articles Filter by Invalid Title (Admin)
    ...
    ...    *Description*:
    ...    Search not existing expression on clubs article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "Admin1" User
    Search "Clubs" Article With "abcd" Title
    Verify No "Clubs" Results Displayed
    [Teardown]    Logout

ART-ACL-02-c) - Clubs Articles Filter by Invalid Title (TeamManager)
    [Documentation]     *Title:* ART-ACL-02-c) - Clubs Articles Filter by Invalid Title (TeamManager)
    ...
    ...    *Description*:
    ...    Search not existing expression on clubs article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "Manager1" User
    Search "Clubs" Article With "abcd" Title
    Verify No "Clubs" Results Displayed
    [Teardown]    Logout

ART-ACL-02-d) - Clubs Articles Filter by Invalid Title (HRSalaryManager)
    [Documentation]     *Title:* ART-ACL-02-d) - Clubs Articles Filter by Invalid Title (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Search not existing expression on clubs article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "SalaryAdmin1" User
    Search "Clubs" Article With "abcd" Title
    Verify No "Clubs" Results Displayed
    [Teardown]    Logout

ART-ACL-03-a) - Clubs Articles Filter by Category (Employee)
    [Documentation]     *Title:* ART-ACL-03-a) - Clubs Articles Filter by Category (Employee)
    ...
    ...    *Description:*
    ...    Filter Clubs articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Clubs Article in "Social Club" category with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "Employee1" User
    Save Displayed "Clubs" Articles Info
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Social Club" In "Category"
    Unselect "Clubs" Filter
    Verify Displayed "Clubs" Articles Info
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-03-b) - Clubs Articles Filter by Category (Admin)
    [Documentation]     *Title:* ART-ACL-03-b) - Clubs Articles Filter by Category (Admin)
    ...
    ...    *Description:*
    ...    Filter Clubs articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Clubs Article in "Social Club" category with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "Admin1" User
    Save Displayed "Clubs" Articles Info
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Social Club" In "Category"
    Unselect "Clubs" Filter
    Verify Displayed "Clubs" Articles Info
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-03-c) - Clubs Articles Filter by Category (TeamManager)
    [Documentation]     *Title:* ART-ACL-03-c) - Clubs Articles Filter by Category (TeamManager)
    ...
    ...    *Description:*
    ...    Filter Clubs articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Clubs Article in "Social Club" category with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "Manager1" User
    Save Displayed "Clubs" Articles Info
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Social Club" In "Category"
    Unselect "Clubs" Filter
    Verify Displayed "Clubs" Articles Info
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-03-d) - Clubs Articles Filter by Category (HRSalaryManager)
    [Documentation]     *Title:* ART-ACL-03-d) - Clubs Articles Filter by Category (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Filter Clubs articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Clubs Article in "Social Club" category with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "SalaryAdmin1" User
    Save Displayed "Clubs" Articles Info
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Social Club" In "Category"
    Unselect "Clubs" Filter
    Verify Displayed "Clubs" Articles Info
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-04-a) - Clubs Articles Category Link (Employee)
    [Documentation]     *Title:* ART-ACL-04-a) - Clubs Articles Category Link (Employee)
    ...
    ...    *Description*:
    ...    Verify after clicking on the clubs article is redirect to the article details page.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system
    ...
    [Tags]    DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "Employee1" User
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Access "ClubsArticle01" Details Page
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-04-b) - Clubs Articles Category Link (Admin)
    [Documentation]     *Title:* ART-ACL-04-b) - Clubs Articles Category Link (Admin)
    ...
    ...    *Description*:
    ...    Verify after clicking on the clubs article is redirect to the article details page.
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
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-04-c) - Clubs Articles Category Link (TeamManager)
    [Documentation]     *Title:* ART-ACL-04-c) - Clubs Articles Category Link (TeamManager)
    ...
    ...    *Description*:
    ...    Verify after clicking on the clubs article is redirect to the article details page.
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
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-04-d) - Clubs Articles Category Link (HRSalaryManager)
    [Documentation]     *Title:* ART-ACL-04-d) - Clubs Articles Category Link (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Verify after clicking on the clubs article is redirect to the article details page.
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
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-05-a) - Clubs Articles Pagination Buttons (Employee)
    [Documentation]     *Title:* ART-ACL-05-a) - Clubs Articles Pagination Buttons (Employee)
    ...
    ...    *Description*:
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    6 Clubs Article in the system with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03",
    ...    "Automation Clubs 04", "Automation Clubs 05" and "Automation Clubs 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03", "Automation Clubs 04",
    ...    "Automation Clubs 05" and "Automation Clubs 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Clubs" Articles
    Login As "Employee1" User
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Next" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "First" Button
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Last" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "Previous" Button
    Verify "Clubs" List On "First" Page
    Logout
    [Teardown]    Delete Several "Clubs" Articles

ART-ACL-05-b) - Clubs Articles Pagination Buttons (Admin)
    [Documentation]     *Title:* ART-ACL-05-b) - Clubs Articles Pagination Buttons (Admin)
    ...
    ...    *Description*:
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    6 Clubs Article in the system with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03",
    ...    "Automation Clubs 04", "Automation Clubs 05" and "Automation Clubs 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03", "Automation Clubs 04",
    ...    "Automation Clubs 05" and "Automation Clubs 06" in title not in the system.m
    ...
    [Tags]    DONE
    [Setup]    Create Several "Clubs" Articles
    Login As "Admin1" User
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Next" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "First" Button
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Last" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "Previous" Button
    Verify "Clubs" List On "First" Page
    Logout
    [Teardown]    Delete Several "Clubs" Articles

ART-ACL-05-c) - Clubs Articles Pagination Buttons (TeamManager)
    [Documentation]     *Title:* ART-ACL-05-c) - Clubs Articles Pagination Buttons (TeamManager)
    ...
    ...    *Description*:
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    6 Clubs Article in the system with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03",
    ...    "Automation Clubs 04", "Automation Clubs 05" and "Automation Clubs 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03", "Automation Clubs 04",
    ...    "Automation Clubs 05" and "Automation Clubs 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Clubs" Articles
    Login As "Manager1" User
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Next" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "First" Button
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Last" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "Previous" Button
    Verify "Clubs" List On "First" Page
    Logout
    [Teardown]    Delete Several "Clubs" Articles

ART-ACL-05-d) - Clubs Articles Pagination Buttons (HRSalaryManager)
    [Documentation]     *Title:* ART-ACL-05-d) - Clubs Clubs Articles Pagination Buttons (HRSalaryManager)
    ...
    ...    *Description*:
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    6 Clubs Article in the system with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03",
    ...    "Automation Clubs 04", "Automation Clubs 05" and "Automation Clubs 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03", "Automation Clubs 04",
    ...    "Automation Clubs 05" and "Automation Clubs 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Clubs" Articles
    Login As "SalaryAdmin1" User
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Next" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "First" Button
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Last" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "Previous" Button
    Verify "Clubs" List On "First" Page
    Logout
    [Teardown]    Delete Several "Clubs" Articles

ART-ACL-06-a) - Clubs Articles Pagination Buttons after Search With One Result (Employee)
    [Documentation]     *Title:* ART-ACL-06-a) - Clubs Articles Pagination Buttons after Search With One Result (Employee)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]   DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "Employee1" User
    Verify "Clubs" List On "First" Page
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Verify "Clubs" List With Just One Page
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-06-b) - Clubs Articles Pagination Buttons after Search With One Result (Admin)
    [Documentation]     *Title:* ART-ACL-06-b) - Clubs Articles Pagination Buttons after Search With One Result (Admin)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "Admin1" User
    Verify "Clubs" List On "First" Page
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Verify "Clubs" List With Just One Page
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-06-c) - Clubs Articles Pagination Buttons after Search With One Result (TeamManager)
    [Documentation]     *Title:* ART-ACL-06-c) - Clubs Articles Pagination Buttons after Search With One Result (TeamManager)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]     Create "ClubsArticle01" Article
    Login As "Manager1" User
    Verify "Clubs" List On "First" Page
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Verify "Clubs" List With Just One Page
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-06-d) - Clubs Articles Pagination Buttons after Search With One Result (HRSalaryManager)
    [Documentation]     *Title:* ART-ACL-06-d) - Clubs Articles Pagination Buttons after Search With One Result (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]      Create "ClubsArticle01" Article
    Login As "SalaryAdmin1" User
    Verify "Clubs" List On "First" Page
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Verify "Clubs" List With Just One Page
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-07-a) - Clubs Articles Pagination Buttons after Search With Results in More Than One Page (Employee)
    [Documentation]     *Title:* ART-ACL-07-a) - Clubs Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (Employee)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    6 Clubs Article in "Social Club" Category in the system with "Automation Clubs 01", "Automation Clubs 02",
    ...    "Automation Clubs 03", "Automation Clubs 04", "Automation Clubs 05" and "Automation Clubs 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03", "Automation Clubs 04",
    ...    "Automation Clubs 05" and "Automation Clubs 06" in title not in the system.
    ...
    [Tags]   DONE
    [Setup]    Create Several "Clubs" Articles
    Login As "Employee1" User
    Verify "Clubs" List On "First" Page
    Search "Clubs" Article With "Automation" Title
    Verify "Clubs" Results With "Automation" In "Title"
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Next" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "First" Button
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Last" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "Previous" Button
    Verify "Clubs" List On "First" Page
    Logout
    [Teardown]    Delete Several "Clubs" Articles

ART-ACL-07-b) - Clubs Articles Pagination Buttons after Search With Results in More Than One Page (Admin)
    [Documentation]     *Title:* ART-ACL-07-b) - Clubs Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (Admin)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    6 Clubs Article in "Social Club" Category in the system with "Automation Clubs 01", "Automation Clubs 02",
    ...    "Automation Clubs 03", "Automation Clubs 04", "Automation Clubs 05" and "Automation Clubs 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03", "Automation Clubs 04",
    ...    "Automation Clubs 05" and "Automation Clubs 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "Clubs" Articles
    Login As "Admin1" User
    Verify "Clubs" List On "First" Page
    Search "Clubs" Article With "Automation" Title
    Verify "Clubs" Results With "Automation" In "Title"
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Next" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "First" Button
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Last" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "Previous" Button
    Verify "Clubs" List On "First" Page
    Logout
    [Teardown]    Delete Several "Clubs" Articles

ART-ACL-07-c) - Clubs Articles Pagination Buttons after Search With Results in More Than One Page (TeamManager)
    [Documentation]     *Title:* ART-ACL-07-c) - Clubs Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (TeamManager)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    6 Clubs Article in "Social Club" Category in the system with "Automation Clubs 01", "Automation Clubs 02",
    ...    "Automation Clubs 03", "Automation Clubs 04", "Automation Clubs 05" and "Automation Clubs 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03", "Automation Clubs 04",
    ...    "Automation Clubs 05" and "Automation Clubs 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]     Create Several "Clubs" Articles
    Login As "Manager1" User
    Verify "Clubs" List On "First" Page
    Search "Clubs" Article With "Automation" Title
    Verify "Clubs" Results With "Automation" In "Title"
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Next" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "First" Button
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Last" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "Previous" Button
    Verify "Clubs" List On "First" Page
    Logout
    [Teardown]    Delete Several "Clubs" Articles

ART-ACL-07-d) - Clubs Articles Pagination Buttons after Search With Results in More Than One Page (HRSalaryManager)
    [Documentation]     *Title:* ART-ACL-07-d) - Clubs Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (HRSalaryManager)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    6 Clubs Article in "Social Club" Category in the system with "Automation Clubs 01", "Automation Clubs 02",
    ...    "Automation Clubs 03", "Automation Clubs 04", "Automation Clubs 05" and "Automation Clubs 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation Clubs 01", "Automation Clubs 02", "Automation Clubs 03", "Automation Clubs 04",
    ...    "Automation Clubs 05" and "Automation Clubs 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]      Create Several "Clubs" Articles
    Login As "SalaryAdmin1" User
    Verify "Clubs" List On "First" Page
    Search "Clubs" Article With "Automation" Title
    Verify "Clubs" Results With "Automation" In "Title"
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Next" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "First" Button
    Verify "Clubs" List On "First" Page
    Scroll "Clubs" Articles Using "Last" Button
    Verify "Clubs" List On "Last" Page
    Scroll "Clubs" Articles Using "Previous" Button
    Verify "Clubs" List On "First" Page
    Logout
    [Teardown]    Delete Several "Clubs" Articles

ART-ACL-08-a) - Company View Regarding Clubs Article Company (Employee)
    [Documentation]     *Title:* ART-ACL-08-a) - Company View Regarding Clubs Article Company (Employee)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "ClubsArticle01" Article
    Login As "Employee1" User
    Verify "Clubs" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify No "Clubs" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-08-b) -Company View Regarding Clubs Article Company (Admin)
    [Documentation]     *Title:* ART-ACL-08-b) - Company View Regarding Clubs Article Company (Admin)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "ClubsArticle01" Article
    Login As "Admin1" User
    Verify "Clubs" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify No "Clubs" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-08-c) - Company View Regarding Clubs Article Company (TeamManager)
    [Documentation]     *Title:* ART-ACL-08-c) - Company View Regarding Clubs Article Company (TeamManager)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed..
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "ClubsArticle01" Article
    Login As "Manager1" User
    Verify "Clubs" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify No "Clubs" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-08-d) - Company View Regarding Clubs Article Company (HRSalaryManager)
    [Documentation]     *Title:* ART-ACL-08-d) - Company View Regarding Clubs Article Company (HRSalaryManager)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "ClubsArticle01" Article
    Login As "SalaryAdmin1" User
    Verify "Clubs" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify No "Clubs" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-09-a) - Company View Regarding Clubs Category Company (Employee)
    [Documentation]     *Title:* ART-ACL-09-a) - Company View Regarding Clubs Category Company (Employee)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Update "CategorySocialClubCompany" And Create "ClubsArticle01" Article
    Login As "Employee1" User
    Verify "OSQuay" Company Displayed
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Social Club" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "Clubs" Articles By "Social Club" Category
    Verify No "Clubs" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Procedures" In "Category"
    Logout
    [Teardown]   Update "CategorySocialClub" And Delete "ClubsArticle01" Article

ART-ACL-09-b) -Company View Regarding Clubs Category Company (Admin)
    [Documentation]     *Title:* ART-ANW-09-b) - Company View Regarding Clubs Category Company (Admin)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Update "CategorySocialClubCompany" And Create "ClubsArticle01" Article
    Login As "Admin1" User
    Verify "OSQuay" Company Displayed
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Social Club" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "Clubs" Articles By "Social Club" Category
    Verify No "Clubs" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Procedures" In "Category"
    Logout
    [Teardown]   Update "CategorySocialClub" And Delete "ClubsArticle01" Article

ART-ACL-09-c) - Company View Regarding Clubs Category Company (TeamManager)
    [Documentation]     *Title:* ART-ACL-09-c) - Company View Regarding Clubs Category Company (TeamManager)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Update "CategorySocialClubCompany" And Create "ClubsArticle01" Article
    Login As "Manager1" User
    Verify "OSQuay" Company Displayed
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Social Club" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "Clubs" Articles By "Social Club" Category
    Verify No "Clubs" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Procedures" In "Category"
    Logout
    [Teardown]   Update "CategorySocialClub" And Delete "ClubsArticle01" Article

ART-ACL-09-d) - Company View Regarding Clubs Category Company (HRSalaryManager)
    [Documentation]     *Title:* ART-ACL-09-d) - Company View Regarding Clubs Category Company (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation Clubs 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Update "CategorySocialClubCompany" And Create "ClubsArticle01" Article
    Login As "SalaryAdmin1" User
    Verify "OSQuay" Company Displayed
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Social Club" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "Clubs" Articles By "Social Club" Category
    Verify No "Clubs" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "Clubs" Articles By "Social Club" Category
    Verify "Clubs" Results With "Procedures" In "Category"
    Logout
    [Teardown]   Update "CategorySocialClub" And Delete "ClubsArticle01" Article

ART-ACL-10-e) - Inactivate Clubs Article (ClubsOwner)
    [Documentation]     *Title:* ART-ACL-10-e) - Inactivate Clubs Article (ClubsOwner)
    ...
    ...    *Description:*
    ...    Change to inactive state a Clubs Article, verifies the state change, change to active state and verifies the
    ...    state change.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ClubsOwner.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Employee with full name “Automation Employee1” not with role ClubsOwner.
    ...    Article with “Automation Clubs 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Update "CategorySocialClubOwner" And Create "ClubsArticle01" Article
    Login As "Employee1" User
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Access "ClubsArticle01" Details Page
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Change "ClubsArticle01" Article State To "Inactive"
    Verify "ClubsArticle01" Not Displayed In Details Page
    Navigate To Home Page And Verify "Employee1" Logged In
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify No "Clubs" Results Displayed
    Display "Clubs" "Inactive" Articles
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Access "ClubsArticle01" Details Page
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Change "ClubsArticle01" Article State To "Active"
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Navigate To Home Page And Verify "Employee1" Logged In
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Logout
    [Teardown]    Update "CategorySocialClub" And Delete "ClubsArticle01" Article

ART-ACL-10-f) - Inactivate Clubs Article (ArticlesManager)
    [Documentation]     *Title:* ART-ACL-10-f) - Inactivate Clubs Article (ArticlesManager)
    ...
    ...    *Description:*
    ...    Change to inactive state a Clubs Article, verifies the state change, change to active state and verifies the
    ...    state change.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ArticlesManager.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Article with “Automation Clubs 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Create "ClubsArticle01" Article
    Login As "Admin1" User
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Access "ClubsArticle01" Details Page
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Change "ClubsArticle01" Article State To "Inactive"
    Verify "ClubsArticle01" Not Displayed In Details Page
    Navigate To Home Page And Verify "Admin1" Logged In
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify No "Clubs" Results Displayed
    Display "Clubs" "Inactive" Articles
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Access "ClubsArticle01" Details Page
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Change "ClubsArticle01" Article State To "Active"
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Navigate To Home Page And Verify "Admin1" Logged In
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Logout
    [Teardown]    Delete "ClubsArticle01" Article

ART-ACL-11-e) - Delete a Clubs Article (ClubsOwner)
    [Documentation]     *Title:* ART-ACL-11-e) - Delete a Clubs Article (ClubsOwner)
    ...
    ...    *Description:*
    ...    Delete a Clubs Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ClubsOwner.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Employee with full name “Automation Employee1” not with role ClubsOwner.
    ...    Article with “Automation Clubs 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Update "CategorySocialClubOwner" And Create "ClubsArticle01" Article
    Login As "Employee1" User
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify "Clubs" Results With "Automation Clubs 01" In "Title"
    Access "ClubsArticle01" Details Page
    Verify Displayed "ClubsArticle01" Article On Position "1" At Details Page
    Delete "ClubsArticle01" Article At Details Page
    Search "Clubs" Article With "Automation Clubs 01" Title
    Verify No "Clubs" Results Displayed
    Logout
    [Teardown]    Update "CategorySocialClub" Category

ART-ACL-11-f) - Delete a Clubs Article (ArticlesManager)
    [Documentation]     *Title:* ART-ACL-11-f) - Delete a Clubs Article (ArticlesManager)
    ...
    ...    *Description:*
    ...    Delete a Clubs Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ArticlesManager.
    ...    1 Clubs Article with "Automation Clubs 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Article with “Automation Clubs 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Create "ClubsArticle02" Article
    Login As "Admin1" User
    Search "Clubs" Article With "Automation Clubs 02" Title
    Verify "Clubs" Results With "Automation Clubs 02" In "Title"
    Access "ClubsArticle02" Details Page
    Verify Displayed "ClubsArticle02" Article On Position "1" At Details Page
    Delete "ClubsArticle02" Article At Details Page
    Search "Clubs" Article With "Automation Clubs 02" Title
    Verify No "Clubs" Results Displayed
    [Teardown]    Logout

ART-ACL-12-e) - Create an Inactive Clubs Article (ClubsOwner)
    [Documentation]     *Title:* ART-ACL-12-e) - Create an Inactive Clubs Article (ClubsOwner)
    ...
    ...    *Description:*
    ...    Create an Inactive Clubs Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ClubsOwner.
    ...
    ...    *Post Conditions:*
    ...    Employee with full name “Automation Employee1” not with role ClubsOwner.
    ...    Article with “Automation Clubs Inactive” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Update "CategorySocialClubOwner" Category
    Login As "Employee1" User
    Create "ClubsArticleInactive" Article In "Clubs"
    Verify "Employee1" Logged In
    Search "Clubs" Article With "Automation Clubs Inactive" Title
    Verify No "Clubs" Results Displayed
    Display "Clubs" "Inactive" Articles
    Verify "Clubs" Results With "Automation Clubs Inactive" In "Title"
    Logout
    [Teardown]    Update "CategorySocialClub" And Delete "ClubsArticleInactive" Inactive Article In "Clubs"

ART-ACL-12-f) - Create an Inactive Clubs Article (ArticlesManager)
    [Documentation]     *Title:* ART-ACL-12-f) - Create an Inactive Clubs Article (ArticlesManager)
    ...
    ...    *Description:*
    ...    Create an Inactive Clubs Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ArticlesManager.
    ...
    ...    *Post Conditions:*
    ...    Article with “Automation Clubs Inactive” in title does not exist in the system.
    ...
    [Tags]   DONE
    Login As "Admin1" User
    Create "ClubsArticleInactive" Article In "Clubs"
    Verify "Admin1" Logged In
    Search "Clubs" Article With "Automation Clubs Inactive" Title
    Verify No "Clubs" Results Displayed
    Display "Clubs" "Inactive" Articles
    Verify "Clubs" Results With "Automation Clubs Inactive" In "Title"
    Logout
    [Teardown]    Delete "ClubsArticleInactive" Inactive Article In "Clubs"
