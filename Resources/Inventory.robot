*** Settings ***
Documentation   Keyword collection for helping automate Inventory page
Library     SeleniumLibrary



*** Keywords ***
Set Product Sorter By Value
    [Documentation]     Select product sorter value based value
    [Arguments]     ${id}
    Select From List By Value   class:product_sort_container    ${id}

Validate Product Price By Index
    [Arguments]     ${expected}    ${index}
    ${found}=   Get Text    //div[@class='inventory_item'][${index}]//div[@class='inventory_item_price']
    Should Be Equal As Strings  ${expected}     ${found}

Validate Product Name By Index
    [Arguments]     ${expected}    ${index}
    ${found}=   Get Text    //div[@class='inventory_item'][${index}]//div[@class='inventory_item_name']
    Should Be Equal As Strings  ${expected}     ${found}

Log out
    Click Element   id:react-burger-menu-btn
    Click Element   id:logout_sidebar_link