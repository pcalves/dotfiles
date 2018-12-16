#!/bin/bash

# Kill all notify processes
kill $(ps aux | grep 'pomo.sh notify' | awk '{print $2}') >/dev/null 2>&1

$HOME/.scripts/pomo/pomo.sh stop
