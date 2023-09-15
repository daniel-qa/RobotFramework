*** Settings ***
Library    SeleniumLibrary

# Suite Setup       登入
Suite Teardown    關閉Browser

*** Test Cases ***
Open Google and Search
    Open Browser    https://www.google.com    chrome
	Maximize Browser Window
    #Go To           ${URL}
    #Reload Page                      # 刷新页面
    Input Text    name=q    自動化測試
    Press Keys    name=q    \n   # \n 對應Enter鍵
    Sleep    2s

    Log    將滑鼠停留在某物件上
    ${element}    Get WebElement    id=logo
    Mouse Over    ${element}

*** Keywords ***
關閉Browser
    [Documentation]    關閉Browser
    Close Browser
