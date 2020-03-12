*** Settings ***
Documentation   Spots
...     Para que eu disponibilizar spots de empresas para locação
...     Sendo um administrado de sposts
...     Quero poder cadastrar novas empresas
Resource    ../../resources/spot_steps.robot

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

*** Test Cases ***

Novo spots
    Dado que eu estou logado como "llcj@google.com"
    E que eu tenho um spot disponivel na empresa "Google"
    E este spot possui uma imagem "google.jpg"
    E usamos as seguintes tecnologia "java, ruby, python"
    E o valor da diaria é de "10" reais
    Quando eu faço o cadastro deste spot
    Então devo ver o spot no dashboard
    E o valor da diaria é de "R$10/dia" reais

Spot Gratuito
    Dado que eu estou logado como "llcj@google.com"
    E que eu tenho um spot disponivel na empresa "Acme"
    E este spot possui uma imagem "acme.jpg"
    E usamos as seguintes tecnologia "java, python"
    Quando eu faço o cadastro deste spot
    Então devo ver o spot no dashboard
    E o valor da diaria é de "GRATUITO"

Limite de spots
    Dado que a conta "lourival@jr.com" possui 4 spots
    Quando acesso o dashboard
    Então devo ver a seguinte mensagem "Você pode cadastrar até 4 spots"
