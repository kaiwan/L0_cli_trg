#!/bin/bash

if [[ $# -lt 3 ]]; then
	echo "Usage: $0 first second third"
	exit 1
fi

for param in $@
do
	echo $param
done

exit 0

