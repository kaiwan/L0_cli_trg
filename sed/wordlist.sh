#!/bin/sh
# wordlist.sh
# makes all input into single-word lines using tr
[ $# -ne 1 ] && {
	echo "Usage: $0 filename"
	exit 1
}

# tr:
#  -c: complement of (NOT condition)
#  -s: supress repeated characters (=> show only 1 newline)
tr -cs "A-Za-z" '\012' <$1		# '012' -> newline
exit 0
