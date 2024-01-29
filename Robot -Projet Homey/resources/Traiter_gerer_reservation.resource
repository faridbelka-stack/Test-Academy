*** Settings***
Library    SeleniumLibrary
Resource    Traiter_formulaire_reservation.resource
Resource    ../resources/commun.resource


*** Variables ***
${SERVEUR}         livraison3.testacademy.fr
${HOMEY URL}      http://${SERVEUR}/
${URL ANNONCE LOGEMENT}    http://livraison3.testacademy.fr/index.php/listing/test/
${URL RESERVATIONS}    http://livraison3.testacademy.fr/index.php/reservations/
${VOYAGES URL}    http://${SERVEUR}/index.php/dashboard/
${RESERVATION}    http://${SERVEUR}/index.php/reservations/
${NAVIGATEUR}        Chrome
${RESERVATION STATUT}  css=.label
${UTILISATEUR HOTE}     Hosttest
${MOT DE PASSE HOTE}    test
${UTILISATEUR VOYAGEUR}     VoyageurTest
${MOT DE PASSE VOYAGEUR}    test

${TITRE TABLEAU DE BORD}    Tableau de bord - Livraison 3
${ESPACE POUR AFFICHER LES ERREURS}    css=#modal-login .error
${FENETRE CONFIRMER PAIEMENT}    //p[contains(.,'Etes-vous sûr de vouloir faire ça?')]
${COMMENTAIRE ANNULATION}    J'annule la réservation car je suis un robot indécis
${COMMENTAIRE REFUS}    Je ne vous aime pas.



*** Keywords ***

Se Connecter En Tant Que Voyageur
    Se connecter    ${UTILISATEUR VOYAGEUR}    ${MOT DE PASSE VOYAGEUR}

Se Connecter En Tant Que Hote
    Se connecter    ${UTILISATEUR HOTE}    ${MOT DE PASSE HOTE}

Le voyegeur Crée Une Réservation Sur Un Logement
    Le voyegeur Crée Une Réservation Sur Le Logement    ${URL ANNONCE LOGEMENT}
    
Le voyegeur Crée Une Réservation Sur Le Logement
    [Arguments]     ${url annonce}   
    Wait Until Element Is Not Visible    ${CHAMP NOM UTILISATEUR}
    Go To    ${url annonce}    
    Faire une réservation    ${DATE D'ARRIVEE}  ${DATE DE DEPART}  ${2}
    
    

L'Hote Confirme Une Réservation
    Accéder Aux Réservations
    Selectioner La Nouvelle Reservation 
    Confirmer La Réservation
    


L'Hote Refuse Une Nouvelle Réservation 
    Accéder Aux Réservations
    Selectioner La Nouvelle Reservation
    Cliquer sur refuser
    Ecrire la raison du refus    ${COMMENTAIRE REFUS}
    

L'Hote Refuse Une Réservation En Attente de Paiement   
    Accéder Aux Réservations
    Selectioner La Reservation En Attente
    Cliquer sur refuser
    Ecrire la raison du refus    ${COMMENTAIRE REFUS}
    

Marquer Comme Payé Une Réservation
    Accéder Au Voyages
    Selectioner La Première Reservation    DISPONIBLE
    Marquer Comme Payé
    

Annuler Une Réservation En Tant Que Voyageur
    [Arguments]    ${statut}    
    Accéder Au Voyages
    Selectioner La Première Reservation    ${statut}
    Annuler La Réservation    ${COMMENTAIRE ANNULATION}
    


Verifier Le Statut De La Réservation
    [Arguments]    ${statut}    
    Element Text Should Be    ${RESERVATION STATUT}    ${statut}

Vérifier statut réservation sur la page de la réservation
    [Arguments]    ${statut}
    Wait Until Element Contains    ${ETAT RESERVATION DANS RESERVATION}    ${statut}
    Element Text Should Be    ${ETAT RESERVATION DANS RESERVATION}    ${statut}
    

Accéder Aux Réservations
    Wait Until Element Is Visible    ${LIEN RESERVATIONS}
    Click Link    ${LIEN RESERVATIONS}

Retourner Sur La Page Des Voyages
    Click Element    ${RETURN FROM DETAILS}

Accéder Au Voyages
    Go To    ${URL RESERVATIONS}


Selectioner La Nouvelle Reservation
    Wait Until Element Is Visible    ${LIEN CONFIRMER} 
    Click Element    ${LIEN CONFIRMER}
    Wait Until Element Is Visible    ${BOUTON CONFIRMER} 

Selectioner La Reservation En Attente
    Wait Until Element Is Visible    ${LIEN DETAILS} 
    Click Element    ${LIEN DETAILS}
    Wait Until Element Is Visible    ${BOUTON REFUSER}

Selectioner La Première Reservation
    [Arguments]    ${statut réservation}
    Click Element    ${SELECTIONNER PREMIER VOYAGE}
    Element Text Should Be    ${RESERVATION STATUT}    ${statut réservation}

        
Confirmer La Réservation
    Wait Until Element Is Visible    ${BOUTON CONFIRMER}
    Click Button    ${BOUTON CONFIRMER}
    Wait Until Element Is Not Visible    ${BOUTON CONFIRMER}
    Reload Page

Marquer Comme Payé
    Wait Until Element Contains    ${RESERVATION STATUT}    DISPONIBLE
    Click Element    ${MARQUER COMME PAYÉ}
    Wait Until Element Is Visible    ${FENETRE CONFIRMER PAIEMENT}
    Click Element    ${CONFIRMER PAIEMENT}
    Wait Until Element Contains    ${RESERVATION STATUT}    RÉSERVÉ


Cliquer sur refuser
    Click Button    ${BOUTON REFUSER}
    Wait Until Element Is Visible    ${TEXTE REFUS}


Ecrire la raison du refus
    [Arguments]    ${raison}
    Click Element    ${TEXTE REFUS}
    Input Text    ${TEXTE REFUS}    ${raison}
    Click Button    ${BOUTON SOUMETTRE REFUS}

Annuler La Réservation
    [Arguments]    ${raisons annulation}
    Click Button    ${BOUTON ANNULER RESERVATION}
    Wait Until Element Is Visible    ${RUBRIQUE RAISON ANNULATION}
    Click Element     ${CHAMP RAISON ANNULATION}
    Input Text    ${CHAMP RAISON ANNULATION}    ${raisons annulation}
    Click Button    ${BOUTON SOUMETTRE ANNULATION}


En Tant Que Voyageur Annuler Une Réservation
    Accéder Au Voyages
    Click Element    ${SELECTIONNER PREMIER VOYAGE}
    Annuler La Réservation    ${COMMENTAIRE ANNULATION}


