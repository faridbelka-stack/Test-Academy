*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHAMP NOM UTILISATEUR}    name=username
${CHAMP MOT DE PASSE}    name=password
${CHAMP DATE DE DEBUT}    name=arrive
${CHAMP DATE DE FIN}    name=depart
${CHAMP NOMBRE DE VOYAGEURS}    name=guests
${CHAMP MESSAGE D'ERREUR}    css=.notify
${TEXTE REFUS}    xpath=//div[@id='decline-reservation']/div/form/div/textarea
${ETAT RESERVATION DANS RESERVATION}    css=.label
