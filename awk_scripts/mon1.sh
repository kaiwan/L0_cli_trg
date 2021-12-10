#!/bin/sh
# mon1.sh

# signal traps
trap 'echo "Got ^C, exiting.."; sync; exit 1' INT
trap '' QUIT

# make last log as backup copy of log file
cp mlog mlog.bkp 2>/dev/null
rm mlog 2>/dev/null

while true
do
        ps -Aef | awk -f mon1.awk >> mlog 2>/dev/null
        sleep 1
done
uniq -cu mlog
exit 0
