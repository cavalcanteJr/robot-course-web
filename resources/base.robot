*** Settings ***
Library     SeleniumLibrary
Resource    pages/elements.robot

*** Keywords ***
### Hooks
Abrir navegador
    Open Browser    about:blank    chrome
    Set Selenium Implicit Wait      10
    Set Window Size     1440    900
    Go to   https://spotlab.herokuapp.com/

Fechar navegador
    Capture Page Screenshot
    Close Browser

## Shared steps
Então devo ver o alerta "${expect_alert}"
    Element Text Should Be      class:alert        ${expect_alert}