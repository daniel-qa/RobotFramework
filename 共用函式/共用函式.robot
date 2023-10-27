*** Settings ***
Documentation     IES5 自動腳本- 共用函式
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${LOGIN_URL}      https://ies5-rc.teammodel.net

${USERNAME}       1638500251
${PASSWORD}       a12345678

${STD_USERNAME}       1630302566
${STD_PASSWORD}       a12345678



#*** Test Cases ***
#TestMain
#	[Documentation]    教師登入	
#	
#	開瀏覽器
#
#	教師登入    ${STD_USERNAME}    ${STD_PASSWORD} 
#	#Sleep  10s
#	#教師登出
#	
##	學生登入
##	Sleep  10s
	



*** Keywords ***
教師登入
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
	
	#Log    驗證登入狀態
	#Sleep    1s
	#Element Should Be Visible    css=.icon-home
	
教師登出
	MyJS_Click    css=.ivu-icon-md-power	

學生登入
    [Documentation]    執行登入動作
    #Open Browser    ${LOGIN_URL}    chrome
    #Maximize Browser Window
	Go To    ${LOGIN_URL}
	Sleep    3s
	Click Element    xpath=//img[contains(@src,'icon_student')]
    Input Text    id=tmdID    ${STD_USERNAME}
    Input Password    id=tmdpw    ${STD_PASSWORD}
	Sleep    2s
	
	${ele}    Get WebElement    css=.tmd-login-box:first-child .ivu-icon-md-arrow-forward
	Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele} 
	
	#Element Should Be Visible    xpath=//div[contains(text(),'Welcome')]

	
MyJS_Click
	[Arguments]    ${myelm}	
	${ele}    Get WebElement    ${myelm}
        Execute Javascript    arguments[0].click();     ARGUMENTS    ${ele} 

開瀏覽器
    [Documentation]    執行登入動作
    Open Browser    ${LOGIN_URL}    chrome
    Maximize Browser Window
	Sleep    5s	


	
