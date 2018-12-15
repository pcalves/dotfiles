#!/bin/bash

cd ~/content/music && find . -type f -mtime -15  | egrep '\.mp3$|\.flac$' | awk '{ sub(/^\.\//, ""); print }' > ~/.config/mpd/playlists/Recently\ Added.m3u

