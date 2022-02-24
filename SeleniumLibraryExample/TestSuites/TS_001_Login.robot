*** Settings ***
Documentation   Test cases for validating login with different credentials

Library     SeleniumLibrary

Resource    ../Resources/LoginPage.robot
Resource    ../Resources/Generic.robot

Test Setup      Open Browser    ${LOGIN_PAGE}   ${DEFAULT_BROWSER}
Test Teardown   Close All Browsers

Force Tags  login

*** Test Cases ***
Validate Succesful User Login
    Input Username And Password  standard_user  secret_sauce
    Click Login Button
    Wait Until Location Is     ${INVENTORY_PAGE}

Validate With Upper Case Username
    Input Username And Password  STANDARD_USER  secret_sauce
    Click Login Button
    Validate Login Error Message Content  Epic sadface: Username and password do not match any user in this service

Validate With Upper Case Password
    Input Username And Password  standard_user  SECRET_SAUCE
    Click Login Button
    Validate Login Error Message Content  Epic sadface: Username and password do not match any user in this service

Validate Locked User Login
    Input Username And Password  locked_out_user  secret_sauce
    Click Login Button
    Validate Login Error Message Content  Epic sadface: Sorry, this user has been locked out.

Validate Invalid Password Login
    Input Username And Password  locked_out_user  wrong_password
    Click Login Button
    Validate Login Error Message Content  Epic sadface: Username and password do not match any user in this service

Validate Empty Username Login
    Input Username And Password  ${EMPTY}  wrong_password
    Click Login Button
    Validate Login Error Message Content  Epic sadface: Username is required

Validate Empty password Login
    Input Username And Password  standard_user  ${EMPTY}
    Click Login Button
    Validate Login Error Message Content  Epic sadface: Password is required

