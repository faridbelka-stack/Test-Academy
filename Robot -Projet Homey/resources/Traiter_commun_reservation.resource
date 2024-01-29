*** Settings ***
Library    SeleniumLibrary
Resource    Traiter_champs.resource
Resource    Traiter_liens.resource
Resource    Traiter_boutons.resource

*** Variables ***
${TITRE TABLEAU DE BORD}    Tableau de bord - Livraison 3

# Dates de voyage valides
${LIEN MOIS PROCHAIN}    xpath=//div[@id='single-booking-search-calendar']/div[13]/button[2]
${DATE D'ARRIVEE}    xpath=//div[@id='single-booking-search-calendar']/div[3]/ul[2]/li[16]
${DATE DE DEPART}    xpath=//div[@id='single-booking-search-calendar']/div[3]/ul[2]/li[19]/span

# Nombre de voyageurs
${VOYAGEURS VIDE}    0
${VOYAGEURS}    ${2}
${AJOUT D UN VOYAGEUR ADULTE}    css=.sidebar-booking-module-body:nth-child(2) .adult_plus

# Numéro de réservation (id)
${NUMERO RESERVATION VOYAGEUR}    css=tr:nth-child(1) > td:nth-child(2)
${NUMERO RESERVATION HOTE}    css=tr:nth-child(1) > td:nth-child(2)

