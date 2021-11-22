#!/bin/bash

count=0
# 하고싶은 처리
trap '  echo  
	echo "Try count : $count"
	exit ' INT #시그널

while :
do
	curl -o /dev/null $1
	count=$(expr $count + 1)
	sleep 1
done
