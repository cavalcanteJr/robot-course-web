*** Settings ***				
Library     Collections			
Library     RequestsLibrary
Library     OperatingSystem

Library     ../resources/libs/mongo.py

***Variables***
${base_uri}     http://spotlab-api.herokuapp.com

***Keywords***
Set Token
    [Arguments]     ${email}
    Create Session  spotapi     ${base_uri}
    &{payload}      Create Dictionary   email=${email}
    &{headers}=     Create Dictionary   Content-Type=application/json
    ${response}=    Post Request    spotapi     /sessions   data=${payload}     headers=${headers}
    ${token}        Convert To String   ${response.json()['_id']}
    Set Suite Variable  ${token}  

Get Image
    [Arguments]         ${thumb}
    ${file_data}=       Get Binary File         ${CURDIR}/img/${thumb}
    &{file}=            Create Dictionary       thumbnail=${file_data}
    [return]            ${file}

Save spot
    [Arguments]         ${payload}              ${thumb}
    Create Session      spotapi                 ${base_uri}
    &{headers}=         Create Dictionary       user_id=${token}
    ${response}=        Post Request            spotapi     /spots      files=${thumb}      data=${payload}    headers=${headers}
    [return]            ${response}

Save Spot List
    [Arguments]     ${json_file}

    ${my_spots}=     Get File         resources/fixtures/${json_file}
    ${json}=         Evaluate         json.loads('''${my_spots}''')    json
    ${data}=         Set Variable     ${json['data']}

    :FOR    ${item}     IN      @{data}
    \       ${thumb}=           Get From Dictionary     ${item}         thumb
    \       ${payload}=         Get From Dictionary     ${item}         payload
    \       ${thumb}            Get Image       ${thumb}
    \       Save Spot           ${payload}      ${thumb}