*** Settings ***
Library           SeleniumLibrary    run_on_failure=No Operation
Library           Collections
Library           OperatingSystem
Library           String

*** Keywords ***
Start Task
    Prepare Results Data
    Open Defined Browser
    Run Keyword If    '${url_source}'=='file'    Get URLs From File
    Run Keyword If    '${url_source}'=='api'    Get Urls From Api
    Run Keyword If    '${url_source}'=='variable'    Get Urls From Variable
    Run Keyword If    ${perform_login}    User Login

Prepare Results Data
    ${data}=    Create List
    Set Suite Variable    ${data}    ${data}

Open Defined Browser
    ${browser}=    Convert To Lower Case    ${browser}
    ${browser}=    Set Variable If    ${HEADLESS}    headless${BROWSER}    ${BROWSER}
    Open Browser    \    ${browser}
    Maximize Browser Window

User Login
    ${loc_username}=    Get From Dictionary    ${LoginPage}    username
    ${loc_pass}=    Get From Dictionary    ${LoginPage}    password
    ${loc_btn}=    Get From Dictionary    ${LoginPage}    login
    ${page}=    Get From Dictionary    ${LoginPage}    page
    ${user_element}=    Get From Dictionary    ${HomePage}    element
    Go To    ${page}
    Wait Until Element Is Visible    ${loc_btn}
    Input Text    ${loc_username}    ${USER}
    Input Text    ${loc_pass}    ${PASS}
    Click Element    ${loc_btn}
    Wait Until Element Is Visible    ${user_element}

Get URLs From File
    ${filepath}=    set variable    ${CURDIR}\\${URLS_FILE}
    File Should Exist    ${filepath}    File "${URLS_FILE}" not Found!
    ${content}=    Get File    ${filepath}
    ${content}=    Split String    ${content}    \n
    Set Suite Variable    ${urls}    ${content}

Get URLs From Api
    log    Using Api

Get URLs From Variable
    ${text}    Split String    ${URLS_VARIABLE}    ,
    Set Suite Variable    ${urls}    ${text}

Load Page
    [Arguments]    ${page}
    ${status}    ${perfs}=    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    ${TRIES}x    0    Go To Page    ${page}
    #Take Screenshots    ${page}
    Sleep    ${TIMEOUT}
    Capture Page Screenshot    EMBED
    ${status}    ${url}    ${error}=    Validate Page    ${status}    ${page}
    log    Status:${status}
    log    Current_URL:${url}
    log    ERROR:${error}
    Run Keyword If    '${status}'=='FAIL'    Save Results    ${page}    ${url}    ${status}    ${error}

Save Results
    [Arguments]    ${page}    ${url}    ${status}    ${error}
    ${solution_result}=    Create Dictionary
    Set To Dictionary    ${solution_result}    page    ${page}
    Set To Dictionary    ${solution_result}    url    ${url}
    Set To Dictionary    ${solution_result}    status    ${status}
    Set To Dictionary    ${solution_result}    error    ${error}
    Append To List    ${data}    ${solution_result}

Go To Page
    [Arguments]    ${page}
    Go To    ${page}
    ${start}=    Execute Javascript    return window.performance.timing.navigationStart
    ${midle}=    Execute Javascript    return window.performance.timing.responseStart
    ${end}=    Execute Javascript    return window.performance.timing.domComplete
    ${BEperf}=    Evaluate    round((${midle}-${start})/1000.0,3)    #Back-End Performance [s]
    ${FEperf}=    Evaluate    round((${end}-${midle})/1000.0,3)    #Front-End Performance [s]
    ${FEperf}=    Set Variable If    ${FEperf}<0    0    ${FEperf}
    ${Tperf}=    Evaluate    round(${BEperf}+${FEperf},3)    #Load Performance [s]
    ${perfs}=    Create List    ${BEperf}    ${FEperf}    ${Tperf}
    Wait Until Element Is Visible    xpath:/html/body    ${TIMEOUT}
    [Return]    ${perfs}

#Take Screenshots
#    [Arguments]    ${page}
#    Sleep    ${TIMEOUT}
#    ${filename}=    Remove String    ${page}    ${ENVIRONMENT}
#    ${filename}=    Replace String    ${filename}    /    _
#    ${filename}=    Replace String    ${filename}    :    _
#    ${filename}=    Replace String    ${filename}    *    _
#    ${filename}=    Replace String    ${filename}    ?    _
#    #Capture Page Screenshot    filename=${filename}.png
#    Capture Page Screenshot    EMBED

Validate Page
    [Arguments]    ${status}    ${page}
    Return From Keyword If    '${status}'=='FAIL'    ${status}    ${page}
    ${url}=    Get Location
    ${last_char}=    Get Substring    ${url}    -1
    IF    '${last_char}'=='/'
    ${url}=    Get Substring    ${url}    0    -1
    END
    ${status}=    Set Variable If    '${url}'=='${page}'    ${status}    FAIL
    ${error}=    Set Variable If    '${url}'=='${page}'    URL not espected    ${EMPTY}
    Return From Keyword If    '${status}'=='FAIL'    ${status}    ${url}    ${error}
    ${error1}    Set Variable    Wrong URL address
    ${error2}    Set Variable    404
    ${error3}    Set Variable    not found
    ${text}    Get Text    xpath:/html/body
    ${is_errorA}    Get Count    ${text}    ${error1}
    ${is_error1}    Get Count    ${text}    ${error2}
    ${is_error2}    Get Count    ${text}    ${error3}
    ${is_errorB}    Set Variable    ${${is_error1}+${is_error2}-${1}}
    ${status}=    Set Variable If    ${is_errorA}>0 or ${is_errorB}>0    FAIL    ${status}
    ${error}=    Set Variable If    ${is_errorA}>0    ${error1}    ${EMPTY}
    ${error}=    Set Variable If    ${is_errorB}>0    '404' Error or 'not found' displayed in the page    ${error}
    [Return]    ${status}    ${url}    ${error}

End Task
    Close Browser
    ${n}=    Get Length    ${data}
    Run Keyword If    ${n}    Log pages Performance

Log pages Performance
    FOR    ${solution_data}    IN    @{data}
        ${page}=    Get From Dictionary    ${solution_data}    page
        ${url}=    Get From Dictionary    ${solution_data}    url
        ${status}=    Get From Dictionary    ${solution_data}    status
        ${error}=    Get From Dictionary    ${solution_data}    error
        Log    Expected URL: ${page}; Current_URL:${url}; Status: ${status}; ERROR: ${error}
    END


