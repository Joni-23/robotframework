*** Settings ***
Documentation   Test cases for validating product sorter
Resource    ../Resources/SeleniumResource.robot
Test Setup  Login With Default User
Test Teardown   Close All Browsers
Force Tags  product sorter

*** Test Cases ***
Validate Product Sorter at High To Low
    Set Product Sorter By Value     hilo
    Validate Product Price By Index  $49.99  1
    Validate Product Price By Index  $7.99  6

Validate Product Sorter at Low To High
    Set Product Sorter By Value     lohi
    Validate Product Price By Index  $7.99  1
    Validate Product Price By Index  $49.99  6

Validate Product Sorter at Name A To Z
    Set Product Sorter By Value     az
    Validate Product Name By Index  Sauce Labs Backpack  1
    Validate Product Name By Index  Test.allTheThings() T-Shirt (Red)  6

Validate Product Sorter at Name Z To A
    Set Product Sorter By Value     za
    Validate Product Name By Index  Test.allTheThings() T-Shirt (Red)  1
    Validate Product Name By Index  Sauce Labs Backpack  6    