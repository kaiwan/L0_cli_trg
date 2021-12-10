#!/bin/bash
# fn2.sh
# Demonstrates returning a true/false value from a function

foo2() {
	if [[ "$bin" -eq 1 ]] ; then
		return 0 	# equivalent to true!
	elif [[ "$bin" -eq 0 ]]; then 
		return 1	# equivalent to false!
	else
		echo "foo2(): invalid input, aborting.."
		return 1
	fi
}

for i in 1 2 3
do
	echo "Enter 0 or 1"
	read bin

	if foo2 ; then
		echo "foo2 returned true"
	else
		echo "foo2 returned false"
	fi
done

exit 0

