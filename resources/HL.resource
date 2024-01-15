*** Settings ***
Resource          ML.resource

*** Keywords ***

Start On Environment
    [Documentation]    Start on environment.
    ...
    ...    *Description:*
    ...    Start with a pretended environment
    ...
    ...    *Input Arguments:*
    ...    | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Start On Environment |
    ...
    # Owner: Elisabete Escudeiro
    # Tag: DONE
    Start    ${ENVIRONMENT}
    Set Global Variable    ${ENV}    ${${ENVIRONMENT}}

Logout
    [Documentation]    Logout.
    ...
    ...    *Description:*
    ...    Logout of HRPortal
    ...
    ...    *Input Arguments:*
    ...    | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Logout |
    ...
    # Owner: Elisabete Escudeiro
    # Tag: DONE
    Navigate By User Menu    logout

Finish
    [Documentation]    End test suite.
    ...
    ...    *Description:*
    ...    End Test Suite (close browser)
    ...
    ...    *Input Arguments:*
    ...    | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Finish |
    ...
    # Owner: Elisabete Escudeiro
    # Tag: DONE
    Close Browser


Login As "${user}" User
    [Documentation]    Login as user.
    ...
    ...    *Description:*
    ...    Login to HRPortal with the pretended ``user``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | user | Yes | user's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Login As "autoemployee1" User |
    ...
    # Owner: Elisabete Escudeiro
    # Tag: DONE
    Login    ${user}
    Verify "${user}" Logged In

Verify "${user}" Logged In
    [Documentation]    Verifies the user logged in.
    ...
    ...    *Description:*
    ...    Verifies the access to HRPortal site by the pretended ``user``.
    ...
    ...    *Input Arguments:*
    ...    | Argument | Mandatory | Summary | Values | Default |
    ...    | user | Yes | user's name | <string> | N/A |
    ...
    ...    *Output Arguments:*
    ...    | N/A |
    ...
    ...    *Examples:*
    ...    | Verify "Employee1" Logged In |
    ...
    # Owner: Elisabete Escudeiro
    # Tag: DONE
    User Logged In Should Be    ${user}
