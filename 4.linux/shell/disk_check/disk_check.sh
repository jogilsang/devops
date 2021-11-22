#!/bin/bash

# 디스크 용량체크
currentDiskUsage=df -h | awk '{print $5}' | sed -n '4p' | sed -r 's/\%//g'

# TODO : 한계값
limit=95

# 한계값 이상인 경우, 알람
if [[$currentDiskUsage -gt $limit]] ; then
    echo "Please Check currentDiskUsage ${currentDiskUsage}% is more than ${limit}%"
else
    echo "Feel So good~"
fi
