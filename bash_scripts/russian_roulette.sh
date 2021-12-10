#!/bin/bash
# A game of Russian Roulette !
# See
# http://www.commandlinefu.com/commands/view/726/command-line-russian-roulette

# safe version :-P
while true
do
  [ $[ RANDOM % 6 ] == 0 ] && echo "*BANG*" || echo "*Click*"
  sleep 0.5
done
