*** Settings ***
Documentation   Test cases for validating product sorter

Library     SeleniumLibrary

Resource    ../Resources/Generic.robot
Resource    ../Resources/InventoryPage.robot
Resource    ../Resources/LoginPage.robot

Test Setup  Fill Login Information
Test Teardown   Close All Browsers

Force Tags  product sorter

*** Keywords ***
Fill Login Information
    Open Browser    ${LOGIN_PAGE}   ${DEFAULT_BROWSER}
    Login With Default User
    Wait Until Location Is     ${INVENTORY_PAGE}

*** Test Cases ***
Validate Product Sorter at High To Low
    Set Product Sorter By Value     hilo
    Inventory Item Field Should Contain By Index  1  ${ITEM_PRICE}  $49.99
    Inventory Item Field Should Contain By Index  6  ${ITEM_PRICE}  $7.99

Validate Product Sorter at Low To High
    Set Product Sorter By Value     lohi
    Inventory Item Field Should Contain By Index  1  ${ITEM_PRICE}  $7.99
    Inventory Item Field Should Contain By Index  6  ${ITEM_PRICE}  $49.99

Validate Product Sorter at Name A To Z
    Set Product Sorter By Value     az
    Inventory Item Field Should Contain By Index  1  ${ITEM_NAME}  Sauce Labs Backpack
    Inventory Item Field Should Contain By Index  6  ${ITEM_NAME}  Test.allTheThings() T-Shirt (Red)

Validate Product Sorter at Name Z To A
    Set Product Sorter By Value     za
    Inventory Item Field Should Contain By Index  1  ${ITEM_NAME}  Test.allTheThings() T-Shirt (Red)
    Inventory Item Field Should Contain By Index  6  ${ITEM_NAME}  Sauce Labs Backpack