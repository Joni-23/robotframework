*** Settings ***
Documentation   Test cases for validating inventory item

Resource    ../Resources/Generic.robot
Resource    ../Resources/InventoryPage.robot
Resource    ../Resources/LoginPage.robot

Test Setup  Inventory Item Setup
Test Teardown   Close All Browsers

Force Tags  inventory item

*** Keywords ***
Inventory Item Setup
    [Documentation]     Setup for Inventory Item test cases
    Open Browser    ${LOGIN_PAGE}   ${DEFAULT_BROWSER}
    Login With Default User
    Wait Until Location Is     ${INVENTORY_PAGE}
    Set Product Sorter By Value  az

*** Test Cases ***
Validate Inventory Item Content
    Inventory Item Field Should Contain By Index    1  ${ITEM_NAME}    Sauce Labs Backpack
    Inventory Item Field Should Contain By Index    1  ${ITEM_PRICE}    $29.99
    Inventory Item Field Should Contain By Index    1  ${ITEM_DESC}    carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection
    Inventory Item Field Should Contain By Index    1  ${ITEM_BTN}       ADD TO CART 

Open Inventory Item Window From Title
    Click Inventory Item Field By Index  1  ${ITEM_NAME}
    Wait Until Location Is  ${INVENTORY_ITEM_PAGE}

Open Inventory Item Window From Image
    Click Inventory Item Field By Index  1  ${ITEM_IMG}
    Wait Until Location Is  ${INVENTORY_ITEM_PAGE}

Validate Inventory Button Updates After Clicking It
    Inventory Item Field Should Contain By Index    1  ${ITEM_BTN}       ADD TO CART
    Click Inventory Item Field By Index  1  ${ITEM_BTN}
    Inventory Item Field Should Contain By Index    1  ${ITEM_BTN}       REMOVE
    Click Inventory Item Field By Index  1  ${ITEM_BTN}
    Inventory Item Field Should Contain By Index    1  ${ITEM_BTN}       ADD TO CART