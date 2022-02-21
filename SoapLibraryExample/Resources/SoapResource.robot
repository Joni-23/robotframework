*** Settings ***
Documentation   Help to automate SOAPLibrary based test cases
Library     SoapLibrary

*** Variables ***
${DEFAULT_XML_PATH}     SoapLibraryExample/Resources/XML/
${DEFAULT_CLIENT}   http://www.dneonline.com/calculator.asmx?WSDL

*** Keywords ***
Connect SOAP
    [Documentation]     Connects to SOAP client
    Create Soap Client  ${DEFAULT_CLIENT}

Generate Request
    [Documentation]     Update request values
    [Arguments]     ${xml}  ${new_values}
    ${edited}=    Edit XML Request    ${DEFAULT_XML_PATH}${xml}   ${new_values}   GeneratedRequest
    Log     ${xml}
    Log     ${edited}
    [return]    ${edited}

Validate XML Innertext
    [Documentation]     Validate innertext value with given parameters
    [Arguments]     ${response}     ${tag}     ${expected}
    ${found}=    Get Data From XML By Tag    ${response}     ${tag}
    Should Be Equal     ${found}    ${expected}