#!/bin/bash
# Simple demo of the until loop
# Guess the password!

password="PASSWORD"
guess=""
num_attempts=1
max_attempts=3

# Turn off character echoing
stty -echo

until [ "${guess}" = "${password}" ] || [ ${num_attempts} -gt ${max_attempts} ]
do
	echo -n "Password: "
	read guess
	num_attempts=$((num_attempts+1))
done
gotit=1
[ ${num_attempts} -gt ${max_attempts} ] && {
  gotit=0
  stty sane
  echo "FAILED; this will be reported!"
  exit 1
}

stty sane
echo ""; echo "All OK, please proceed..."
exit 0
