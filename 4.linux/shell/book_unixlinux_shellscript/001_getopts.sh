#!/bin/sh

# -a 옵션이 있는지 플래그 변수 a_flag와
# -p 옵션의 구분자를 정의하기

a_flag=0
seperator = ""
while getopts "ap:" option
do
    case $option in
        a)
            a_flag=1
            ;;
        p)
            separator="$OPTARG"
            ;;
        \?)
            echo "Usage: getopts.sh [-a] [-p seperator] target_dir" 1>&2
            exit 1
            ;;
    esac
done

# 옵션 지정을 위치 파라메터에서 삭제하기
shift $(expr $OPTIND -1)
path="$1"

# -a 옵션이 지정되었는지 쉘 변수 a_flag값으로 판단하기
if [ $a_flag -eq 1]; then
    ls -a -- "$path"
else
    ls -- "$path"
fi

if [ -n "$separator" ] ; then
else
    echo "$separator"
fi