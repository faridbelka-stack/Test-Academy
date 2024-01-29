*** Settings ***
Library    SeleniumLibrary
Resource    commun.resource

*** Variables ***
${BOUTON CHERCHER}    xpath=//*[@id="section-body"]/section/div[2]/div[1]/form/div[4]/button
${TITRE RESULTATS DE RECHERCHE}    Search Results - Livraison 3
${PREMIER RESULTAT}    xpath=//*[@id="homey_halfmap_listings_container"]/div[1]
${BOUTON DESTINATION}    xpath=//*[@id="section-body"]/section/div[2]/div[1]/form/div[1]
${CHAMP DESTINATION}    xpath=//*[@id="section-body"]/section/div[2]/div[1]/form/div[1]/div/div/div/input
${BOUTON SUGGESTION}    xpath=//li[@class="active"]
${ADRESSE DESTINATION RESULTAT}    xpath=//address
${BOUTON VOYAGEURS}    xpath=//*[@id="section-body"]/section/div[2]/div[1]/form/div[3]
${INPUT VOYAGEURS}    name=guest
${BOUTON AJOUTER VOYAGEUR ADULTE}    xpath=//*[@id="section-body"]/section/div[2]/div[1]/form/div[3]/div/div[1]/button[1]
${BOUTON VOYAGEUR APPLIQUER}    xpath=//*[@id="section-body"]/section/div[2]/div[1]/form/div[3]/div/div[4]/button
${NOMBRE VOYAGEUR RESULTAT}    xpath=//ul[@class="item-amenities"]/li[3]/span[1]
${MESSAGE PAS DE RESULTAT}    xpath=//div[@id="homey_halfmap_listings_container"]/div[@class="map-notfound"]


*** Keywords ***
Cliquer Sur Le Bouton Chercher
    Click Element    ${BOUTON CHERCHER}

Vérifier Que La Page De Résultats De Recherche Est Visible
    Wait Until Element Is Not Visible    ${BOUTON CHERCHER}
    Title Should Be    ${TITRE RESULTATS DE RECHERCHE}

Vérifier Que Des Resultats Sont Affichés
    Element Should Be Visible    ${PREMIER RESULTAT}

Entrer Destination
    [Arguments]    ${destination}
    Click Element    ${BOUTON DESTINATION}
    Click Element    ${CHAMP DESTINATION}
    Input Text    ${CHAMP DESTINATION}    ${destination}
    Wait Until Element Is Visible    ${BOUTON SUGGESTION}
    Click Element    ${BOUTON SUGGESTION}

Entrer Voyageurs Adultes
    [Arguments]    ${nombre de voyageurs adultes}
    Click Element    ${BOUTON VOYAGEURS}
    FOR    ${i}    IN RANGE    0    ${nombre de voyageurs adultes}
        Click Element    ${BOUTON AJOUTER VOYAGEUR ADULTE}
    END
    Click Element    ${BOUTON VOYAGEUR APPLIQUER}
    
Entrer Voyageurs Adultes En Input
    [Arguments]    ${nombre de voyageurs adultes}
    Click Element     ${BOUTON VOYAGEURS}
    Input Text    ${INPUT VOYAGEURS}    ${nombre de voyageurs adultes}

Vérifier Que Le Premier Resultat A Le Bon Critère Destination
    [Arguments]    ${destination}
    Wait Until Element Is Visible    ${ADRESSE DESTINATION RESULTAT}
    ${resultats} =     Get WebElements    ${ADRESSE DESTINATION RESULTAT}
    FOR    ${resultat}    IN    @{resultats}
        Element Should Contain    ${resultat}    ${destination}    ignore_case=True
    END

Vérifier Que Le Premier Resultat A Le Bon Critère Nombre De Voyageurs Adultes
    [Arguments]    ${nombre de voyageurs adultes}
    Wait Until Element Is Visible    ${NOMBRE VOYAGEUR RESULTAT}
    ${resultats} =     Get WebElements    ${NOMBRE VOYAGEUR RESULTAT}
    FOR    ${resultat}    IN    @{resultats}
        Element Should Contain    ${resultat}    ${nombre de voyageurs adultes}    ignore_case=True
    END

Vérifier Message Aucun Résultat
    Wait Until Element Is Visible    ${MESSAGE PAS DE RESULTAT}
    Element Should Contain    ${MESSAGE PAS DE RESULTAT}    Nous n'avons trouvé aucun résultat

Vérifier Qu'On Est Toujours Sur La Page D'Accueil
    ${url_actuelle}    Get Location
    Should Be Equal As Strings    ${url_actuelle}    ${HOMEY URL}
