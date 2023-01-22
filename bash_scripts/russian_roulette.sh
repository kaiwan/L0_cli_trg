#!/bin/bash
# A game of Russian Roulette !
# See
# http://www.commandlinefu.com/commands/view/726/command-line-russian-roulette
# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

# safe version :-P
while true
do
  [ $[ RANDOM % 6 ] == 0 ] && echo "*BANG*" || echo "*Click*"
  sleep 0.5
done
