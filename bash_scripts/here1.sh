#!/bin/bash
# here1.sh
# Passing data to cat using a here document

cat <<@MYMARKER@
this is sample input line 1
this is sample input line 2
this is sample input line 3
this is sample input line 4
this is sample input line 5
@MYMARKER@

exit 0

