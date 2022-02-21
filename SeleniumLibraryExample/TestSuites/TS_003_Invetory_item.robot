*** Settings ***
Documentation   Test cases for validating inventory item
Resource    ../Resources/SeleniumResource.robot
Test Setup  Inventory Item Setup
Test Teardown   Close All Browsers
Force Tags  inventory item

*** Variables ***
${BASE_XPATH}   //div[@class='inventory_item'][1]

*** Keywords ***
Inventory Item Setup
    [Documentation]     Setup for Inventory Item test cases
    Login With Default User
    Set Product Sorter By Value  az

*** Test Cases ***
Validate Inventory Item Title
    Wait Until Element Contains     ${BASE_XPATH}//div[@class='inventory_item_name']    Sauce Labs Backpack

Validate Inventory Item Price
    Wait Until Element Contains     ${BASE_XPATH}//div[@class='inventory_item_price']    $29.99

Validate Inventory Item Description
    Wait Until Element Contains     ${BASE_XPATH}//div[@class='inventory_item_desc']    carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection

Validate Inventory Item Add To Cart
    Wait Until Element Is Visible     ${BASE_XPATH}//button[text()='Add to cart']

Validate Inventory Item Image
     Wait Until Element Is Visible     ${BASE_XPATH}//img

Open Inventory Item Window From Title
    Click Element   ${BASE_XPATH}//div[@class='inventory_item_name']
    Wait Until Element Is Visible   id:inventory_item_container

Open Inventory Item Window From Image
    Click Element   ${BASE_XPATH}//img
    Wait Until Element Is Visible   id:inventory_item_container

Validate Add To Cart Update After Pressing It
    Click Element   ${BASE_XPATH}//button
    Wait Until Element Is Visible     ${BASE_XPATH}//button[text()='Remove']