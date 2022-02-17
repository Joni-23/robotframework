*** Settings ***
Documentation   Cover SubtractRequest
Resource    Resources.robot
Library     SoapLibrary
Force Tags      SubtractRequest
Suite Setup     Connect SOAP

*** Variables ***
${BASE_XML}     SubtractRequest.xml

*** Test Cases ***
Valid Request With Positive And Negative Number
    ${dict}=    Create Dictionary   intA=-100   intB=100
    ${request}=     Generate Request  ${BASE_XML}  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  SubtractResult  -200

Invalid Request With Number And Character
    ${dict}=    Create Dictionary   intA=-100   intB=A
    ${request}=     Generate Request  ${BASE_XML}  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  ErrorTag  error txt

Valid Request With Largest Number
    ${dict}=    Create Dictionary   intA=0   intB=2147483647
    ${request}=     Generate Request  ${BASE_XML}  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  SubtractResult  -2147483647

Invalid Request With Positive Input OverFlow Number
    ${dict}=    Create Dictionary   intA=0   intB=2147483648
    ${request}=     Generate Request  ${BASE_XML}  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}    ErrorTag  error txt

Invalid Request With Positive Output OverFlow Number
    ${dict}=    Create Dictionary   intA=1   intB=-2147483647
    ${request}=     Generate Request  ${BASE_XML}  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  ErrorTag  error txt

Valid Request With Lowest Number
    ${dict}=    Create Dictionary   intA=-2147483648   intB=0
    ${request}=     Generate Request  ${BASE_XML}  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  SubtractResult  -2147483648

Invalid Request With Negative Input OverFlow Number
    ${dict}=    Create Dictionary   intA=0   intB=-2147483649
    ${request}=     Generate Request  ${BASE_XML}  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  ErrorTag  error txt

Invalid Request With Negative Output OverFlow Number
    ${dict}=    Create Dictionary   intA=-1   intB=2147483648
    ${request}=     Generate Request  ${BASE_XML}  ${dict}
    ${response}=    Call SOAP Method With XML   ${request}
    Validate XML Innertext  ${response}  ErrorTag  error txt