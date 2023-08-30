*** Settings ***
Library    Collections

*** Keywords ***
Set Website
    [Arguments]    ${site}
    Run Keyword If    '${site}' == 'rc'		Set Suite Variable    ${qrcode}    123
    Run Keyword If    '${site}' == 'org'	Set Suite Variable    ${qrcode}    456

*** Test Cases ***
Test WebSite String
	Set Website    rc
	Log    qrcode Text: ${qrcode}

	Set Website    org
	Log    qrcode Text: ${qrcode}
