# 배열선언
declare -A array

# 배치작업 리스트 (key - value)
array["key"]="value"
# ...
# ...
# ...

# TODO : 감시 대상 로그 파일명 설정
# logfile="/var/log/apache2/access.log"

# tail 로그명령어로 로그 감시
# * -F 실시간 감시
# * -n 추가분만 표시

tail -F -n 0 "$logfile" |\
	while read line
	do
        for i in "${!array[@]}"
        do
            key=$i
            isFinded = true
            case "$line" in
                    # TODO : line에 key가 있다면
                    # 1. key값이 라인에 있는지 확인
                    *"$key"*)
                        # 1-1. 라인에 있으면, value로 변환 후 출력. break.
                        value=${array[$i]}
                        # echo "$key : $value"
                        echo "$line" | sed "s/$key/$value($key)/g"

                        # break 생성
                        $isFinded = false;
                    ;;
            esac

            # 1-2. 라인에 없으면, 다시 for문 진행
            if [$isFinded -eq false] ;then
                break;
            fi

        done
	done
