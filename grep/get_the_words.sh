#!/bin/bash
# Show all words containing the letters entered!
# Crossword puzzle helper perhaps !? :-)
# Kaiwan NB.

# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

DICT=dictionaries/websters_unabridged_dictionary.txt
[[ ! -f ${DICT} ]] && {
 echo "$0: ${DICT} dictionary file absent?"
 exit 1
}
which zenity >/dev/null || {
	echo "zenity pkg required." ; exit 1
}
input=$(zenity --entry --text="Enter the letters" 2>/dev/null)
[ -z "${input}" ] && {
	echo "zenity not ok? no GUI mode? aborting..." ; exit 1
}
output=$(egrep -i "${input}" ${DICT})

TMPF=/tmp/$$
cat > ${TMPF} << @here@
${output}
@here@
num=$(wc -l ${TMPF} |cut -f1 -d' ')
# delete the last empty line
#sed --in-place '$d' ${TMPF${DICT}m=$(wc -l ${TMPF} |cut -d" " -f1)
echo "${num} matches found"
zenity --title="Your Output (${num} words)" --text-info --filename=${TMPF} 2>/dev/null || true
rm -f ${TMPF}
