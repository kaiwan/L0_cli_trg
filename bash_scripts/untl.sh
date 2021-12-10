#!/bin/bash
# Simple demo of the until loop
# Guess the password!

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
