#!/bin/bash

function cover {
  music_dir="$HOME/content/music"
  current=$(dirname "$(mpc current -f '%file%')")

  if [[ -e "${music_dir}/${current}/cover.jpg" ]]; then
    if pgrep macfeh; then
      killall macfeh
    fi
    open -b "drabweb.macfeh" "$@" "${music_dir}/${current}/cover.jpg"
  fi
}

{
  cover
} &
