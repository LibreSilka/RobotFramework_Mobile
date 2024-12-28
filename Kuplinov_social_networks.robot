*** Settings ***
Library           AppiumLibrary
#Suite Setup       Open Application    http://127.0.0.1:4723    automationName=UiAutomator2
#Suite Teardown    Close Application

*** Variables ***
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}      15
${DEVICE_NAME}           sdk_gphone64_x86_64
${UDID}                 emulator-5554
${YT_PACKAGE}           com.google.android.youtube
${YT_ACTIVITY}          com.google.android.apps.youtube.app.watchwhile.WatchWhileActivity
${CHROME_PACKAGE}       com.android.chrome
${CHROME_ACTIVITY}      com.google.android.apps.chrome.Main
${SEARCH_TEXT}          Kuplinov play

*** Keywords ***
Setup YouTube
    Open Application    http://127.0.0.1:4723
    ...    automationName=UiAutomator2
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    udid=${UDID}
    ...    appPackage=${YT_PACKAGE}
    ...    appActivity=${YT_ACTIVITY}

Setup Chrome
    Open Application    http://127.0.0.1:4723
    ...    automationName=UiAutomator2
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    udid=${UDID}
    ...    appPackage=${CHROME_PACKAGE}
    ...    appActivity=${CHROME_ACTIVITY}

Search On YouTube
    [Arguments]    ${query}
    Wait Until Page Contains Element    //*[@text="Разрешить"]
    Click Element    //*[@text="Разрешить"]
    Wait Until Page Contains Element    //*[@content-desc="Введите запрос"]
    Click Element    //*[@content-desc="Введите запрос"]
    Input Text Into Current Element    ${query}
    Sleep    2s
    Click Element    //*[@resource-id="com.google.android.youtube:id/linearLayout"]
    Sleep    2s
    Tap With Positions    500    1300

Scroll Down To End
    WHILE    "True"
        ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    //android.view.View[@text="Kuplinov ► Play"]
        Exit For Loop If    ${is_visible}
        Swipe    500    1500    500    500    1000
    END

Search On Chrome
    [Arguments]    ${query}
    Wait Until Page Contains Element    //*[@text="Введите запрос или URL"]
    Click Element    //*[@text="Введите запрос или URL"]
    Input Text Into Current Element    ${query}
    Sleep    3s
    Wait Until Page Contains Element    //*[@text="${query}"]
    Click Element    //androidx.recyclerview.widget.RecyclerView[@resource-id="com.android.chrome:id/omnibox_suggestions_dropdown"]/android.view.ViewGroup[7]/android.widget.ImageView[1]

*** Test Cases ***
Test YouTube Search
    [Documentation]    Открытие YouTube и поиск канала Kuplinov Play
    Setup YouTube
    Search On YouTube    ${SEARCH_TEXT}
    Sleep    3s

Test Chrome Search
    [Documentation]    Открытие Chrome и поиск канала Kuplinov Play
    Setup Chrome
    Wait Until Page Contains Element    //*[@text="Продолжить без входа в аккаунт"]
    Click Element    //*[@text="Продолжить без входа в аккаунт"]
    Wait Until Page Contains Element    //*[@text="Ещё"]
    Click Element    //*[@text="Ещё"]
    Wait Until Page Contains Element    //*[@text="OK"]
    Click Element    //*[@text="OK"]
    Search On Chrome    ${SEARCH_TEXT}
    Scroll Down To End
    Click Element    //android.view.View[@text="Kuplinov ► Play"]
    Sleep    5s
