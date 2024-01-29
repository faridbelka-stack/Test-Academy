*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BOUTON RESERVER}    css=#request_for_reservation
${BOUTON VALIDER}    css=.homey_login_button
${BOUTON COMPTE}    css=.account-loggedin
${BOUTON CHERCHER}    css=.search-button > .btn-primary:nth-child(1)
${BOUTON CHERCHER 2}    css=.homey_half_map_search_btn:nth-child(3)
${BOUTON VOYAGEURS}    xpath=(//button[@type='button'])[7]
${BOUTON ANNULER RESERVATION}    css=.dashboard-sidebar > #cancel-reservation-btn
${LIEN SE CONNECTER}    xpath=//a[contains(text(),'Se connecter')]
${LIEN SE DECONNECTER}    xpath=//a[contains(text(),'Se déconnecter')]
${LIEN PROFIL}    css=.account-loggedin  #css=.img-circle
${LIEN RESERVATIONS}  xpath=(//a[contains(text(),'Réservations')])[3]
${LIEN VOYAGES}  xpath=(//a[contains(text(),'Voyages')])[3]
${LIEN CONFIRMER}    xpath=//a[contains(text(),'Confirmer')]
${BOUTON CONFIRMER}    css=.confirm-offsite-reservation:nth-child(2)
${BOUTON REFUSER}    xpath=(//button[@id='decline-reservation-btn'])[2]
${BOUTON SOUMETTRE REFUS}    xpath=//div[@id='decline-reservation']/div/form/div[2]/button
${LIEN DETAILS}    xpath=//a[contains(text(),'Détails')]
${SELECTIONNER PREMIER VOYAGE}    css=tr:nth-child(1) .btn
${BOUTON SOUMETTRE ANNULATION}    //button[contains(.,'Soumettre')]
${CHAMP RAISON ANNULATION}    //textarea[@id='reason']
${RUBRIQUE RAISON ANNULATION}    css=#reason
${RETURN FROM DETAILS}    css=.fa-mail-reply
${MARQUER COMME PAYÉ}    css=.mark-as-paid > .fa
${CONFIRMER PAIEMENT}    //button[contains(.,'Confirmer')]