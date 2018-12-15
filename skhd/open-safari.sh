#!/bin/bash

/usr/bin/env osascript <<-EOF
tell application "System Events"
    if (name of processes) contains "Safari" then
        tell application "Safari" to activate
        keystroke "n" using command down
    else
        tell application "Safari" to activate
    end if
end tell
EOF
