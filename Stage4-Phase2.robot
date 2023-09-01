*** Settings ***
Documentation     Optimize
Suite Setup       Start Suite
Suite Teardown    Close Browser
Library           SeleniumLibrary
Library           String
Variables         testdata.py
Variables         locators.py

*** Test Cases ***
Check OsQuay Zip Code
    Submit "OSQuay" Zip Code
    Verify "OSQuay" Results
    [Teardown]    Clear Query

Check Fundão Zip Code
    Submit "Fundao" Zip Code
    Verify "Fundao" Results
    [Teardown]    Clear Query

Check Terceira Zip Code
    Submit "Terceira" Zip Code
    Verify "Terceira" Results
    [Teardown]    Clear Query

*** Keywords ***
Click And Wait
    [Arguments]    ${click_loc}    ${wait_loc}    ${pre_wait}=${None}
    Run Keyword Unless    $pre_wait is ${None}    Wait Until Page Contains Element    ${pre_wait}
    Click Element    ${click_loc}
    Wait Until Page Contains Element    ${wait_loc}

Get Text And Compare
    [Arguments]    ${locator}    ${expected}
    ${text}=    Get Text    ${locator}
    Should Be Equal    ${text}    ${expected}

Navigate to "${env}"
    Open Browser    ${${env}.url}    ${${env}.browser}
    Maximize Browser Window
    Click And Wait    ${home.close_warning}    ${home.send_menu}    pre_wait=${home.close_warning}

Navigate to "${page}" ${dummy}
    IF    '${page.lower()}'=='find zip codes'
    ${click}=    Set Variable    ${send.find_zipcode}
    ${wait}=    Set Variable    ${find_zipcodes.find_address}
    ${pre_wait}=    Set Variable    ${send.find_zipcode}
    ELSE
    ${pre_wait}=    Set Variable    ${None}
    IF    '${page.lower()}'=='find address'
    ${click}=    Set Variable    ${find_zipcodes.find_address}
    ${wait}=    Set Variable    ${find_zipcodes.zip4}
    ELSE
    ${click}=    Set Variable    ${home.send_menu}
    ${wait}=    Set Variable    ${send.title}
    END
    END
    Click And Wait    ${click}    ${wait}    ${pre_wait}

Submit "${data}" Zip Code
    ${zip4}    ${zip3}=    Split String    ${${data}.zip}    -
    Input Text    ${find_zipcodes.zip4}    ${zip4}
    Input Text    ${find_zipcodes.zip3}    ${zip3}
    Click Element    ${find_zipcodes.submit}

Verify "${data}" Results
    Wait Until Page Contains Element    ${find_zipcodes.results}
    Get Text And Compare    ${find_zipcodes.address}    ${${data}.address}
    Get Text And Compare    ${find_zipcodes.city}    ${${data}.city}
    Get Text And Compare    ${find_zipcodes.zipcode}    ${${data}.zip}${SPACE}${${data}.city.upper()}
    Scroll Element Into View    ${find_zipcodes.all_results}
    Capture Element Screenshot    ${find_zipcodes.all_results}

Start Suite
    Navigate to "CTT"
    Navigate to "Send" Page
    Navigate to "Find Zip Codes" Page
    Navigate to "Find Address" Tab

Clear Query
    Click Element    ${find_zipcodes.clean}
