*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${HOMEY URL}    http://livraison3.testacademy.fr
${URL RESERVATION}    http://livraison3.testacademy.fr/index.php/listing/super-annonce/
${NAVIGATEUR}    chrome
${LIEN SE CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${LIEN SE DECONNECTER}    xpath=//a[contains(text(),'Se déconnecter')]
${LIEN ACCUEIL}    xpath=//a[contains(text(),'Accueil')]
${LIEN TABLEAU DE BORD}    xpath=//a[contains(text(),'Tableau de bord')]
${LIEN DETAILS RESERVATION}    xpath=//a[contains(text(),'Détails')]