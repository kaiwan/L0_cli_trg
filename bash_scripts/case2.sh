#!/bin/bash
# Simple demo of the case statement

# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

while true
do
   echo "Are you ready for a break now? <Enter yes or no> "
   read ready_or_not

   case "$ready_or_not" in
   	y | yes | Y | YES ) echo "OK, let's take a break & sleep!
			(sleeping for 5s...)"
						sleep 5
						echo "Yawn; time to get up already?"
						exit 0
						;;
   	# n* | N* )			echo "Good; I told you: no sleeping!"
	# 					exit 0
	# 					;;
   	[nN] | no | NO )	echo "Good; I told you: no sleeping!"
						exit 0
						;;
   	*)					echo "What? " 
   esac
done

exit 0

