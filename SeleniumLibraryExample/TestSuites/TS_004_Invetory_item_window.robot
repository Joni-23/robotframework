*** Settings ***
Documentation   Test cases for validating inventory item

Resource    ../Resources/Generic.robot
Resource    ../Resources/InventoryItemPage.robot
Resource    ../Resources/InventoryPage.robot
Resource    ../Resources/LoginPage.robot

Test Setup  Inventory Item View Setup
Test Teardown   Close All Browsers

Force Tags  inventory item view

*** Variables ***
${BASE_XPATH}   //div[@class='inventory_details']

*** Keywords ***
Inventory Item View Setup
    [Documentation]     Setup for Inventory Item test cases
    Open Browser    ${LOGIN_PAGE}   ${DEFAULT_BROWSER}
    Login With Default User
    Wait Until Location Is     ${INVENTORY_PAGE}
    Set Product Sorter By Value  az
    Click Element   //div[@class='inventory_item'][3]//div[@class='inventory_item_name']

*** Test Cases ***
Validate Inventory Item Detail Content
    Inventory Item Detail Field Should Contain  ${ITEM_DETAILS_NAME}    Sauce Labs Bolt T-Shirt
    Inventory Item Detail Field Should Contain  ${ITEM_DETAILS_PRICE}    $15.99
    Inventory Item Detail Field Should Contain  ${ITEM_DETAILS_DESC}    Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt
    Inventory Item Detail Field Should Contain  ${ITEM_DETAILS_BTN}     ADD TO CART

Open Inventory View
    Click Element   id:back-to-products
    Wait Until Location Is      https://www.saucedemo.com/inventory.html

Validate Button Update After Pressing It
    Inventory Item Detail Field Should Contain  ${ITEM_BTN}       ADD TO CART
    Click Inventory Detail Field    ${ITEM_DETAILS_BTN}
    Inventory Item Detail Field Should Contain  ${ITEM_BTN}       REMOVE
    Click Inventory Detail Field    ${ITEM_DETAILS_BTN}
    Inventory Item Detail Field Should Contain  ${ITEM_BTN}       ADD TO CART