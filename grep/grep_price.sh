echo "Find all fruit starting with the letter a through m that costs less than \$1:"
echo "Correct solution:
"
grep '^[a-m].*[^0-9][0 ]\.[0-9][0-9]$' fruit.txt 
echo "
Not quite correct solution:
"
grep '^[a-m].*\.[0-9][0-9]$'  fruit.txt

