*** Settings ***
Library    Collections

*** Variables ***
@{english_texts}    This is an English text.    Click here to continue.    Logout
@{french_texts}     Ceci est un texte en français.    Cliquez ici pour continuer.    Déconnexion

*** Keywords ***
Set Website
    [Arguments]    ${site}
    Run Keyword If    '${site}' == 'rc'		Set Suite Variable    ${qrcode}    123
    Run Keyword If    '${site}' == 'org'	Set Suite Variable    ${qrcode}    456
	
Get Text
    [Arguments]    ${index}
    ${text}    Get From List    ${texts}    ${index}
    [Return]    ${text}
	
	
*** Test Cases ***
Test WebSite String
	Set Website    rc
	Log    qrcode Text: ${qrcode}

	Set Website    org
	Log    qrcode Text: ${qrcode}
