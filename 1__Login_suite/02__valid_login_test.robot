*** Settings ***
Documentation   This file contains test cases related to invalid login
Resource    ../Resource/Base/Common_functionalities.resource
Test Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser
Test Template       Valid Login Template
*** Test Cases ***
TC1     Admin   admin123   Dashboard

*** Keywords ***
Valid Login Template
    [Arguments]     ${username}     ${password}     ${expected_header}
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Element Should Contain    xpath=//h6[contains(normalize-space(),'Dashboard')]     ${expected_header}

