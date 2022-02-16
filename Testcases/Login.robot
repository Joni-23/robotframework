*** Settings ***
Documentation   Test cases for validating login with different credentials
Resource    ../Resources/LoginPage.robot
Resource    ../Resources/Inventory.robot
Test Setup  Open Login Page
Test Teardown   Close All Browsers
Force Tags  login   smoke   regression

*** Test Cases ***
Validate Succesful User Login
    Fill The Login Form  standard_user  secret_sauce
    Validate Succesful Login
    Log out
    Validate Login window

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