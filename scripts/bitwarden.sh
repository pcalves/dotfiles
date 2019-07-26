#!/bin/bash

app() {
  bw get item --session "$(cat ~/pass)" "$(
    bw list items --session "$(cat ~/pass)" \
    | jq '.[] | "\(.name) | \(.login.username) | id: \(.id)"' \
    | fzf +m --with-nth 1..-4 --margin=1,2 --prompt='> ' --color=16 --reverse \
    | awk '{print $(NF -0)}' \
    | sed 's/\"//g' \
  )" | jq -r '.login.password' | pbcopy
}

yabai -m window --toggle float && yabai -m window --grid 3:4:1:1:2:1 && app
