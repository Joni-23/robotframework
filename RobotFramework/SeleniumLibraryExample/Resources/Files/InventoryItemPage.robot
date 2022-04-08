*** Settings ***
Documentation   Keyword collection for helping automate inventory item page 
Resource    Head.robot

*** Variables ***
${ITEM_DETAILS_NAME}    inventory_details_name
${ITEM_DETAILS_DESC}    inventory_details_desc
${ITEM_DETAILS_PRICE}    inventory_details_price
${ITEM_DETAILS_IMG}    inventory_details_img
${ITEM_DETAILS_BTN}     btn_inventory

*** Keywords ***
Inventory Item Detail Field Should Contain
    [Documentation]     Validate Inventory item content 
    [Arguments]     ${field}    ${value}
    Element Should Contain      //*[contains(@class, '${field}')]      ${value}

Click Inventory Detail Field
    [Documentation]     Validate Inventory item content 
    [Arguments]     ${field}
    Click Element      //*[contains(@class, '${field}')]