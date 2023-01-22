#!/bin/bash
# here2.sh
# Embedding a a small 'C' program within the script using
# a here document.
#
# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail

echo "Generating temp 'C' prg..."
cat > /tmp/hello_$$.c << @MYMARKER@
#include <stdio.h>
#include <stdlib.h>
int main()
{
	printf("Hello, Here Doc, world!\n");
	exit (0);
}
@MYMARKER@

echo "Attempting to compile it now..."
gcc /tmp/hello_$$.c || {
	echo "gcc failed to compile test C prg. Aborting now..."
	rm -f /tmp/hello_$$.c
	exit 1
}
echo "test successful."
rm -f /tmp/hello_$$.c ./a.out
exit 0

