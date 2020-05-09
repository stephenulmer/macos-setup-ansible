#!/usr/bin/osascript
## FIXME: get username/passord in somehow
## FIXME: Credit original author

set osver to system version of (system info)
set mas_login to system attribute "MAS_LOGIN"
set mas_password to system attribute "MAS_PASSWORD"


# display dialog ("osver = " & osver)

tell application "App Store"
  try
    activate
    delay 5
  end try
end tell
    

tell application "System Events"
  tell process "App Store"
    set frontmost to true
    delay 5

    ### on first run when installing the appstore asks for accepting privacy policy
    try
      click button 2 of UI element 1 of sheet 1 of window 1
      delay 3
    end try

    ### open login dialog
    if osver begins with "10.14" then
      click menu item 15 of menu "Store" of menu bar item "Store" of menu bar 1
    end if
    if osver begins with "10.15" then
      click menu item 16 of menu "Store" of menu bar item "Store" of menu bar 1
#      display dialog ("osver matched Catalina (" & osver & ")")
    end if

    ### enter credentials
    delay 2
    set focused of text field "Apple ID:" of sheet 1 of window 1 to true
    delay 2
    tell application "System Events" to keystroke mas_login
    delay 2
    tell application "System Events" to keystroke return
    delay 2
    tell application "System Events" to keystroke mas_password
    delay 2
    tell application "System Events" to keystroke return
  end tell
end tell
        
tell application "App Store"
  try
    delay 15
    quit
  end try
end tell
