*** Settings ***
Resource    base.robot

*** Keywords ***
Dado que eu estou logado como "${email}"
    Set Global Variable     ${email}

Quando eu entro com este email
    Input Text                      ${INPUT_EMAIL}        ${email}
    Click Element                   ${BUTTON_SUBMIT}

Então devo ver a área logada
    Page Should Contain Element     ${DIV_DASH} 