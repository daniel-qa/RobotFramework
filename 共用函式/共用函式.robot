*** Settings ***
Documentation     自動腳本- 共用函式
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${LOGIN_URL}      https://product.net

${USERNAME}       guest
${PASSWORD}       1234

#*** Test Cases ***
#TestMain
#	[Documentation]    教師登入	
#       登入
#       sleep  5s
#       登出

*** Keywords ***
登入
    [Documentation]    執行登入動作	
    [Arguments]    ${id}=${USERNAME}    ${pwd}=${PASSWORD}
    Click Element    xpath=//img[contains(@src,'/img/icon_teacher')]
    Sleep    1s
    
    ${element_present}    Run Keyword And Return Status    Page Should Contain Element    css=.ivu-icon-md-power
    run keyword if    ${element_present}    教師登出 
    
    Log    選擇教師身分
    Click Element    xpath=//img[contains(@src,'/img/icon_teacher')]
    
    Log    輸入帳密
    #Input Text    id=tmdID    ${USERNAME}
    #Input Password    id=tmdpw    ${PASSWORD}
    
    Input Text    id=tmdID    ${id}
    Input Password    id=tmdpw    ${pwd}
    Sleep    1s
    
    Log    按下登入鍵
    MyJS_Click    css=.ivu-icon-md-arrow-forward	
    
    	
登出
    MyJS_Click    css=.ivu-icon-md-power	
	
MyJS_Click
    [Arguments]    ${myelm}	
    ${ele}    Get WebElement    ${myelm}
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele} 



	
