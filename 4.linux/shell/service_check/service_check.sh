#!/bin/bash

##
# Web Service Check Scripts with Slack
# Author : jo_gilsang

# created :  v1 웹 서비스 체크, 2021-11-23
# modifyed : 
#            

# Value
url=""
prd="https://hooks.slack.com/services/................."
dev="https://hooks.slack.com/services/................."

web_service_list="https://www.naver.com
https://www.google.co.kr
https://www.daum.net"

web_service_port_list="8000   
8000   
8000"

if [ $# -ne 1] ;
then
    echo "param이 없거나 2개 이상인경우"
    exit 1
fi

if [ "$1" -eq "prd" ] ; then $url=$prd
elif [ "$1" -eq "dev" ] ; then $url=$dev
else 
    echo "param은 prd 또는 dev 값만 유효함"
    exit 1
fi

generate_post_data_fail()
{
        cat <<EOF
{
   "attachments":[
      {
         "fallback":"웹 서비스 장애가 감지됬습니다.",
         "pretext":"웹 서비스 장애가 감지됬습니다.",
         "color":"$1",
         "fields":[
            {
               "title":"$2 error",
               "value":"$3",
               "short":false
            }
         ]
      }
   ]
}
EOF
}

# $1
fail_color="#D00000"

# $2
status_code=""

# $3
# for webservice in ${web_service_list}

# TODO : 장애발생 시 로그파일 생성.
file_prefix="./fail_web_service"
file_realfix=".log"

# 배열 key값으로 index를 활용. 파일생성명
cnt=0

for webservice in ${web_service_list} ; do
        #파일명 생성
        file_check=${file_prefix}${cnt}${file_realfix}
        echo "filecheck" $file_check

        # CORE

        status_code=$(echo > /dev/tcp// --write-out %{http_code} --silent --output /dev/null -L ${webservice})

        # 웹 서버 장애인경우
        if [[ "$status_code" -ne 200 ]] ; then
            # POST request to Discord Webhook with the domain name and the HTTP status code
            # curl -H "Content-Type: application/json" -X POST -d '{"text":"'"${domain} : ${status_code}"'"}' $url

            # fail_log파일이 있다면, 기존 장애유지. 알람발생X
            if [[ -f "$file_check" ]] ; then
                echo "${webservice} is stil failed!"
                echo

            # fail_log파일이 없으면, 파일생성 및 신규장애 알람발생
            else
                curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data_fail $fail_color $status_code $webservice)"  $url >> $file_check
                echo
            fi
        # 웹 서버 장애가 아닌경우
        else
            # fail_log파일이 있으면 삭제 후, 장애복구(정상) 알람발생
            if [[ -f "$file_check" ]] ; then
                rm -rf $file_check
                curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data_success $success_color $status_code $webservice)"  $url

            # fail_log파일이 없으면, 정상상태
            else
                echo "${webservice} is running!"
                echo
            fi
        fi

        # 파일명으로 사용될 index 증가
        cnt=$(($cnt+1))

        # 지연시간 추가
        sleep 3s
done
