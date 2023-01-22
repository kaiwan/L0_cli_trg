#!/bin/bash
# Simple demo of the until loop
# Guess the password!
# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

password="PASSWORD"
guess=""

# Turn off character echoing
stty -echo

until [[ "${guess}" = "${password}" ]]
do
	echo -n "Password: "
	read guess
done

echo ""; echo "OK."
stty sane
exit 0

# Ex. Enhance this script to accept only three tries
# by the user.
