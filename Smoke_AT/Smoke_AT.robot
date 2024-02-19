*** Settings ***
Metadata          version    0.0.1
Library           SeleniumLibrary    run_on_failure=No Operation
Library           requests    #delete library and R
Library           Collections
Library           OperatingSystem
Library           String

*** Variables ***
${BROWSER}        Chrome
${MAZIMIZE}       False
${USER}           bruno.calado@osquay.com
#${USER}          None
${PASS}           123456
${TRIES}          3
${TIMEOUT}        5
${API}            https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1

*** Test Cases ***
Load Pages
    [Setup]    Start Task
    FOR    ${url}    IN    @{urls}
        ${solution_result}=    Create Dictionary
        Set To Dictionary    ${solution_result}    expected_url    ${url}
        Set To Dictionary    ${solution_result}    error    ${EMPTY}
        ${status}    ${perfs}=    Run Keyword And Ignore Error    Wait Until Keyword Succeeds    ${TRIES}x    0    Go To    ${url}
        ${start}=    Execute Javascript    return window.performance.timing.navigationStart
        ${midle}=    Execute Javascript    return window.performance.timing.responseStart
        ${end}=    Execute Javascript    return window.performance.timing.domComplete
        ${BEperf}=    Evaluate    round((${midle}-${start})/1000.0,3)    #Back-End Performance [s]
        ${FEperf}=    Evaluate    round((${end}-${midle})/1000.0,3)    #Front-End Performance [s]
        ${FEperf}=    Set Variable If    ${FEperf}<0    0    ${FEperf}
        Wait Until Element Is Visible    xpath:/html/body    ${TIMEOUT}
        Set To Dictionary    ${solution_result}    BEperf    ${BEperf}
        Set To Dictionary    ${solution_result}    FEperf    ${FEperf}
        Sleep    ${TIMEOUT}
        Capture Page Screenshot    EMBED
        ${text}    Get Text    xpath:/html/body
        ${is_errorA}    Get Count    ${text}    Wrong URL address
        ${is_error1}    Get Count    ${text}    404
        ${is_error2}    Get Count    ${text}    not found
        ${is_errorB}    Set Variable    ${${is_error1}+${is_error2}-${1}}
        ${status}=    Evaluate    ${is_errorA}<=0 and ${is_errorB}<0
        Run Keyword Unless    ${is_errorA}<=0    Set To Dictionary    ${solution_result}    error    Wrong URL address
        Run Keyword Unless    ${is_errorB}<=0    Set To Dictionary    ${solution_result}    error    404 not found
        ${current_url}=    Get Location
        Set To Dictionary    ${solution_result}    current_url    ${current_url}
        Set To Dictionary    ${solution_result}    status    ${status}
        ${status}=    Evaluate    '${url}'=='${current_url}'
        Run Keyword Unless    ${status}    Set To Dictionary    ${solution_result}    status    ${status}
        Run Keyword Unless    ${status}    Set To Dictionary    ${solution_result}    error    URL not espected
        Append To List    ${data}    ${solution_result}
    END
    [Teardown]    End Task

aaa
    ${status}=    Run Keyword and Return Status    File Should Exist    ${CURDIR}/URL_list.txt    File "URL_list.txt" not Found!
    ${content}=    Run Keyword If    ${status}    Get File    ${CURDIR}/URL_list.txt
    ${urls}=    Run Keyword If    ${status}    Split To Lines    ${content}
    Comment    Log List    ${urls}    Warn
    Run Keyword If    ${urls}    Log    TRUE    WARN

*** Keywords ***
Start Task
    ${data}=    Create List
    Set Suite Variable    ${data}    ${data}
    ${urls}=    Get URLs
    Set Suite Variable    ${urls}    ${urls}
    Create Webdriver    ${BROWSER}
    Run Keyword Unless    '${USER}' == '${None}'    User Login
    Run Keyword If    ${MAZIMIZE}    Maximize Browser Window

End Task
    Close Browser
    FOR    ${solution_data}    IN    @{data}
        ${page}=    Get From Dictionary    ${solution_data}    expected_url
        ${url}=    Get From Dictionary    ${solution_data}    current_url
        ${status}=    Get From Dictionary    ${solution_data}    status
        ${error}=    Get From Dictionary    ${solution_data}    error
        ${BEperf}=    Get From Dictionary    ${solution_data}    BEperf
        ${FEperf}=    Get From Dictionary    ${solution_data}    FEperf
        ${msg}=    Set Variable    Expected URL: ${page}; Current_URL:${url}; BEperf:${BEperf}s; FEperf:${FEperf}s
        Run Keyword If    ${status}    Log    ${msg}
        Run Keyword Unless    ${status}    Log    ${msg}; ERROR: ${error}    ERROR
    END

User Login
    Go To    https://appsdev.iohub.pt/TrainingExercises/Login
    Wait Until Element Is Visible    xpath://div[text()='Login']    #delete ${loc_btn}
    Input Text    id:Input_UsernameVal    ${USER}
    Input Text    id:Input_PasswordVal    ${PASS}
    Click Element    xpath://div[text()='Login']
    Wait Until Element Is Visible    id:b1-Title

Get URLs
    ${status}=    Run Keyword and Return Status    File Should Exist    ${CURDIR}/URL_list.txt    File "URL_list.txt" not Found!
    ${content}=    Run Keyword If    ${status}    Get File    ${CURDIR}/URL_list.txt
    ${urls}=    Run Keyword If    ${status}    Split To Lines    ${content}
    Return From Keyword If    ${urls}    ${urls}
    ${urls}=    Run Keyword Unless    ${urls}    GET    ${API}    expected_status=200    #delete if
    [Return]    ${urls}
