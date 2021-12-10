#!/bin/bash
# Try sed
# Ref:
#  http://www.linuxjournal.com/article/7231?page=0,0

source ./common.sh || {
 echo "common.sh ??"
 exit 1
}
TESTFILE=ny.txt

ShowTitle "Double-space and then eliminate empty lines"
# use sed to double-space the lines a file and then use sed to eliminate empty lines! :-)
sed G ${TESTFILE}
sed -e '/^$/d' ${TESTFILE}
#sed -f dblspc.sed $TESTFILE |sed -e '/^$/d'

ShowTitle "Remove the first word in every line"
cat $TESTFILE | sed -e 's/^ *[^ ]* //'

