#!/bin/bash
# Show all words containing the letters entered!
# Crossword puzzle helper perhaps !? :-)
# Kaiwan NB.
[[ ! -f dictionary.txt ]] && {
 echo "$0: dictionary file absent?"
 exit 1
}
which zenity >/dev/null || {
	echo "zenity pkg required." ; exit 1
}
input=$(zenity --entry --text="Enter the letters" 2>/dev/null)
[ -z "${input}" ] && {
	echo "zenity not ok? no GUI mode? aborting..." ; exit 1
}
output=$(egrep -i "${input}" dictionary.txt)

TMPF=/tmp/$$
cat > ${TMPF} << @here@
${output}
@here@

# delete the last empty line
#sed --in-place '$d' ${TMPF}

num=$(wc -l ${TMPF} |cut -d" " -f1)
echo "${num} matches found"
zenity --title="Your Output (${num} words)" --text-info --filename=${TMPF} --text="${output}" 2>/dev/null
rm -f ${TMPF}
