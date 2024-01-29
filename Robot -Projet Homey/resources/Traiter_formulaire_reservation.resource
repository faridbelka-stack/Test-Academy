*** Settings ***
Library    SeleniumLibrary
Resource    Traiter_commun_reservation.resource

*** Keywords ***
Entrer la date d'arrivée
    [Arguments]    ${date_arrivée}
    Wait Until Element Is Visible    ${CHAMP DATE DE DEBUT}
    Click Element    ${CHAMP DATE DE DEBUT}
    Click Element    ${LIEN MOIS PROCHAIN}
    Click Element    ${date_arrivée}

Entrer la date de départ
    [Arguments]    ${date_départ}
    Click Element    ${CHAMP DATE DE FIN}
    Click Element    ${date_départ}

Entrer le nombre de voyageurs
    [Arguments]    ${nombre_de_voyageurs}
    Click Element    ${CHAMP NOMBRE DE VOYAGEURS}
    FOR    ${i}    IN RANGE    ${nombre_de_voyageurs}
        Click Element    ${AJOUT D UN VOYAGEUR ADULTE}
    END
    Click Button    ${BOUTON VOYAGEURS}

Soumettre le formulaire de réservation
    Click Button    ${BOUTON RESERVER}

Faire une réservation
    [Arguments]    ${date_arrivée}    ${date_départ}    ${nombre_de_voyageurs}
    Entrer la date d'arrivée    ${date_arrivée}
    Entrer la date de départ    ${date_départ}
    Entrer le nombre de voyageurs    ${nombre_de_voyageurs}
    Soumettre le formulaire de réservation