*** Settings ***
Library    SeleniumLibrary
Resource    commun.resource
*** Variables ***

${BOUTON HOTE}    xpath=//a[contains(text(),'Devenir un hôte')]
${CHAMP NOM UTILISATEUR}    xpath=//input[@name='username']
${CHAMP EMAIL}    xpath=//input[@name='useremail']
${CHAMP MOT DE PASSE}    xpath=//input[@name='register_pass']
${CHAMP CONFIRMER MOT DE PASSE}    xpath=//input[@name='register_pass_retype']
${CHAMP MESSAGE ERREUR}    css=.register_module_wrap .error
${CASE TERMES ET CONDITIONS}    xpath=//input[@name='term_condition']
${LIEN TERMES ET CONDITIONS}    xpath=//a[contains(text(),'termes et conditions')]
${BOUTON SINSCRIRE}    xpath=//button[@type='submit']
${CHAMP CONNEXION USERNAME}    xpath=(//input[@name='username'])[2]
${CHAMP CONNEXION MDP}    xpath=//input[@name='password']
${BOUTON CONNEXION}    xpath=(//button[@type='submit'])[5]
${VIDE}   
${BOUTON PROFIL}    xpath=(//a[contains(text(),'Profil')])[2]
${BOUTON SUPPRIMER}    xpath=(//button[@type='button'])[6]
${VALIDER SUPPRIMER}    xpath=(//button[@type='button'])[8] 

    

*** Keywords ***

Ouvrir le navigateur, accéder au site Homey et à la page Devenir hote
    Ouvrir le Navigateur Et Accéder A l'Application
    Wait Until Element Is Visible    ${BOUTON HOTE}
    Click Element    ${BOUTON HOTE}

Ouvrir la page Devenir hote
    Wait Until Element Is Visible    ${BOUTON HOTE}
    Click Element    ${BOUTON HOTE}

Remplir le champ Nom d'utilisateur
    [Arguments]    ${nom_utilisateur}
    Click Element    ${CHAMP NOM UTILISATEUR}
    Input Text    ${CHAMP NOM UTILISATEUR}    ${nom_utilisateur}

Remplir le champ Email
    [Arguments]    ${email}
    Click Element    ${CHAMP EMAIL}
    Input Text    ${CHAMP EMAIL}    ${email}

Remplir le champ Mot de passe
    [Arguments]    ${mot_de_passe}
    Click Element    ${CHAMP MOT DE PASSE}
    Input Text    ${CHAMP MOT DE PASSE}    ${mot_de_passe}

Remplir le champ Confirmer mot de passe
    [Arguments]    ${confirmer_mdp}
    Click Element    ${CHAMP CONFIRMER MOT DE PASSE}
    Input Text    ${CHAMP CONFIRMER MOT DE PASSE}    ${confirmer_mdp}

Cocher la case Accepter termes et conditions
    Click Element    ${CASE TERMES ET CONDITIONS}

Valider inscription
    Click Element   ${BOUTON SINSCRIRE}

Vérifier qu'un message d'erreur apparait
    Wait Until Element Is Visible    ${CHAMP MESSAGE ERREUR}
    Page Should Contain Element    ${CHAMP MESSAGE ERREUR}

Effectuer une inscription valide et se connecter
    [Arguments]    ${nom_utilisateur}    ${email}    ${mot_de_passe}    ${confirmer_mdp}
    Click Element    ${BOUTON HOTE}
    Remplir le champ Nom d'utilisateur    ${nom_utilisateur}
    Remplir le champ Email    ${email}
    Remplir le champ Mot de passe    ${mot_de_passe}
    Remplir le champ Confirmer mot de passe    ${confirmer_mdp}
    Cocher la case Accepter termes et conditions
    Valider inscription
    Wait Until Element Is Visible    ${CHAMP CONNEXION USERNAME}
    Click Element    ${CHAMP CONNEXION USERNAME}
    Input Text    ${CHAMP CONNEXION USERNAME}    ${nom_utilisateur}
    Click Element    ${CHAMP CONNEXION MDP}
    Input Text    ${CHAMP CONNEXION MDP}    ${mot_de_passe}
    Click Element    ${BOUTON CONNEXION}

Cliquer sur Termes et Conditions
    Click Element    ${LIEN TERMES ET CONDITIONS}

Vérifier que l'utilisateur est bien sur la page des termes et conditions
    Title Should Be    Termes et conditions - Livraison 3

Acceder aux termes et conditions
    Click Element    ${LIEN TERMES ET CONDITIONS}

Verifier que la page redirigée est celle des termes et conditions
    Title Should Be    Termes et conditions - Livraison 3

Supprimer utilisateur
    Wait Until Element Is Visible    ${BOUTON PROFIL}
    Click Element    ${BOUTON PROFIL}
    Click Element    ${BOUTON SUPPRIMER}
    Click Element    ${VALIDER SUPPRIMER}

Effectuer une inscription non valide
    [Arguments]    ${nom_utilisateur}    ${email}    ${mot_de_passe}    ${confirmer_mdp}
    Remplir le champ Nom d'utilisateur    ${nom_utilisateur}
    Remplir le champ Email    ${email}
    Remplir le champ Mot de passe    ${mot_de_passe}
    Remplir le champ Confirmer mot de passe    ${confirmer_mdp}
    Cocher la case Accepter termes et conditions
    Valider inscription
    Vérifier qu'un message d'erreur apparait
    