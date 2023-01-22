#!/bin/bash
# Simple front-end to the awk "sz" prg
# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

[[ $# -ne 2 ]] && {
	echo "Usage: $0 start_folder min_size(bytes)"
	exit 1
}

[[ ! -d $1 ]] && {
 echo "$0: $1 not a valid folder?"
 exit 1
}

# Using 'find'
find $1/ -type f -ls |awk -f sz.awk -v sz=$2

exit 0
