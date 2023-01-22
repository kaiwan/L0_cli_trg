#!/bin/bash
# mission_codename.sh
# Generate a 'mission codename' consisting of two random words from a
# dictionary joined together!
# If you pass a non-zero parameter, we generate that many codewords.

# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

DICT=dictionaries/dictionary.txt
[ ! -f ${DICT} ] && {
  echo "Dictionary file ${DICT} not found."
  exit 1
}
num=1
[[ $# -eq 1 ]] && num=$1
len=$(wc -l ${DICT}|awk '{print $1}')

i=0
while [[ $i -lt ${num} ]]
do
  rand1=$(((${RANDOM}%${len})))
  rand2=$((${RANDOM}%${len}))
  name1="$(sed -n "${rand1}p" ${DICT})"
  name2="$(sed -n "${rand2}p" ${DICT})"
  echo "${name1}_${name2}"
  sleep .1
  let i=i+1
done
