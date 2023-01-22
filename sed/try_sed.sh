#!/bin/bash
# Try sed
# Ref:
#  http://www.linuxjournal.com/article/7231?page=0,0

# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

TESTFILE=ny.txt

echo "=== Double-space and then eliminate empty lines ==="
# use sed to double-space the lines a file and then use sed to eliminate empty lines! :-)
sed G ${TESTFILE}
sed -e '/^$/d' ${TESTFILE}
#sed -f dblspc.sed $TESTFILE |sed -e '/^$/d'

echo "=== Remove the first word in every line ==="
cat $TESTFILE | sed -e 's/^ *[^ ]* //'
