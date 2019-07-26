#!/bin/bash

wal -n -i "$1" && osascript -e 'tell application "'$(ps ax | grep sicht | awk '{print $5}' | head -1 | cut -d/ -f3 | cut -d. -f1)'" to refresh' && ~/.chunkwmrc && kitty @ set-colors --all --configured ~/.cache/wal/colors-kitty.conf

osascript -e "tell application \"System Events\" to tell every desktop to set picture to \"$(cat "$HOME/.cache/wal/wal")\""

