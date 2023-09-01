*** Settings ***
Documentation     Test Variables and Expected Results not hardcoded
Library           SeleniumLibrary
Library           String
Library           Dialogs

*** Variables ***
${URL}            https://www.ctt.pt
${BROWSER}        Chrome
${ZIP CODE}       2795-116
${ADDRESS}        Largo da Lagoa
${CITY}           Linda a Velha

*** Test Cases ***
Search
    ### NAVIGATE TO "CTT" SITE ###
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath://button[@id='onetrust-accept-btn-handler']
    ### CLOSE HEADER WARNING ###
    Click Element    xpath://button[@id='onetrust-accept-btn-handler']
    Wait Until Page Contains Element    xpath://li[@class='has-drop drop-grid-3']/a[contains(text(),'Enviar')]
    ### NAVIGATE TO "SEND" PAGE ###
    Click Element    xpath://li[@class='has-drop drop-grid-3']/a[contains(text(),'Enviar')]
    Wait Until Page Contains Element    xpath://div[@class='slide-caption-wrap caption-background']//h6[contains(.,'Enviar')]
    ### NAVIGATE TO "FIND ZIP CODES" PAGE ###
    Wait Until Page Contains Element    (//div[@class='tools']//li)[2]/a
    Click Element    (//div[@class='tools']//li)[2]/a
    Wait Until Page Contains Element    (//div[@class='content']//li)[2]
    ### NAVIGATE TO "FIND ADDRESS" TAB ###
    Click Element    (//div[@class='content']//li)[2]
    Wait Until Page Contains Element    id:cp4
    ### SUBMIT A ZIP CODE ###
    ${zip4}    ${zip3}=    Split String    ${ZIP CODE}    -
    Input Text    id:cp4    ${zip4}
    Input Text    id:cp3    ${zip3}
    Click Element    id:buttonAddressSearch
    ### VERIFY RESULTS ###
    Wait Until Page Contains Element    id:postalCodeSearchResult
    ${result_address}=    Get Text    (//div[@class='highlighted-result']/h4)[1]
    ${result_city}=    Get Text    (//div[@class='highlighted-result']/h4)[2]
    ${result_zipcode}=    Get Text    //div[@class='highlighted-result']/h2
    Should Be Equal    ${result_address}    ${ADDRESS}
    Should Be Equal    ${result_city}    ${CITY}
    ${city_upper}=    Convert To Upper Case    ${CITY}
    Should Be Equal    ${result_zipcode}    ${ZIP CODE}${SPACE}${city_upper}
    [Teardown]    Close Browser

Language
    ### NAVIGATE TO "CTT" SITE ###
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    xpath://button[@id='onetrust-accept-btn-handler']
    ### CLOSE HEADER WARNING ###
    Click Element    xpath://button[@id='onetrust-accept-btn-handler']
    Wait Until Page Contains Element    xpath://li[@class='has-drop drop-grid-3']/a[contains(text(),'Enviar')]
    ### SCROLL UNTIL END OF PAGE ###
    Scroll Element Into View    xpath://img[@class='logo-complaints bw']
    Click Element    xpath://div[@id='footer-container-language']//a[text()='EN']
    Wait Until Page Contains Element    xpath://div[@class='slide-caption-wrap caption-background']//h6[contains(.,'Enviar')]
    [Teardown]    Close Browser
