*** Settings ***
Documentation   Use CSV file content on test cases
Library     DataDriver  file=TS_002_data.csv   encoding=utf_8   dialect=unix
Test Template   Test Case Template

*** Test Cases ***
Get Items From CSV

*** Keywords ***
Test Case Template
    [Documentation]     Base for testcase
    [Arguments]     ${input}     ${output}
    ${calculated}=  Evaluate    ${input}
    ${output_number}=   Convert To Number  ${output}
    Should Be Equal As Numbers  ${calculated}     ${output_number}