#!/bin/bash

/usr/bin/env osascript <<-EOF
if application "iTerm" is running then
  tell application "iTerm"
    create window with default profile
  end tell
else
  activate application "iTerm"
end if
EOF
