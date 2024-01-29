*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/Devenir hote.resource


Test Setup        Ouvrir le Navigateur Et Accéder A l'Application
Test Teardown     Fermer le Navigateur


*** Test Cases ***

Test effectuer une inscription d'hote valide
    Effectuer une inscription valide et se connecter   Didier    Didi@e.r    Didier    Didier
    Supprimer utilisateur

Test Lien Termes et conditions valide
    Ouvrir la page Devenir hote
    Acceder aux termes et conditions
    Verifier que la page redirigée est celle des termes et conditions
    
    