*** Settings ***
Documentation   Head Resources file. Contains commonly used variables and Keywords
...             Other keywords uses this file as resource. 

Library     SeleniumLibrary


*** Variables ***
${DEFAULT_BROWSER}      headlesschrome

${LOGIN_PAGE}               https://www.saucedemo.com/
${INVENTORY_PAGE}           https://www.saucedemo.com/inventory.html
${INVENTORY_ITEM_PAGE}      https://www.saucedemo.com/inventory-item.html?id=4
${CART_PAGE}                https://www.saucedemo.com/cart.html
${CHECKOUT_1_PAGE}          https://www.saucedemo.com/checkout-step-one.html
${CHECKOUT_2_PAGE}          https://www.saucedemo.com/checkout-step-two.html
${CHECKOUT_COMPELETE_PAGE}  https://www.saucedemo.com/checkout-complete.html

*** Keywords ***
Open My Browser
    [Arguments]    ${url}
    IF      "${DEFAULT_BROWSER}" == "headlessfirefox"
        Open Headless Firefox    ${url}
    ELSE IF     "${DEFAULT_BROWSER}" == "headlesschrome"
        Open Headless Chrome     ${url}
    ELSE
        Open Browser    ${url}  ${DEFAULT_BROWSER}
    END

Open Headless Chrome
    [Arguments]    ${url}
    ${chrome_options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --disable-dev-shm-usage
    Call Method    ${chrome_options}    add_argument    --headless
    Call Method    ${chrome_options}    add_argument    --disable-gpu
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --disable-setuid-sandbox
    Create Webdriver    Chrome    chrome_options=${chrome_options}
    Set Window Size    1920    1080
    Go To    ${url}
    
Open Headless Firefox
    Log     Open headless Firefox will be added later

Click About From Sidebar
    [Documentation]     Click About inside sidebar
    Click Element   id:about_sidebar_link

Click All Items From Sidebar
    [Documentation]     Click All Items inside sidebar
    Click Element   id:inventory_sidebar_link

Click Logout From Sidebar
    [Documentation]     Click Logout inside sidebar
    Click Element   id:logout_sidebar_link

Click Reset App State From Sidebar
    [Documentation]     Click Reset App State inside sidebar
    Click Element   id:reset_sidebar_link

Click Shopping Icon
    [Documentation]     Click Shopping cart icon (Opens Cart window)
    Click Element   class:shopping_cart_link

Open Sidebar
    [Documentation]     Opens sidebar on burger-icon
    Click Element   id:react-burger-menu-btn