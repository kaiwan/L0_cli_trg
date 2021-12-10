#!/bin/bash
# guess.sh
# Simple demo of the use of the while loop, 
# the break and continue statements..

num=$((RANDOM % 50 + 1)) # +1 so that it's never 0
try=1
maxtries=7
success=0

while [[ "$try" -le "$maxtries" ]]
do
	echo "Guess the number: "
	read -r guess

	if [[ "$guess" -lt "$num" ]]; then
		echo "Guess higher! (try $try/$maxtries)"
	elif [[ "$guess" -gt "$num" ]]; then
		echo "Guess lower! (try $try/$maxtries)"
	elif [[ "$guess" -eq "$num" ]]; then
		echo -n "Right!! The number is $num. You took $try "
		# Grammar, grammar... :-)
		if [[ $try -eq 1 ]]; then
			echo "try!!!"
		else
			echo "tries!"
		fi
		success=1
		break
	else
		echo "Invalid guess.."
		continue
	fi	
	
	try=$((try+1))
done

if [[ "$success" -eq 1 ]]; then
	exit 0
else
	echo "Sorry!! Tries up."
	exit 1
fi
