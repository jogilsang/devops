#!/bin/sh

# 감시할 프로세스 명령어
commname="/usr/libexec/mysqld"

# 대상 명령어 프로세스 수를 카운트
count=$(ps ax -o command | grep "$commaname" | grep -v "^grep" | wc -l)

# grep 명령어 출력 결과가 0이면 프로세스가 존재하지않으므로
# 알림처리

if [ "$count" -eq 0 ]; then
	echo "[ERROR] 프로세스 $ commname 찾지 못했습니다." >&2
	/home/user1/bin/alert.sh
fi
