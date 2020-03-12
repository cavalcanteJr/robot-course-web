*** Settings ***
Documentation   Spots
...     Para que eu disponibilizar spots de empresas para locação
...     Sendo um administrado de sposts
...     Quero poder cadastrar novas empresas
Resource    ../../resources/spot_steps.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador
Test Template   Invalid spot

*** Test Cases ***      thumbnail       company         techs               alert
Empty thumbnail         ${EMPTY}        Google          java, golang        Precisamos da foto da sua empresa!
Empty company           acme.jpg        ${EMPTY}        java, golang        O nome da sua empresa é obrigatório!
Empty techs             yahoo.jpeg       Yahoo           ${EMPTY}           Informe pelo menos uma tecnologia :)

***Keywords***
Invalid spot
    [Arguments]     ${thumbnail}    ${company}  ${techs}    ${alert}
    
    Dado que eu estou logado como "llcj@google.com"
    E que eu tenho um spot disponivel na empresa "${company}"
    E este spot possui uma imagem "${thumbnail}"
    E usamos as seguintes tecnologia "${techs}"
    E o valor da diaria é de "10" reais
    Quando eu faço o cadastro deste spot
    Então devo ver o alerta "${alert}"