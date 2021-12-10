#!/bin/bash
# Simple front-end to the awk "sz" prg

[[ $# -ne 2 ]] && {
  echo "Usage: $0 start_folder min_size"
  exit 1
}

[[ ! -d $1 ]] && {
 echo "$0: $1 not a valid folder?"
 exit 1
}

# Using 'find'
find $1/ -type f -ls |awk -f sz.awk -v sz=$2

exit 0
