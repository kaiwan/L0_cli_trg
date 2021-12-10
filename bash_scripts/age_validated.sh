#!/bin/bash
#
# age_validated.sh
# 
# Interactive bash shell script which prompts for age, and
# returns a ticket price based upon age.
# Additionally, validity checks are performed at the time of user input- as it should!
#
age=1
echo "Enter your age --"
read age

# Ref: https://stackoverflow.com/questions/2210349/test-whether-string-is-a-valid-integer
[[ ${age} =~ ^[0-9]+$ ]] || {
  echo "Invalid input"
  exit 1
}
# Can use
#  [[ ${age} =~ ^-?[0-9]+$ ]]
# to accept negative #s as well

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
