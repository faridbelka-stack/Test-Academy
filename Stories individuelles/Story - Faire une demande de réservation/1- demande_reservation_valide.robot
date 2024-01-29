*** Settings ***
Library             SeleniumLibrary
Resource            ../resources/commun.resource

Test Setup          Effectuer Une Connexion Réussie
Test Teardown       Effectuer Une Annulation De Réservation


*** Test Cases ***
Test De Demande De Réservation Réussie
    Vérifier Que Le Tableau De Bord Est Visible
    Retourner A L'Accueil
    Effectuer une réservation


*** Keywords ***
Effectuer Une Réservation
    Rechercher Une Chambre A Réserver
    Choisir La Chambre A Réserver
    Réserver La Chambre En Etant Connecté

Effectuer Une Annulation De Réservation
    Aller Au Tableau De Bord
    Vérifier Message De Réservation
    Annuler Réservation
