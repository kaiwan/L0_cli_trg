#!/bin/bash
# mon1.sh
# Set Bash unofficial 'strict mode'; _really_ helps catch bugs
# ref: http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -euo pipefail


# signal traps
trap 'echo "Got ^C, exiting.."; sync; exit 1' INT
trap '' QUIT

# make last log as backup copy of log file
cp mlog mlog.bkp 2>/dev/null || true
rm mlog 2>/dev/null || true

while true
do
        ps -Aef | awk -f mon1.awk >> mlog 2>/dev/null
        sleep 1
done
uniq -cu mlog
exit 0
