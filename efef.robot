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

    Sleep    5s
    Close Application

