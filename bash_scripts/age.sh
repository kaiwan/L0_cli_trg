#!/bin/bash
# age.sh
# Interactive bash shell script which prompts for age, and
# returns a ticket price based upon age
#cat /proc/$$/cmdline

# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

age=1
echo "Enter your age --"
read -r age

if [[ ${age} -le 6 ]] || [[ ${age} -ge 64 ]]
then
	echo "We discount to children and senior citizens: ticket price is \$2.50"
elif [[ ${age} -ge 40 ]] && [[ ${age} -le 43 ]]
then
	echo "These are difficult years, we won't charge you"
elif [[ ${age} -ge 13 ]] && [[ ${age} -le 19 ]]
then
	echo "We charge double for teenagers: ticket price is \$10.00"
else
	echo "Ticket price is \$5.00"
fi

exit 0
