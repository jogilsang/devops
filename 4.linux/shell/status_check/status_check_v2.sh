#!/bin/bash

##
# Website status check script
# Author : jo_gilsang
# Date : 10/10/2020
##

# v1 : 단일 웹사이트 장애감지
# v2 : 다중 웹사이트 장애감지

##
# Discord webhook
# Change the 'your_discord_webhook_name' with your actual Discord Webhook
##


##
# List of websites to check
##

url="슬랙 도메인"
websites_list="감지할 사이트"
# websites_list ="your_domain1/test your_domain2 your_domain3"


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

# domain="https://www.naver.com"
color="#D00000"
status_code=""
# msg="서버장애가 발생했습니다."

for website in ${websites_list} ; do
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
done
