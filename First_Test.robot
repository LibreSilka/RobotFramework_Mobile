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
    #class="android.widget.Button" text="Allow" resource-id="com.android.permissioncontroller:id/permission_allow_button"
    Click Element    //*[@text="Allow"]
    Wait Until Page Contains Element    //*[@content-desc="Search"]
    Click Element    //*[@content-desc="Search"]
    # Search for "Kuplinov play.linearLayout"
    Input Text Into Current Element     Kuplinov play
    Sleep    5s

    Click Element    //*[@resource-id="com.google.android.youtube:id/linearLayout"]
    Sleep    2s

        # Click on the search icon
    Tap With Positions    500   1300  # Adjust these coordinates as needed

    # Wait for the video list to load

    # Scroll down to find the last video
    Swipe   500    100    100    0   1000

    # Play the video
    Sleep    3s  # Adjust this sleep duration if necessary

    Close Application


