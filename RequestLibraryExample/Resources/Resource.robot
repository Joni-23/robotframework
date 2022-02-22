*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary

*** Variables ***
${BASE_URL}     https://petstore.swagger.io/v2/
${JSON_PATH}    ${CURDIR}/JSON/

*** Keywords ***
JSON Get From File
    [Documentation]     Loads JSON object from given file
    [Arguments]     ${file}
    ${json}=    Load JSON From File     ${JSON_PATH}${file}
    [Return]    ${json}

JSON Get Object Value From File
    [Documentation]     Get JSON object value from given parameters
    [Arguments]     ${file}     ${object}
    ${json}=    JSON Get From File  ${file}
    ${found}=  Get Value From Json     ${json}     ${object}
    [Return]    ${found}

JSON Update Value
    [Documentation]     Updates JSON object value
    [Arguments]     ${json}     ${object}   ${value}
    ${new}      Update Value To Json    ${json}     ${object}   ${value}
    [Return]    ${new}

POST Request With JSON Object
    [Documentation]     POST Request with JSON object
    [Arguments]     ${url}  ${json}
    ${res}=     POST    ${url}   json=${json}
    [Return]    ${res}

POST Request With JSON File
    [Documentation]     POST Request with JSON file path
    [Arguments]     ${url}  ${json_file}
    ${json}=    Load JSON From File     ${JSON_PATH}${json_file}
    ${res}=     POST    ${url}   json=${json}
    [Return]    ${res}

Validate Response Key Value Is Equal
    [Documentation]     Validate Response Key value is equal
    [Arguments]     ${res}  ${object}     ${expected}
    ${json}=     Convert String to JSON  ${res.content}
    ${object}=  Get Value From Json     ${json}     ${object}
    Should Be Equal     ${expected}     ${object}

Validate Response Key Value Is Not Equal
    [Documentation]     Validate Response Key value is not equal
    [Arguments]     ${res}  ${object}     ${expected}
    ${json}=     Convert String to JSON  ${res.content}
    ${object}=  Get Value From Json     ${json}     ${object}
    Should Not Be Equal     ${expected}     ${object}