#!/bin/bash
# A small script to test the interpreter
# Depends on the system having the /proc filesystem mounted
#
# Test by changing the interpreter (1st line above)

echo "pid=$$"
cat /proc/$$/cmdline
echo

exit 0

