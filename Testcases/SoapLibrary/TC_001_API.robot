*** Settings ***
Documentation   Example test cases using SoapLibrary
Resource    Resources.robot
Library     SoapLibrary

Suite Setup     Connect SOAP

*** Test Cases ***
Add Requst With Negative Number
    ${dict}=    Create Dictionary   intA=-100   intB=100
    ${request}=     Generate Request  AddRequest.xml  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  AddResult  0

Add Requst With Character
    ${dict}=    Create Dictionary   intA=-100   intB=A
    ${request}=     Generate Request  AddRequest.xml  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  AddResult  0

Add Request With Max Number Size
    ${dict}=    Create Dictionary   intA=-2147483647   intB=2147483647
    ${request}=     Generate Request  AddRequest.xml  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  AddResult  0

Add Request With Large Number
    ${dict}=    Create Dictionary   intA=-100   intB=2147483648
    ${request}=     Generate Request  AddRequest.xml  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  AddResult  2147483548