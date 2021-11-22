#!/bin/bash

# expr : 사칙연산 등
# + 더하기
# - 뺼샘
# * 곱셈
# scale=N : 소수점 자리수

# bc


echo '2*(3+4)' | bc

echo 'scale=2;10/3' | bc

expr 1 + 3
# 4
expr 1 - 5
# -4
expr 3 \* 9

i=3
echo $i
i=`expr $i + 1`
echo $i
