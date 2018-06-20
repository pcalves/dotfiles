#!/bin/bash

/usr/bin/env osascript <<-EOF
tell application "System Events"
    if (name of processes) contains "Hyper" then
        tell application "Hyper" to activate
        keystroke "n" using command down
    else
        tell application "Hyper" to activate
    end if
end tell
EOF
