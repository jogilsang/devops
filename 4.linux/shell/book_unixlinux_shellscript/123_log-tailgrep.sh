#!/bin/sh

# 감시 대상 로그 파일명 설정

logfile="/var/log/apache2/access.log"

# tail 로그명령어로 로그 감시
# * -F 실시간 감시
# * -n 추가분만 표시

tail -F -n 0 "$logfile" |\
	while read line
	do
		case "$line" in
			*"200"*)
		         	echo "성공 :  $line"
		        	;;
	               	*"Application Error"*)
		             	echo "!경고! 애플리케이션 이상 : $line"
		         	;;	
		esac
	done
