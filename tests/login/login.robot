*** Settings ***
Documentation   Sessão
...     Para que eu possa ter acesso a interface de administraçao de spots
...     Sendo um usuario que possui um email
...     Quero poder iniciar um nova sessao
Resource    ../../resources/login_steps.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***

Nova sessão
    Dado que eu estou logado como "llcj@google.com"
    Quando eu entro com este email
    Então devo ver a área logada

Email incorreto
    [Template]      Tentativa de login
    llcj#google.com       Oops. Informe um email válido!

Outro email incorreto
    [Template]      Tentativa de login
    llcj%google.com       Oops. Informe um email válido!

Email não informado
    [Template]      Tentativa de login
    ${EMPTY}        Oops. Informe um email válido!

*** Keywords ***
Tentativa de login
    [Arguments]                         ${email}       ${msg_alert}
    Dado que eu estou logado como "${email}"
    Quando eu entro com este email
    Então devo ver o alerta "${msg_alert}" 