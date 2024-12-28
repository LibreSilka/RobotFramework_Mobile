*** Settings ***
Library    AppiumLibrary

*** Test Cases ***
First Test
    Open Application    http://127.0.0.1:4723
    ...     automationName=UiAutomator2
    ...     platformName=Android
    ...     platformVersion=15
    ...     deviceName=sdk_gphone64_x86_64
    ...     udid=emulator-5554
    ...     appPackage=com.google.android.youtube
    ...     appActivity=com.google.android.apps.youtube.app.watchwhile.WatchWhileActivity


    # Wait for the app to load (adjust as needed)
    Click Element    //*[@text="Разрешить"]
    Sleep    5s

    Wait Until Page Contains Element    //*[@content-desc="Введите запрос"]
    Click Element    //*[@content-desc="Введите запрос"]
    # Search for "Kuplinov play.linearLayout"
    Input Text Into Current Element     Kuplinov play
    Sleep    2s

    Click Element    //*[@resource-id="com.google.android.youtube:id/linearLayout"]
    Sleep    2s
    Tap With Positions    500   1300  # Adjust these coordinates as needed

    # Scroll down to find the last video
    Swipe   500    100    100    0   1000

    Sleep    3s  # Adjust this sleep duration if necessary

    Close Application
Second Test
    Open Application    http://127.0.0.1:4723
    ...     automationName=UiAutomator2
    ...     platformName=Android
    ...     platformVersion=15
    ...     deviceName=sdk_gphone64_x86_64
    ...     udid=emulator-5554
    ...     appPackage=com.android.chrome
    ...     appActivity=com.google.android.apps.chrome.Main

    Wait Until Page Contains Element    //*[@text="Продолжить без входа в аккаунт"]
    Click Element    //*[@text="Продолжить без входа в аккаунт"]
    Sleep    5s
    Scroll Down    //*[@text="OK"]
    Wait Until Page Contains Element    //*[@text="OK"]
    Click Element    //*[@text="OK"]

    Wait Until Page Contains Element    //*[@text="Введите запрос или URL"]
    Click Element    //*[@text="Введите запрос или URL"]
    # Search for "Kuplinov play.linearLayout"
    Input Text Into Current Element     Kuplinov play
    Sleep    1s
    Wait Until Page Contains Element    //*[@text="Kuplinov play"]

    Click Element    //*[@text="Kuplinov play"]
    Sleep    2s

    Swipe   500    100    100    0   1000

    # Play the video
    Sleep    3s  # Adjust this sleep duration if necessary

    Close Application
