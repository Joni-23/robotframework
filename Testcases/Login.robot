*** Settings ***
Documentation   Test cases for validating login with different credentials
Library     SeleniumLibrary
Test Setup  Open Browser    ${LOGIN_PAGE}   ${DEFAULT_BROWSER}
Test Teardown   Close All Browsers
Force Tags  login   smoke   regression

*** Variables ***
${LOGIN_PAGE}   https://www.saucedemo.com/
${DEFAULT_BROWSER}  firefox

*** Test Cases ***
Validate Succesful User Login
    Fill The Login Form  standard_user  secret_sauce
    Validate Succesful Login
Validate Locked User Login
    Fill The Login Form  locked_out_user  secret_sauce
    Validate Login Error Message Content  Epic sadface: Sorry, this user has been locked out.
Validate Invalid Password Login
    Fill The Login Form  locked_out_user  wrong_password
    Validate Login Error Message Content  Epic sadface: Username and password do not match any user in this service
Validate Empty Username Login
    Fill The Login Form  ${EMPTY}  wrong_password
    Validate Login Error Message Content  Epic sadface: Username is required
Validate Empty password Login
    Fill The Login Form  standard_user  ${EMPTY}
    Validate Login Error Message Content  Epic sadface: Password is required

*** Keywords ***
Fill The Login Form
    [Arguments]     ${username}     ${password}
    Input Text  id:user-name    ${username}     True
    Input Text  id:password     ${password}     True
    Click Element   id:login-button

Validate Login Error Message Content
    [Arguments]     ${content}
    Wait Until Element Contains     //h3[@data-test='error']     ${content}

Validate Succesful Login
    Wait Until Location Is  https://www.saucedemo.com/inventory.html