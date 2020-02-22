#!/bin/bash

wal -n -i "$1" && osascript -e 'tell application "'$(ps ax | grep sicht | awk '{print $5}' | head -1 | cut -d/ -f3 | cut -d. -f1)'" to refresh' && ~/.chunkwmrc && kitty @ set-colors --all --configured ~/.cache/wal/colors-kitty.conf

# set wallpaper on all desktop
sqlite3 $HOME/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$(cat "$HOME/.cache/wal/wal")'"

# restart the Dock else the wallpaper wouldn't apply
killall Dock

# osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$(cat "$HOME/.cache/wal/wal")\""
