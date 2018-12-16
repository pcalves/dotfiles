#!/bin/bash

# Kill previous notify processes to keep them from piling up
kill $(ps aux | grep 'pomo.sh notify' | awk '{print $2}') >/dev/null 2>&1

$HOME/.scripts/pomo/pomo.sh start
$HOME/.scripts/pomo/pomo.sh notify &
