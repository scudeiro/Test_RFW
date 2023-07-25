*** Settings ***
Library           Collections
Library           Dialogs

*** Test Cases ***
05
    ${total}=    Set Variable    ${0}
    ${a}    Create List    w    1
    ${b}    Create List    y    2
    ${c}    Create List    k    3
    ${list}    Create List    ${a}    ${b}    ${c}
    log    ${list}    WARN
    FOR    ${d}    IN    @{list}
        log    ${d}    WARN
        ${total}=    Evaluate    ${total} + ${d}[1]
        log    ${total}    WARN
    END

06
    ${y}=    Create Dictionary    d=13    e=14    f=15
    Log Dictionary    ${y}
    log    ${y['e']}    WARN
    log    ${y}[e]    WARN
    [Teardown]

07
    ${a}=    Set Variable    ${False}
    IF    NOT ${a}
        Log    sim    WARN
    ELSE
        Log    nao    WARN
    END
    [Teardown]
