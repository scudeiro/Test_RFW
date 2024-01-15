*** Settings ***
Documentation    *Description:* Testes Cases of News Articles
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
ART-ANW-01-a) - News Articles Filter by Title (Employee)
    [Documentation]     *Title:* ART-ANW-01-a) - News Articles Filter by Title (Employee)
    ...
    ...    *Description:*
    ...    Search articles News that has the input string in article title.
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
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-01-b) - News Articles Filter by Title (Admin)
    [Documentation]     *Title:* ART-ANW-01-b) - News Articles Filter by Title (Admin)
    ...
    ...    *Description:*
    ...    Search articles News that has the input string in article title.
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
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-01-c) - News Articles Filter by Title (TeamManager)
    [Documentation]     *Title:* ART-ANW-01-c) - News Articles Filter by Title (TeamManager)
    ...
    ...    *Description:*
    ...    Search articles News that has the input string in article title.
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
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-01-d) - News Articles Filter by Title (HRSalaryManager)
    [Documentation]     *Title:* ART-ANW-01-d) - News Articles Filter by Title (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Search articles News that has the input string in article title.
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
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-02-a) - News Articles Filter by Invalid Title (Employee)
    [Documentation]     *Title:* ART-ANW-02-a) - News Articles Filter by Invalid Title (Employee)
    ...
    ...    *Description:*
    ...    Search not existing expression on news article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "Employee1" User
    Search "News" Article With "abcd" Title
    Verify No "News" Results Displayed
    [Teardown]    Logout

ART-ANW-02-b) - News Articles Filter by Invalid Title (Admin)
    [Documentation]     *Title:* ART-ANW-02-b) - News Articles Filter by Invalid Title (Admin)
    ...
    ...    *Description:*
    ...    Search not existing expression on news article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "Admin1" User
    Search "News" Article With "abcd" Title
    Verify No "News" Results Displayed
    [Teardown]    Logout

ART-ANW-02-c) - News Articles Filter by Invalid Title (TeamManager)
    [Documentation]     *Title:* ART-ANW-02-c) - News Articles Filter by Invalid Title (TeamManager)
    ...
    ...    *Description:*
    ...    Search not existing expression on news article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "Manager1" User
    Search "News" Article With "abcd" Title
    Verify No "News" Results Displayed
    [Teardown]    Logout

ART-ANW-02-d) - News Articles Filter by Invalid Title (HRSalaryManager)
    [Documentation]     *Title:* ART-ANW-02-d) - News Articles Filter by Invalid Title (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Search not existing expression on news article and no result is shown.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...
    ...    *Post Conditions:*
    ...    N/A
    ...
    [Tags]    DONE
    Login As "SalaryAdmin1" User
    Search "News" Article With "abcd" Title
    Verify No "News" Results Displayed
    [Teardown]    Logout

ART-ANW-03-a) - News Articles Filter by Category (Employee)
    [Documentation]     *Title:* ART-ANW-03-a) - News Articles Filter by Category (Employee)
    ...
    ...    *Description:*
    ...    Filter News articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 News Article in "Procedures" category with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "NewsArticle01" Article
    Login As "Employee1" User
    Save Displayed "News" Articles Info
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Unselect "News" Filter
    Verify Displayed "News" Articles Info
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-03-b) - News Articles Filter by Category (Admin)
    [Documentation]     *Title:* ART-ANW-03-b) - News Articles Filter by Category (Admin)
    ...
    ...    *Description:*
    ...    Filter News articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 News Article in "Procedures" category with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "NewsArticle01" Article
    Login As "Admin1" User
    Save Displayed "News" Articles Info
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Unselect "News" Filter
    Verify Displayed "News" Articles Info
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-03-c) - News Articles Filter by Category (TeamManager)
    [Documentation]     *Title:* ART-ANW-03-c) - News Articles Filter by Category (TeamManager)
    ...
    ...    *Description:*
    ...    Filter News articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 News Article in "Procedures" category with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "NewsArticle01" Article
    Login As "Manager1" User
    Save Displayed "News" Articles Info
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Unselect "News" Filter
    Verify Displayed "News" Articles Info
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-03-d) - News Articles Filter by Category (HRSalaryManager)
    [Documentation]     *Title:* ART-ANW-03-d) - News Articles Filter by Category (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Filter News articles by the selected category and after clean the filter.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 News Article in "Procedures" category with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]    Create "NewsArticle01" Article
    Login As "SalaryAdmin1" User
    Save Displayed "News" Articles Info
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Unselect "News" Filter
    Verify Displayed "News" Articles Info
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-04-a) - News Articles Category Link (Employee)
    [Documentation]     *Title:* ART-ANW-04-a) - News Articles Category Link (Employee)
    ...
    ...    *Description:*
    ...    Verify after clicking on the news article is redirect to the article details page.
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
    Access "newsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-04-b) - News Articles Category Link (Admin)
    [Documentation]     *Title:* ART-ANW-04-b) - News Articles Category Link (Admin)
    ...
    ...    *Description:*
    ...    Verify after clicking on the news article is redirect to the article details page.
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
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-04-c) - News Articles Category Link (TeamManager)
    [Documentation]     *Title:* ART-ANW-04-c) - News Articles Category Link (TeamManager)
    ...
    ...    *Description:*
    ...    Verify after clicking on the news article is redirect to the article details page.
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
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-04-d) - News Articles Category Link (HRSalaryManager)
    [Documentation]     *Title:* ART-ANW-04-d) - News Articles Category Link (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Verify after clicking on the news article is redirect to the article details page.
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
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-05-a) - News Articles Pagination Buttons (Employee)
    [Documentation]     *Title:* ART-ANW-05-a) - News Articles Pagination Buttons (Employee)
    ...
    ...    *Description:*
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    6 News Article in the system with "Automation News 01", "Automation News 02", "Automation News 03",
    ...    "Automation News 04", "Automation News 05" and "Automation News 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation News 01", "Automation News 02", "Automation News 03", "Automation News 04",
    ...    "Automation News 05" and "Automation News 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "News" Articles
    Login As "Employee1" User
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Next" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "First" Button
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Last" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "Previous" Button
    Verify "News" List On "First" Page
    Logout
    [Teardown]    Delete Several "News" Articles

ART-ANW-05-b) - News Articles Pagination Buttons (Admin)
    [Documentation]     *Title:* ART-ANW-05-b) - News Articles Pagination Buttons (Admin)
    ...
    ...    *Description:*
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    6 News Article in the system with "Automation News 01", "Automation News 02", "Automation News 03",
    ...    "Automation News 04", "Automation News 05" and "Automation News 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation News 01", "Automation News 02", "Automation News 03", "Automation News 04",
    ...    "Automation News 05" and "Automation News 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "News" Articles
    Login As "Admin1" User
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Next" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "First" Button
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Last" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "Previous" Button
    Verify "News" List On "First" Page
    Logout
    [Teardown]    Delete Several "News" Articles

ART-ANW-05-c) - News Articles Pagination Buttons (TeamManager)
    [Documentation]     *Title:* ART-ANW-05-c) - News Articles Pagination Buttons (TeamManager)
    ...
    ...    *Description:*
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    6 News Article in the system with "Automation News 01", "Automation News 02", "Automation News 03",
    ...    "Automation News 04", "Automation News 05" and "Automation News 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation News 01", "Automation News 02", "Automation News 03", "Automation News 04",
    ...    "Automation News 05" and "Automation News 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "News" Articles
    Login As "Manager1" User
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Next" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "First" Button
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Last" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "Previous" Button
    Verify "News" List On "First" Page
    Logout
    [Teardown]    Delete Several "News" Articles

ART-ANW-05-d) - News Articles Pagination Buttons (HRSalaryManager)
    [Documentation]     *Title:* ART-ANW-05-d) - News Articles Pagination Buttons (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Scroll through all the elements using the next button, return to the top of the list using all back buttons,
    ...    return to the end of the list using all forward buttons and  return to the top of the list using the back
    ...    button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    6 News Article in the system with "Automation News 01", "Automation News 02", "Automation News 03",
    ...    "Automation News 04", "Automation News 05" and "Automation News 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation News 01", "Automation News 02", "Automation News 03", "Automation News 04",
    ...    "Automation News 05" and "Automation News 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "News" Articles
    Login As "SalaryAdmin1" User
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Next" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "First" Button
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Last" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "Previous" Button
    Verify "News" List On "First" Page
    Logout
    [Teardown]    Delete Several "News" Articles

ART-ANW-06-a) - News Articles Pagination Buttons after Search With One Result (Employee)
    [Documentation]     *Title:* ART-ANW-06-a) - News Articles Pagination Buttons after Search With One Result (Employee)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]   DONE
    [Setup]    Create "NewsArticle01" Article
    Login As "Employee1" User
    Verify "News" List On "First" Page
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Verify "News" List With Just One Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-06-b) - News Articles Pagination Buttons after Search With One Result (Admin)
    [Documentation]     *Title:* ART-ANW-06-b) - News Articles Pagination Buttons after Search With One Result (Admin)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
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
    Verify "News" List On "First" Page
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Verify "News" List With Just One Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-06-c) - News Articles Pagination Buttons after Search With One Result (TeamManager)
    [Documentation]     *Title:* ART-ANW-06-c) - News Articles Pagination Buttons after Search With One Result (TeamManager)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]     Create "NewsArticle01" Article
    Login As "Manager1" User
    Verify "News" List On "First" Page
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Verify "News" List With Just One Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-06-d) - News Articles Pagination Buttons after Search With One Result (HRSalaryManager)
    [Documentation]     *Title:* ART-ANW-06-d) - News Articles Pagination Buttons after Search With One Result (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Verify after performing a search with one result, all pagination buttons are disabled.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]    DONE
    [Setup]      Create "NewsArticle01" Article
    Login As "SalaryAdmin1" User
    Verify "News" List On "First" Page
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Verify "News" List With Just One Page
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-07-a) - News Articles Pagination Buttons after Search With Results in More Than One Page (Employee)
    [Documentation]     *Title:* ART-ANW-07-a) - News Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (Employee)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    6 News Article in "Procedures" Category in the system with "Automation News 01", "Automation News 02",
    ...    "Automation News 03", "Automation News 04", "Automation News 05" and "Automation News 06" in title
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation News 01", "Automation News 02", "Automation News 03", "Automation News 04",
    ...    "Automation News 05" and "Automation News 06" in title not in the system.
    ...
    [Tags]   DONE
    [Setup]    Create Several "News" Articles
    Login As "Employee1" User
    Verify "News" List On "First" Page
    Search "News" Article With "Automation" Title
    Verify "News" Results With "Automation" In "Title"
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Next" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "First" Button
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Last" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "Previous" Button
    Verify "News" List On "First" Page
    Logout
    [Teardown]    Delete Several "News" Articles

ART-ANW-07-b) - News Articles Pagination Buttons after Search With Results in More Than One Page (Admin)
    [Documentation]     *Title:* ART-ANW-07-b) - News Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (Admin)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    6 News Article in "Procedures" Category in the system with "Automation News 01", "Automation News 02",
    ...    "Automation News 03", "Automation News 04", "Automation News 05" and "Automation News 06" in title
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation News 01", "Automation News 02", "Automation News 03", "Automation News 04",
    ...    "Automation News 05" and "Automation News 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]    Create Several "News" Articles
    Login As "Admin1" User
    Verify "News" List On "First" Page
    Search "News" Article With "Automation" Title
    Verify "News" Results With "Automation" In "Title"
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Next" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "First" Button
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Last" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "Previous" Button
    Verify "News" List On "First" Page
    Logout
    [Teardown]    Delete Several "News" Articles

ART-ANW-07-c) - News Articles Pagination Buttons after Search With Results in More Than One Page (TeamManager)
    [Documentation]     *Title:* ART-ANW-07-c) - News Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (TeamManager)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    6 News Article in "Procedures" Category in the system with "Automation News 01", "Automation News 02",
    ...    "Automation News 03", "Automation News 04", "Automation News 05" and "Automation News 06" in title
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation News 01", "Automation News 02", "Automation News 03", "Automation News 04",
    ...    "Automation News 05" and "Automation News 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]     Create Several "News" Articles
    Login As "Manager1" User
    Verify "News" List On "First" Page
    Search "News" Article With "Automation" Title
    Verify "News" Results With "Automation" In "Title"
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Next" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "First" Button
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Last" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "Previous" Button
    Verify "News" List On "First" Page
    Logout
    [Teardown]    Delete Several "News" Articles

ART-ANW-07-d) - News Articles Pagination Buttons after Search With Results in More Than One Page (HRSalaryManager)
    [Documentation]     *Title:* ART-ANW-07-d) - News Articles Pagination Buttons after Search With Results in More Than
    ...    One Page (HRSalaryManager)
    ...
    ...    *Description:*
    ...    After performing a search with results in more than one page, it will scroll through all the elements using
    ...    the next button, return to the top of the list using all back buttons, return to the end of the list using
    ...    all forward buttons and  return to the top of the list using the back button.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    6 News Article in "Procedures" Category in the system with "Automation News 01", "Automation News 02",
    ...    "Automation News 03", "Automation News 04", "Automation News 05" and "Automation News 06" in title.
    ...
    ...    *Post Conditions:*
    ...    Articles with "Automation News 01", "Automation News 02", "Automation News 03", "Automation News 04",
    ...    "Automation News 05" and "Automation News 06" in title not in the system.
    ...
    [Tags]    DONE
    [Setup]      Create Several "News" Articles
    Login As "SalaryAdmin1" User
    Verify "News" List On "First" Page
    Search "News" Article With "Automation" Title
    Verify "News" Results With "Automation" In "Title"
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Next" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "First" Button
    Verify "News" List On "First" Page
    Scroll "News" Articles Using "Last" Button
    Verify "News" List On "Last" Page
    Scroll "News" Articles Using "Previous" Button
    Verify "News" List On "First" Page
    Logout
    [Teardown]    Delete Several "News" Articles

ART-ANW-08-a) - Company View Regarding News Article Company (Employee)
    [Documentation]     *Title:* ART-ANW-08-a) - Company View Regarding News Article Company (Employee)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "Employee1" User
    Verify "News" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "News" Article With "Automation News 01" Title
    Verify No "News" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-08-b) -Company View Regarding News Article Company (Admin)
    [Documentation]     *Title:* ART-ANW-08-b) - Company View Regarding News Article Company (Admin)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "Admin1" User
    Verify "News" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "News" Article With "Automation News 01" Title
    Verify No "News" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-08-c) - Company View Regarding News Article Company (TeamManager)
    [Documentation]     *Title:* ART-ANW-08-c) - Company View Regarding News Article Company (TeamManager)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed..
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "Manager1" User
    Verify "News" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Search "News" Article With "Automation News 01" Title
    Verify No "News" Results Displayed
    Change Home Page View To "OSQuay" Company
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-08-d) - Company View Regarding News Article Company (HRSalaryManager)
    [Documentation]     *Title:* ART-ANW-08-d) - Company View Regarding News Article Company (HRSalaryManager)
    ...
    ...    *Description:*
    ...    When choosing the Article company, the article is displayed and when choosing another company, the article
    ...    is not displayed.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Create "NewsArticle01" Article
    Login As "SalaryAdmin1" User
    Verify "News" List On "First" Page
    Verify "OSQuay" Company Displayed
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Change Home Page View To "IT Up Portugal" Company
    Verify No "News" Results Displayed
    Search "News" Article With "Automation News 01" Title
    Change Home Page View To "OSQuay" Company
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-09-a) - Company View Regarding News Category Company (Employee)
    [Documentation]     *Title:* ART-ANW-09-a) - Company View Regarding News Category Company (Employee)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Employee.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Update "CategoryProceduresCompany" And Create "NewsArticle01" Article
    Login As "Employee1" User
    Verify "OSQuay" Company Displayed
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "News" Articles By "Procedures" Category
    Verify No "News" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Logout
    [Teardown]   Update "CategoryProcedures" And Delete "NewsArticle01" Article

ART-ANW-09-b) -Company View Regarding News Category Company (Admin)
    [Documentation]     *Title:* ART-ANW-09-b) - Company View Regarding News Category Company (Admin)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role Admin.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Update "CategoryProceduresCompany" And Create "NewsArticle01" Article
    Login As "Admin1" User
    Verify "OSQuay" Company Displayed
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "News" Articles By "Procedures" Category
    Verify No "News" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Logout
    [Teardown]   Update "CategoryProcedures" And Delete "NewsArticle01" Article

ART-ANW-09-c) - Company View Regarding News Category Company (TeamManager)
    [Documentation]     *Title:* ART-ANW-09-c) - Company View Regarding News Category Company (TeamManager)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role TeamManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Update "CategoryProceduresCompany" And Create "NewsArticle01" Article
    Login As "Manager1" User
    Verify "OSQuay" Company Displayed
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "News" Articles By "Procedures" Category
    Verify No "News" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Logout
    [Teardown]   Update "CategoryProcedures" And Delete "NewsArticle01" Article

ART-ANW-09-d) - Company View Regarding News Category Company (HRSalaryManager)
    [Documentation]     *Title:* ART-ANW-09-d) - Company View Regarding News Category Company (HRSalaryManager)
    ...
    ...    *Description:*
    ...    Verify the categories articles displayed are according to the company associated with the category. Changing
    ...    the company view, the displayed articles categories are also different.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role HRSalaryManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    No Article with "Automation News 01" in the title in the system.
    ...
    [Tags]   TOREVIEW
    [Setup]    Update "CategoryProceduresCompany" And Create "NewsArticle01" Article
    Login As "SalaryAdmin1" User
    Verify "OSQuay" Company Displayed
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Change Home Page View To "IT Up Portugal" Company
    Select "News" Articles By "Procedures" Category
    Verify No "News" Results Displayed
    Change Home Page View To "OSQuay" Company
    Select "News" Articles By "Procedures" Category
    Verify "News" Results With "Procedures" In "Category"
    Logout
    [Teardown]   Update "CategoryProcedures" And Delete "NewsArticle01" Article

ART-ANW-10-e) - Inactivate News Article (NewsOwner)
    [Documentation]     *Title:* ART-ANW-10-e) - Inactivate News Article (NewsOwner)
    ...
    ...    *Description:*
    ...    Change to inactive state a News Article, verifies the state change, change to active state and verifies the
    ...    state change.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role NewsOwner.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Employee with full name “Automation Employee1” not with role NewsOwner.
    ...    Article with “Automation News 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Update "CategoryProceduresOwner" And Create "NewsArticle01" Article
    Login As "Employee1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "newsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Change "newsArticle01" Article State To "Inactive"
    Verify "newsArticle01" Not Displayed In Details Page
    Navigate To Home Page And Verify "Employee1" Logged In
    Search "News" Article With "Automation News 01" Title
    Verify No "News" Results Displayed
    Display "News" "Inactive" Articles
    Verify "News" Results With "Automation News 01" In "Title"
    Access "newsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Change "newsArticle01" Article State To "Active"
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Navigate To Home Page And Verify "Employee1" Logged In
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Logout
    [Teardown]    Update "CategoryProcedures" And Delete "NewsArticle01" Article

ART-ANW-10-f) - Inactivate News Article (ArticlesManager)
    [Documentation]     *Title:* ART-ANW-10-f) - Inactivate News Article (ArticlesManager)
    ...
    ...    *Description:*
    ...    Change to inactive state a News Article, verifies the state change, change to active state and verifies the
    ...    state change.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ArticlesManager.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Article with “Automation News 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Create "NewsArticle01" Article
    Login As "Admin1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "newsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Change "newsArticle01" Article State To "Inactive"
    Verify "newsArticle01" Not Displayed In Details Page
    Navigate To Home Page And Verify "Admin1" Logged In
    Search "News" Article With "Automation News 01" Title
    Verify No "News" Results Displayed
    Display "News" "Inactive" Articles
    Verify "News" Results With "Automation News 01" In "Title"
    Access "newsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Change "newsArticle01" Article State To "Active"
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Navigate To Home Page And Verify "Admin1" Logged In
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Logout
    [Teardown]    Delete "NewsArticle01" Article

ART-ANW-11-e) - Delete a News Article (NewsOwner)
    [Documentation]     *Title:* ART-ANW-10-e) - Delete a News Article (NewsOwner)
    ...
    ...    *Description:*
    ...    Delete a News Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role NewsOwner.
    ...    1 News Article with "Automation News 01" in the title.
    ...
    ...    *Post Conditions:*
    ...    Employee with full name “Automation Employee1” not with role NewsOwner.
    ...    Article with “Automation News 01” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Update "CategoryProceduresOwner" And Create "NewsArticle01" Article
    Login As "Employee1" User
    Search "News" Article With "Automation News 01" Title
    Verify "News" Results With "Automation News 01" In "Title"
    Access "newsArticle01" Details Page
    Verify Displayed "NewsArticle01" Article On Position "1" At Details Page
    Delete "newsArticle01" Article At Details Page
    Search "News" Article With "Automation News 01" Title
    Verify No "News" Results Displayed
    Logout
    [Teardown]    Update "CategoryProcedures" Category

ART-ANW-11-f) - Delete a News Article (ArticlesManager)
    [Documentation]     *Title:* ART-ANW-10-f) - Delete a News Article (ArticlesManager)
    ...
    ...    *Description:*
    ...    Delete a News Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ArticlesManager.
    ...    1 News Article with "Automation News 02" in the title.
    ...
    ...    *Post Conditions:*
    ...    Article with “Automation News 02” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Create "NewsArticle02" Article
    Login As "Admin1" User
    Search "News" Article With "Automation News 02" Title
    Verify "News" Results With "Automation News 02" In "Title"
    Access "newsArticle02" Details Page
    Verify Displayed "NewsArticle02" Article On Position "1" At Details Page
    Delete "newsArticle02" Article At Details Page
    Search "News" Article With "Automation News 02" Title
    Verify No "News" Results Displayed
    [Teardown]    Logout

ART-ANW-12-e) - Create an Inactive News Article (NewsOwner)
    [Documentation]     *Title:* ART-ANW-11-e) - Create an Inactive News Article (NewsOwner)
    ...
    ...    *Description:*
    ...    Create an Inactive News Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role NewsOwner.
    ...
    ...    *Post Conditions:*
    ...    Employee with full name “Automation Employee1” not with role NewsOwner.
    ...    Article with “Automation News Inactive” in title does not exist in the system.
    ...
    [Tags]   DONE
    [Setup]    Update "CategoryProceduresOwner" Category
    Login As "Employee1" User
    Create "NewsArticleInactive" Article In "News"
    Verify "Employee1" Logged In
    Search "News" Article With "Automation News Inactive" Title
    Verify No "News" Results Displayed
    Display "News" "Inactive" Articles
    Verify "News" Results With "Automation News Inactive" In "Title"
    Logout
    [Teardown]    Update "CategoryProcedures" And Delete "NewsArticleInactive" Inactive Article In "News"

ART-ANW-12-f) - Create an Inactive News Article (ArticlesManager)
    [Documentation]     *Title:* ART-ANW-15-f) - Create an Inactive News Article (ArticlesManager)
    ...
    ...    *Description:*
    ...    Create an Inactive News Article.
    ...
    ...    *Pre Conditions:*
    ...    1 valid Employee with role ArticlesManager.
    ...
    ...    *Post Conditions:*
    ...    Article with “Automation News Inactive” in title does not exist in the system.
    ...
    [Tags]   DONE
    Login As "Admin1" User
    Create "NewsArticleInactive" Article In "News"
    Verify "Admin1" Logged In
    Search "News" Article With "Automation News Inactive" Title
    Verify No "News" Results Displayed
    Display "News" "Inactive" Articles
    Verify "News" Results With "Automation News Inactive" In "Title"
    Logout
    [Teardown]    Delete "NewsArticleInactive" Inactive Article In "News"
