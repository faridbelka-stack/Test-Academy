*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/Devenir hote.resource
Test Setup        Ouvrir le navigateur, accéder au site Homey et à la page Devenir hote
Test Teardown     Fermer le Navigateur
Test Template    Effectuer une inscription non valide



*** Test Cases ***
Test Devenir hote Nom utilisateur vide                                           ${VIDE}     robot@r.r    robot      robot
Test Devenir hote Nom utilisateur déjà utilisé                                   robot       robot@r.c    robot      robot
Test Devenir hote Nom utilisateur avec caractère spécial                         robøtt      robot@r.c    robot      robot
Test Devenir hote Email vide                                                     robott      ${VIDE}      robot      robot
Test Devenir hote Email déjà utilisé                                             robott      test@t.t     robot      robot
Test Devenir hote Email dans un mauvais format                                   robott      robot.r@t    robot      robot
Test Devenir hote Email avec caractère spécial                                   robott      robøt@r.c    robot      robot
Test Devenir hote Mot de passe vide                                              robott      robot@r.r    ${VIDE}    robot    
Test Devenir hote Confirmation mot de passe vide                                 robott      robot@r.r    robot      ${VIDE}
Test Devenir hote Mot de passe et Confirmation mot de passe différents           robott      robot@r.r    robot      notrobot  
    
    








    


