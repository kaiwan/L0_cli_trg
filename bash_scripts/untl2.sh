#!/bin/bash
# Simple demo of the until loop
# Guess the password!

# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

password="PASSWORD"
guess=""
num_attempts=0
max_attempts=3

# Turn off character echoing
stty -echo

until [[ "${guess}" = "${password}" ]] || [[ ${num_attempts} -gt ${max_attempts} ]]
do
    echo
	echo -n "Password: "
	read guess
	num_attempts=$((num_attempts+1))
done

stty sane
gotit=1
[[ ${num_attempts} -gt ${max_attempts} ]] && {
  gotit=0
  echo "FAILED; this will be reported!"
  exit 1
}
echo ""; echo "All OK, please proceed..."
exit 0
