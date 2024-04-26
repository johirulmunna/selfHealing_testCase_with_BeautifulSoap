*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           Process
Library           prac_test1.py
*** Variables ***
${BROWSER}        Chrome
${URL}            http://localhost:8080/index.html
${idN1}            
${idN2}

*** Test Cases ***
run test
    ${result}=  Run Keyword And Return Status  Click Buttons Test    button1    button2
    Run Keyword If  ${result}==False  Run Keyword  Find and Use Optimal Button Locator
    Run Keyword If  ${result}==False  Rerun Test
    

*** Keywords ***
Find and Use Optimal Button Locator
    ${new_buttons} =  Find New Button Ids    ${URL}  
    ${id11} =     Set Variable    ${new_buttons}[0]
    Set Test Variable    ${idN1}    ${id11}
    ${id22} =     Set Variable    ${new_buttons}[1]
    Set Test Variable    ${idN2}    ${id22}


Click Buttons Test
    [Arguments]    ${id1}
    ...            ${id2}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Button    id= ${id1}
    Sleep    2s
    Handle Alert    action=ACCEPT
    Click Button    id= ${id2}
    Sleep    2s
    Handle Alert    action=ACCEPT
    Close Browser

Rerun Test
    Click Buttons Test    ${idN1}    ${idN2}