*** Settings ***
Documentation   Keyword collection for helping automate Login page
Library     SeleniumLibrary

*** Variables ***
${LOGIN_PAGE}  https://www.saucedemo.com/
${DEFAULT_BROWSER}  firefox

${DEFAULT_USER}     standard_user
${DEFAULT_PASS}     secret_sauce

*** Keywords ***
Login With Default User
    [Documentation]     Use default username to login
    Open Login Page
    Fill The Login Form  ${DEFAULT_USER}    ${DEFAULT_PASS}
    
Open Login Page
    [Documentation]     Default Keyword for opening login window
    Open Browser    ${LOGIN_PAGE}     ${DEFAULT_BROWSER}

Fill The Login Form
    [Documentation]     Use given username and password to login
    [Arguments]     ${username}     ${password}
    Input Text  id:user-name    ${username}     True
    Input Text  id:password     ${password}     True
    Click Element   id:login-button

Validate Login Error Message Content
    [Documentation]     Validate login error message content
    [Arguments]     ${content}
    Wait Until Element Contains     //h3[@data-test='error']     ${content}

Validate Succesful Login
    [Documentation]     Validate that login was succesful
    Wait Until Location Is  https://www.saucedemo.com/inventory.html

Validate Login window
    [Documentation]     Validate that login window is open
    Wait Until Location Is  ${LOGIN_PAGE}