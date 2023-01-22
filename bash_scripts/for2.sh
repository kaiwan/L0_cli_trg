#!/bin/bash
# for2.sh
# 
# Demos that the output (to stdout) of a for loop *alone* can 
# be redirected to a file by using ">" immediately after 
# the "done" statement.
# 

# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

FORFILE="forfile.output.txt"

echo "an echo before the for loop"

for fil in ${HOME}/*; do
	echo "Filename: $fil"
	stat $fil
	
	echo ">>> Press Return to continue, q to quit.. <<<"
	# read:
	#  -r: Raw read
	#  -s: do not echo input character
	#  -n 1: read only 1 character
	read -r -s -n 1 reply
	if [[ ${reply} = "" ]]; then
		continue
	elif [[ "$reply"=="q" || "$reply"=="Q" ]]; then
		exit 0
	fi
done # > $FORFILE

echo "echo after the for loop\
 exiting now.."
exit 0
