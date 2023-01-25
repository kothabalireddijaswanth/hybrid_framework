*** Settings ***
Documentation   This file contains test cases for add valid employee
...     records
Resource    ../Resource/Base/Common_functionalities.resource
Library     DataDriver      file=../test_data/orange_data.xlsx      sheet_name=Add_Employee_Data
Test Template      Add Valid Employee Test
Test Setup      Launch Browser And Navigate To Url
Test Teardown       Close Browser

*** Test Cases ***
Employee1_${test_case}
#TC2
#TC3
*** Keywords ***
Add Valid Employee Test
    [Arguments]     ${username}     ${password}     ${first_name}       ${middle_name}      ${last_name}    ${expected_value1}
    ...     ${expected_value2}
    Input Text    name=username        ${username}
    Input Text    name=password        ${password}
    Click Element    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--main orangehrm-login-button']
    Click Element    xpath=(//span[@class='oxd-text oxd-text--span oxd-main-menu-item--name'])[2]
    Click Element    xpath=(//a[@class='oxd-topbar-body-nav-tab-item'])[2]
    Input Text    name=firstName    ${first_name}
    Input Text    name=middleName   ${middle_name}
    Input Text    name=lastName     ${last_name}
    Sleep    10s
    Click Button    xpath=//button[@class='oxd-button oxd-button--medium oxd-button--secondary orangehrm-left-space']
    Wait Until Page Contains    ${expected_value1}
    Element Should Contain    xpath=//h6[@class='oxd-text oxd-text--h6 --strong']    ${expected_value1}
    #Element Should Contain    xpath=//input[@name='firstName']    john
    Element Attribute Value Should Be    name=firstName    value    ${expected_value2}
