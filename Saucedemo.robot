*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}           chrome
${URL}               http://www.saucedemo.com/
${VALID_USERNAME}    standard_user
${VALID_PASSWORD}    secret_sauce

*** Test Cases ***
Authentification avec succès
    [Tags]  Success
    Open Browser  ${URL}  ${BROWSER}
    Input Text  user-name  ${VALID_USERNAME}
    Input Password  password  ${VALID_PASSWORD}
    Click Button  login-button
    Wait Until Element Is Visible  inventory_container
    Page Should Contain Element  inventory_container

Authentification avec un nom d’utilisateur vide et un mot de passe
    [Tags]  Error
    Open Browser  ${URL}  ${BROWSER}
    Click Button  login-button
    Wait Until Element Is Visible  error-button
    Page Should Contain Element  error-button

Authentification avec un nom d’utilisateur et un mot de passe vide
    [Tags]  Error
    Open Browser  ${URL}  ${BROWSER}
    Click Button  login-button
    Wait Until Element Is Visible  error-button
    Page Should Contain Element  error-button

Authentification avec un utilisateur bloqué
    [Tags]  Error
    Open Browser  ${URL}  ${BROWSER}
    Input Text  user-name  locked_out_user
    Input Password  password  ${VALID_PASSWORD}
    Click Button  login-button
    Wait Until Element Is Visible  error-button
    Page Should Contain Element  error-button

*** Keywords ***
Click Button
    [Arguments]  ${locator}
    Click Element  ${locator}