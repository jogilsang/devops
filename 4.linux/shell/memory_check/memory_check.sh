#!/bin/bash

#
# created : cho_gilsang, 2021-09-10
# modifyed : echo 문구추가, 2021-09-19
#
# 메모리 용량체크

TotalMemory=`free -h | sed -n 2p | awk '{print $2}' | sed -r 's/M//g'`
echo "TotalMemory : ${TotalMemory}"
CurrentUsedMemory=`free -h | sed -n 2p | awk '{print $3}' | sed -r 's/M//g'`
echo "CurrentUsedMemory : ${CurrentUsedMemory}"

# TODO : 가용메모리의 한계값 ( 사용메모리 >= 전체 메모리의 90% )
limit=`echo "($TotalMemory / 10)*9" | bc`
echo "limit : ${limit}"

# 한계값 이상인 경우, 알람
if [ ${CurrentUsedMemory} -gt ${limit} ]; then
  echo "현재 사용중인 메모리(${CurrentUsedMemory}) 는 전체 메모리(${TotalMemory})의 90%이상입니다."
else
  echo "Feel So good~ ${TotalMemory} is more than ${CurrentUsedMemory}"
fi
