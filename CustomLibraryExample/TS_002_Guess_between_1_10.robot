*** Settings ***
Library     CustomLibrary/GenerateNumbers.py
Library     DataDriver  file=testdata.csv   encoding=utf_8   dialect=unix
Test Template   Guess Number


*** Test Cases ***
Guess Generated Value


*** Keywords ***
Guess Number
    [Arguments]     ${number}
    ${generated}=   Generate Number Between 1 10
    Should Be Equal As Integers  ${number}   ${generated}