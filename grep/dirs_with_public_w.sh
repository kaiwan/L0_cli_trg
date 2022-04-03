#!/bin/bash
name=$(basename $0)
[ $# -ne 1 ] && {
	echo "Usage: ${name} start-dir" ; exit 1
}
find $1 -type d -ls | grep '^d.......w'
