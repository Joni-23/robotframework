*** Settings ***
Documentation   Keyword collection for helping automate login page
Library     SeleniumLibrary
Resource    Generic.robot

*** Variables ***
${DEFAULT_USER}     standard_user
${DEFAULT_PASS}     secret_sauce

*** Keywords ***
Click Login Button
    [Documentation]     Used to click login button
    Click Element   id:login-button

Input Username And Password
    [Documentation]     Used to fill username and password fields
    [Arguments]     ${username}     ${password}
    Input Text  id:user-name    ${username}     True
    Input Text  id:password     ${password}     True

Login With Default User
    [Documentation]     Use default username to login
    Input Username And Password  ${DEFAULT_USER}    ${DEFAULT_PASS}
    Click Login Button

Validate Login Error Message Content
    [Documentation]     Validate login error message content
    [Arguments]     ${content}
    Wait Until Element Contains     //h3[@data-test='error']     ${content}