*** Settings ***
Documentation   Example to use Template
Test Template   Test Case Template


*** Test Cases ***
Add Numbers     10+100  110
Multiply Numbers    10*100  1000
Divide Numbers      100/10  10
Complex Calcuation      (100+50)*4  600


*** Keywords ***
Test Case Template
    [Documentation]     Base for testcase
    [Arguments]     ${input}     ${output}
    ${calculated}=  Evaluate    ${input}
    ${output_number}=   Convert To Number  ${output}
    Should Be Equal As Numbers  ${calculated}     ${output_number}