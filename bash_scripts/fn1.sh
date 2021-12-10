#!/bin/bash

foo1() {
	echo "In function foo1: i=$i"
}

for i in 1 2 3
do
	foo1
done

exit 0

