*** Settings ***
Suite Setup       Start Task
Suite Teardown    End Task
Metadata          version    0.0.1
Variables         data.py
Resource          Keywords.resource

*** Variables ***
${BROWSER}        Chrome
${HEADLESS}       False
${TRIES}          3
${PERFORM_LOGIN}    False
${URL_SOURCE}    file
#${URL_SOURCE}    api
#${URL_SOURCE}     variable
${URLS_FILE}     AT_URL_list.txt
#${URLS_VARIABLE}    https://www.osquay.com/,https://www.sapo.pt/,https://www.online-python.com/online_python_compiler,https://www.python.org/
${ENVIRONMENT}    https://appsdev.iohub.pt/
${TIMEOUT}        5
${USER}           bruno.calado@osquay.com
${PASS}           123456
#@{test}          https://whatever    https://none    https://anotherone
&{test_dic}       domain=osquay.com    v_urls=[https://www.python.org/,https://www.online-python.com/online_python_compiler]

*** Test Cases ***
Load Pages
    [Tags]    RUN
    FOR    ${url}    IN    @{urls}
        #Log To Console    > Load Page URL "${url}"
        Log    Load Page URL "${url}"
        Load Page    ${url}
    END
