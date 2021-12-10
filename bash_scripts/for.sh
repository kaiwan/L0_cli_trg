#!/bin/bash
#
# for.sh
# Loop as long as there is another element in the list.
# “in” is a keyword to separate n from the list of elements
total=0 ; n=0
for n in 1 2 3 4 
do 
  total=$((total+n))
  echo $total
done
