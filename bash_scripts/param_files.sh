#!/bin/bash
# Invoke f.e. with:
# ./param_files $(ls -R ~/)
if [[ $# -eq 0 ]]; then
	echo "Usage: $0 <param1 ... paramn>"
	exit 1
fi

i=1
for param in "$@"
do
	# nicely format the message with printf !
	printf "Parameter %02d : %20s\n" ${i} ${param}
	i=$((i+1))
done

exit 0

