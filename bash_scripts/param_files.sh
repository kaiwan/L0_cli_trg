#!/bin/bash
# Invoke f.e. with:
# ./param_files $(ls -R ~/)
# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

if [[ $# -eq 0 ]]; then
	echo "Usage: $0 <param1 ... paramn> ; where the parameters are filenames"
	echo "F.e.: ./param_files \$(ls -R ~/)"
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

