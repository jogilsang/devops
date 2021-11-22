#!/bin/bash

##
# Website status check script
# Author : jo_gilsang

# created :  v1 기본 사이트 체크, 10/10/2020
# modifyed : v2 다중 사이트 체크, 10/11/2020
#            v3 다중 사이트 제거, 정상복구감지 추가, 18/12/2020
#            v4 장애감지 시, 재알람 제거. 1분간격으로 cron변경, 21/12/2020
#            v4 다중 사이트 추가, 15/01/2021
#            v5 다중 사이트 체크 테스트 예정, 01/02/2021
##

# QA
# url="https://hooks.slack.com/services/................."
# success-case :
# websites_list ="your_domain1/test your_domain2 your_domain3"
# fail-case :
# websites_list ="your_domain1/test your_domain2 your_domain3"

# PRD
url="https://hooks.slack.com/services/................."
websites_list="https://www.naver.com
https://www.google.co.kr
https://www.daum.net"
# websites_list ="your_domain1/test your_domain2 your_domain3"

generate_post_data_fail()
{
        cat <<EOF
{
   "attachments":[
      {
         "fallback":"서버장애가 감지됬습니다.",
         "pretext":"서버장애가 감지됬습니다.",
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

generate_post_data_success()
{
        cat <<EOF
{
   "attachments":[
      {
         "fallback":"서버장애가 복구됬습니다.",
         "pretext":"서버장애가 복구됬습니다.",
         "color":"$1",
         "fields":[
            {
               "title":"$2 success",
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
success_color="#7CFC00"
fail_color="#D00000"

# $2
status_code=""

# $3
# for website in ${websites_list}

# TODO : 장애발생 시 로그파일 생성.
file_prefix="./fail_"
file_realfix=".log"

# 배열 key값으로 index를 활용. 파일생성명
cnt=0

for website in ${websites_list} ; do
        #파일명 생성
        file_check=${file_prefix}${cnt}${file_realfix}
        echo "filecheck" $file_check

        # CORE
        status_code=$(curl --write-out %{http_code} --silent --output /dev/null -L ${website})

        # 웹 서버 장애인경우
        if [[ "$status_code" -ne 200 ]] ; then
            # POST request to Discord Webhook with the domain name and the HTTP status code
            # curl -H "Content-Type: application/json" -X POST -d '{"text":"'"${domain} : ${status_code}"'"}' $url

            # fail_log파일이 있다면, 기존 장애유지. 알람발생X
            if [[ -f "$file_check" ]] ; then
                echo "${website} is stil failed!"
                echo

            # fail_log파일이 없으면, 파일생성 및 신규장애 알람발생
            else
                curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data_fail $fail_color $status_code $website)"  $url >> $file_check
                echo
            fi
        # 웹 서버 장애가 아닌경우
        else
            # fail_log파일이 있으면 삭제 후, 장애복구(정상) 알람발생
            if [[ -f "$file_check" ]] ; then
                rm -rf $file_check
                curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data_success $success_color $status_code $website)"  $url

            # fail_log파일이 없으면, 정상상태
            else
                echo "${website} is running!"
                echo
            fi
        fi

        # 파일명으로 사용될 index 증가
        cnt=$(($cnt+1))

        # 지연시간 추가
        sleep 3s
done

