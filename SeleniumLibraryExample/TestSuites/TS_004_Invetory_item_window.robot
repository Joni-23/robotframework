*** Settings ***
Documentation   Test cases for validating inventory item window
Resource    ../Resources/SeleniumResource.robot
Test Setup  Inventory Item Window Setup
Test Teardown   Close All Browsers
Force Tags  inventory item view

*** Variables ***
${BASE_XPATH}   //div[@class='inventory_details']

*** Keywords ***
Inventory Item Window Setup
    [Documentation]     Setup for Inventory Item test cases
    Login With Default User
    Set Product Sorter By Value  az
    Click Element   //div[@class='inventory_item'][3]//div[@class='inventory_item_name']

*** Test Cases ***
Validate Inventory Item Title
    Wait Until Element Contains     ${BASE_XPATH}//div[@class='inventory_details_name large_size']    Sauce Labs Bolt T-Shirt

Validate Inventory Item Price
    Wait Until Element Contains     ${BASE_XPATH}//div[@class='inventory_details_price']    $15.99

Validate Inventory Item Description
    Wait Until Element Contains     ${BASE_XPATH}//div[@class='inventory_details_desc large_size']    Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt

Validate Inventory Item Add To Cart
    Wait Until Element Is Visible     ${BASE_XPATH}//button[text()='Add to cart']

Validate Inventory Item Image
     Wait Until Element Is Visible     ${BASE_XPATH}//img

Open Inventory View
    Click Element   id:back-to-products
    Wait Until Location Is      https://www.saucedemo.com/inventory.html

Validate Add To Cart Button Update After Pressing It
    Click Element   ${BASE_XPATH}//button
    Wait Until Element Is Visible     ${BASE_XPATH}//button[text()='Remove']