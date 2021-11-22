#!/bin/bash

##
# Website status check script
# Author : jo_gilsang
# Date : 10/10/2020
##

# v1 : 단일 웹사이트 장애감지

url="슬랙 도메인"
website="감지할 사이트"
# website="https://www.naver.com"

generate_post_data()
{
        cat <<EOF
{
   "attachments":[
      {
         "fallback":"서버장애가 감지됬습니다. 시스템 확인요청드립니다.",
         "pretext":"서버장애가 감지됬습니다. 시스템 확인요청드립니다.>",
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


color="#D00000"
status_code=""
# msg="서버장애가 발생했습니다."


status_code=$(curl --write-out %{http_code} --silent --output /dev/null -L ${website})

if [[ "$status_code" -ne 200 ]] ; then
    # POST request to Discord Webhook with the domain name and the HTTP status code
    # curl -H "Content-Type: application/json" -X POST -d '{"text":"'"${domain} : ${status_code}"'"}' $url
    curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data $color $status_code $website)"  $url
    echo
else
    echo "${website} is running!"
    echo
fi
