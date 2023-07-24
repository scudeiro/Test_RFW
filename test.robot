*** Settings ***
Library           Collections
Library           Dialogs

*** Test Cases ***
01
    Comment    ${w}=    Create Dictionary    'a'=3    'b'=4    'c'=5
    Comment    Log    ${w}['a']    WARN
    Comment    ${y}=    Create Dictionary    d=13    e=14    f=15
    Comment    Log    ${y}[e]    WARN
    Comment    FOR    ${i}    IN    @{y}
    Comment    \    log    ${y}[${i}]    WARN
    Comment    END
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

02
    ${y}=    Create Dictionary    d=13    e=14    f=15
    Log Dictionary    ${y}
    log    ${y['e']}    WARN
    log    ${y}[e]    WARN
    [Teardown]

03
    ${a}=    Set Variable    ${False}
    IF    NOT ${a}
        Log    sim    WARN
    ELSE
        Log    nao    WARN
    END
    [Teardown]
