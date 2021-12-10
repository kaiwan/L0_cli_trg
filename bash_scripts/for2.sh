#!/bin/bash
# for2.sh
# 
# Demos that the output (to stdout) of a for loop *alone* can 
# be redirected to a file by using ">" immediately after 
# the "done" statement.
# 

FORFILE="forfile.output.txt"

echo "echo before the for loop"

for fil in $HOME/*; do
	echo "Filename: $fil"
	stat $fil
	
	echo "Press Return to continue, q to quit.."
	read reply
	if [ "$reply" = "q" -o "$reply" = "Q" ]; then
		exit 0
	fi
done # > $FORFILE

echo "echo after the for loop\
 exiting now.."

exit 0

