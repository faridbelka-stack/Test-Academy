*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${SERVEUR}    livraison3.testacademy.fr
${HOMEY URL}    http://${SERVEUR}/
${NAVIGATEUR}    Chrome

*** Keywords ***
Ouvrir Le Navigateur Et Accéder A La Page d'Accueil
    Open Browser    browser=${NAVIGATEUR}
    Maximize Browser Window
    Go To    ${HOMEY URL}
