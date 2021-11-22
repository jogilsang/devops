#!/bin/sh

#route 명령어 출력에서 디폴트게이트웨이 얻기
# 첫번째 칼럼이 "0.0.0.0"인 줄의 두 번째 칼럼을 추출

gateway=$(route -n | awk '$1 == "0.0.0.0" {print $2}')



#디폴트 게이트웨이에 ping
ping -c 1 $gateway > /dev/null 2>&1

#ping 종료 스테이터스로 성공, 실패확인
if [ $? -eq 0 ]; then
	echo "[Success] ping -> $gateway"
else
	echo "[Failed] ping -> $gateway"
fi
