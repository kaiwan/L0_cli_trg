#!/bin/bash
# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

if [[ $# -lt 3 ]]; then
	echo "Usage: $0 first second third"
	exit 1
fi

for param in $@
do
	echo $param
done

exit 0

