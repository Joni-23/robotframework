*** Settings ***
Library     RequestsLibrary
Resource     ../../Resources/Resource.robot
Force Tags  RequestsLibrary

*** Variables ***
${URL}  ${BASE_URL}store/order
${JSON_FILE}    post_store_order.json

*** Test Cases ***
Validate 200 Response Status
    ${res}=     POST Request With JSON File  ${URL}  ${JSON_FILE}
    Status Should Be    200     ${res}

Validate Response Status With Invalid Field
    ${json}=    JSON Get From File  ${JSON_FILE}
    ${json}=    JSON Update Value  ${json}  $..petId  abc123
    ${res}=     POST Request With JSON Object  ${URL}  ${json}
    Status Should Not Be    500     ${res}

Validate With Empty Body 200 Response Status
    ${res}=     POST Request With JSON File  ${URL}     empty.json
    Status Should Be    200     ${res}

Validate Id On Response
    ${res}=     POST Request With JSON File  ${URL}  ${JSON_FILE}
    ${expected}=    JSON Get Object Value From File  ${JSON_FILE}  id
    Validate Response Key Value Is Not Equal  ${res}  $..id  ${expected}

Validate PetId On Response
    ${res}=     POST Request With JSON File  ${URL}  ${JSON_FILE}
    ${expected}=    JSON Get Object Value From File  ${JSON_FILE}  petId
    Validate Response Key Value Is Equal  ${res}  $..petId  ${expected}

Validate Quantity On Response
    ${res}=     POST Request With JSON File  ${URL}  ${JSON_FILE}
    ${expected}=    JSON Get Object Value From File  ${JSON_FILE}  quantity
    Validate Response Key Value Is Equal  ${res}  $..quantity  ${expected}

Validate ShipDate On Response
    ${res}=     POST Request With JSON File  ${URL}  ${JSON_FILE}
    ${expected}=    JSON Get Object Value From File  ${JSON_FILE}  shipDate
    Validate Response Key Value Is Equal  ${res}  $..shipDate  ${expected}

Validate Status On Response
    ${res}=     POST Request With JSON File  ${URL}  ${JSON_FILE}
    ${expected}=    JSON Get Object Value From File  ${JSON_FILE}  status
    Validate Response Key Value Is Equal  ${res}  $..status  ${expected}

Validate Complete On Response
    ${res}=     POST Request With JSON File  ${URL}  ${JSON_FILE}
    ${expected}=    JSON Get Object Value From File  ${JSON_FILE}  complete
    Validate Response Key Value Is Equal  ${res}  $..complete  ${expected}