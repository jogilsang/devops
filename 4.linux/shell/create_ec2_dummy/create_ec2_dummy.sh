#!/bin/bash
startTime=`date`

# TODO : 아래 숫자를 변경하면, 파일개수가 변경된다
for var in {1..1000}
do
        echo $var > $var.dummy
done

echo 시작시간 : $startTime
echo 종료시간 : `date`
