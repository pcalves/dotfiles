#!/bin/bash

/usr/bin/env osascript <<-EOF
tell application "System Events"
    if (name of processes) contains "Hyper" then
        tell process "Hyper"
            click menu item "New Window" of menu "Shell" of menu bar 1
            set frontmost to true
        end tell
    else
        tell application "Hyper" to activate
    end if
end tell
EOF
