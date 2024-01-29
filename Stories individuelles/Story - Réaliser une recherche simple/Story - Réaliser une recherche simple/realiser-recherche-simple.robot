*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/commun-homey.resource
Resource    ../resources/realiser-recherche-simple.resource

Test Setup    Ouvrir Le Navigateur Et Accéder A La Page d'Accueil


*** Test Cases ***
Test Utilisateur Recherche Sans Critères
    Cliquer Sur Le Bouton Chercher
    Vérifier Que La Page De Résultats De Recherche Est Visible
    Vérifier Que Des Resultats Sont Affichés

Test Utilisateur Recherche Avec Un Critère
    Entrer Destination    Brest
    Cliquer Sur Le Bouton Chercher
    Vérifier Que La Page De Résultats De Recherche Est Visible
    Vérifier Que Des Resultats Sont Affichés
    Vérifier Que Le Premier Resultat A Le Bon Critère Destination    Brest

Test Utilisateur Recherche Avec Plusieurs Critères
    Entrer Destination    San Francisco
    Entrer Voyageurs Adultes    2
    Cliquer Sur Le Bouton Chercher
    Vérifier Que La Page De Résultats De Recherche Est Visible
    Vérifier Que Des Resultats Sont Affichés
    Vérifier Que Le Premier Resultat A Le Bon Critère Destination    San Francisco
    Vérifier Que Le Premier Resultat A Le Bon Critère Nombre De Voyageurs Adultes    2

Test Utilisateur Recherche Avec Critères Valides Sans Résultat
    Entrer Destination    San Francisco
    Entrer Voyageurs Adultes    12
    Cliquer Sur Le Bouton Chercher
    Vérifier Que La Page De Résultats De Recherche Est Visible
    Vérifier Message Aucun Résultat

Test Utilisateur Recherche Avec Un Critère Non Valide
    Entrer Voyageurs Adultes En Input    abc
    Cliquer Sur Le Bouton Chercher
    Vérifier Qu'On Est Toujours Sur La Page D'Accueil

