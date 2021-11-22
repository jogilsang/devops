#!/bin/bash

echo -n "Type Your Answer [Y/N] : "

# 현재 터미널 설정을 쉘 변수 tty_state에 백업하고
# 터미널을 raw설정함
tty_state=$(stty -g)
stty raw
#키보드에서 문자 하나 읽기
# 
# dd 명령어에 입력값이 전달됨.
# bs는 블록크기 1개, count는 입출력 전달할 블록 갯수
# 실행메세지는 필요없으므로 /dev/null로 리다이렉트해서 버립니다
char=$(dd bs=1 count=1 2> /dev/null)

#터미널 설정을 원래대로 돌림
stty "$tty_state"

echo

# 입력된 문자에 따라 처리분기
case "$char" in
		[yY])
			echo "Input :Yes"i
			;;
				
		[nN])
			echo "Input :No"
			;;
		*)
			echo "Input: What?"
			;;
esac

