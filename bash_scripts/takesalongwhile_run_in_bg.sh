#!/bin/bash
MAX=1000000
for i in $(seq 1 ${MAX})
do
  sleep 1
  echo -n "."
done
