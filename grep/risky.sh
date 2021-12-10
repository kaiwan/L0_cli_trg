#!/bin/bash
[ $# -ne 1 ] && {
  echo "Usage: $0 <start-folder>"
  exit 1
}

[ ! -d $1 ] && {
  echo "$0: $1 is not a valid folder?"
  exit 2
}

SEP="-------------------------------------------------"
LOGFILE=./riskystuff.txt

{
echo ${SEP}
echo "This output is from the script: ${0}"
date
echo ${SEP}

echo "Logging results to: ${LOGFILE}"
echo
echo "1. ______ Finding folders under $1 with mode having public write bit set ______"
find $1 -type d -ls |awk '{print $3, $11}' |grep --color=auto '^d.......w' |awk '{print $2}'
echo ${SEP}

echo "2. ______ Finding SETUID executables under $1 ________"
find $1 -type f -ls |awk '{print $3, $5, $11}' |grep '^-..s'
echo ${SEP}

echo "3. _____ Finding SETGID executables under $1 _______"
find $1 -type f -ls |awk '{print $3, $6, $11}' |grep '^-.....s'

echo ${SEP}
date
echo ${SEP}
echo "Done."
} | tee -a ${LOGFILE}
