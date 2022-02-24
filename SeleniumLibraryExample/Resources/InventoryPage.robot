*** Settings ***
Documentation   Keyword collection for helping automate inventory page
Library     SeleniumLibrary
Resource    Generic.robot

*** Variables ***
${ITEM_NAME}    inventory_item_name
${ITEM_DESC}    inventory_item_desc
${ITEM_PRICE}    inventory_item_price
${ITEM_IMG}    inventory_item_img
${ITEM_BTN}     btn_inventory

*** Keywords ***
Set Product Sorter By Value
    [Documentation]     Select product sorter value based value
    [Arguments]     ${id}
    Select From List By Value   class:product_sort_container    ${id}

Inventory Item Field Should Contain By Index
    [Documentation]     Validate Inventory item content 
    [Arguments]     ${index}    ${field}    ${value}
    Element Should Contain      //div[@class='inventory_item'][${index}]//*[contains(@class, '${field}')]      ${value}

Click Inventory Item Field By Index
    [Documentation]     Validate Inventory item content 
    [Arguments]     ${index}    ${field}
    Click Element      //div[@class='inventory_item'][${index}]//*[contains(@class, '${field}')]