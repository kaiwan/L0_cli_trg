#!/bin/bash
# Demo for the set command

echo "\$@: $@"

echo "The date is $(date)"
set $(date) 				# or can use: set `date`
echo "\$@: $@"
echo "The year is $6"
thisyear=$6

echo "Enter your birth year (XXXX)"
read byear

echo "You are " $((thisyear-byear)) "years old!"
exit 0

