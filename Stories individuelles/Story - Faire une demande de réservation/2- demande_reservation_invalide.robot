*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/commun.resource

Test Setup      Ouvrir le Navigateur Et Accéder A l'Application


*** Test Cases ***
Test De Demande De Réservation Invalide
    Vérifier Que L'Accueil est Visible
    Effectuer une réservation Invalide


*** Keywords ***
Effectuer Une Réservation Invalide
    Rechercher Une Chambre A Réserver
    Choisir La Chambre A Réserver
    Réserver La Chambre Sans Etre Connecté
