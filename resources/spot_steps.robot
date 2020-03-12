*** Settings ***
Resource    base.robot
Resource    services.robot
Library     ./libs/mongo.py

***Variables***
${price}        ${EMPTY}

*** Keywords ***
Dado que eu estou logado como "${email}"
    Input Text                      ${INPUT_EMAIL}        ${email}
    Click Element                   ${BUTTON_SUBMIT}
    Page Should Contain Element     ${DIV_DASH}

E que eu tenho um spot disponivel na empresa "${company}"
    Set Test Variable     ${company}
    Remove Company          ${company}

E este spot possui uma imagem "${picture}"
    Set Test Variable     ${picture}

E usamos as seguintes tecnologia "${techs}"
    Set Test Variable     ${techs}

E o valor da diaria é de "${price}" reais
    Set Test Variable     ${price}

Quando eu faço o cadastro deste spot
    Click Link          /new
    Run Keyword if      "${picture}"
    ...                 Choose File     ${INPUT_THUMB}    ${CURDIR}/img/${picture}

    Input Text          ${INPUT_COMPANY}        ${company}
    Input Text          ${INPUT_THECS}          ${techs}
    Input Text          ${INPUT_PRICE}          ${price}
    Click Element       ${BUTTON_SUBMIT}
    ### O clique do botão Poderia ser por xpath com o seguinte codigo
    ### //button[contains(text(), 'Cadastrar')]

Então devo ver o spot no dashboard
    Wait Until Element Is Visible   ${LI_POST_ITEM}
    Element Should Contain          ${UL_POST_ITEM}     ${company}

E o valor da diaria é de "${price}"
    Element Should Contain          ${UL_POST_ITEM}     ${price}

Dado que a conta "${email}" possui 4 spots
    Set Suite Variable  ${email}
    Set Token           ${email}
    Save Spot List      spots.json

Quando acesso o dashboard
    Dado que eu estou logado como "${email}"

Então devo ver a seguinte mensagem "${expect_message}"
    Page Should Contain Element     //button[contains(text(), '${expect_message}')]