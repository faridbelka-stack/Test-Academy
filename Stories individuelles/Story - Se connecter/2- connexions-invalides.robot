*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/commun.resource

Test Setup          Ouvrir le Navigateur Et Accéder A l'Application
Test Template       Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte


*** Test Cases ***
Test Utilisateur Valide Mot De Passe Vide    robot    ${EMPTY}
Test Utilisateur Vide Mot De Passe Valide    ${EMPTY}    robot
Test Utilisateur Vide Mot De Passe Vide    ${EMPTY}    ${EMPTY}
Test Utilisateur Non Valide Mot De Passe Valide    azerty    robot
Test Utilisateur Valide Mot De Passe Non Valide    robot    azerty
Test Utilisateur Non Valide Mot De Passe Non Valide    azerty    azerty


*** Keywords ***
Un Message d'Erreur Doit Etre Visible Apres Une Connexion Incorrecte
    [Arguments]    ${nom_utilisateur}    ${mot_de_passe}
    Accéder A La Page De Connexion
    Entrer Le Nom D'utilisateur    ${nom_utilisateur}
    Entrer Le Mot De Passe    ${mot_de_passe}
    Soumettre Le Formulaire De Connexion
    Vérifier Que Le Message D'Erreur Est Visible
