*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/commun.resource
Resource    ../resources/Réaliser une recherche simple.resource

Test Setup        Ouvrir le Navigateur Et Accéder A l'Application
Test Teardown     Fermer le Navigateur


*** Test Cases ***
Test Utilisateur Recherche Avec Un Critère Non Valide
    Entrer Voyageurs Adultes En Input    abc
    Cliquer Sur Le Bouton Chercher
    Vérifier Qu'On Est Toujours Sur La Page D'Accueil

