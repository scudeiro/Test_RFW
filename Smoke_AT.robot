*** Settings ***
Suite Setup       Start Task
Suite Teardown    End Task
Metadata          version    0.0.1
Variables         data.py
Resource          Keywords.resource

*** Variables ***
${BROWSER}      Chrome
${HEADLESS}      False
${TRIES}      3
#${URLS_FILE}      urlist.txt
${URLS_FILE}      AT_URL_list.txt
#${ENVIRONMENT}    https://www.osquay.com/
${ENVIRONMENT}    https://appsdev.iohub.pt/
${TIMEOUT}    5
#${USER}    auto.admin
#${PASS}    123456
${USER}    bruno.calado@osquay.com
${PASS}    123456

*** Test Cases ***
Load Pages
    FOR    ${url}    IN    @{urls}
        Log To Console    > Load Page URL "${url}"
        Load Page    ${url}
    END