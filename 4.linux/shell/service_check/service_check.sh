
#!/bin/bash

##
# Web Service Check Scripts with Slack
# Author : jo_gilsang

# created :  v1 웹 서비스 체크, 2021-11-23
# modifyed :
#

# 서버1
# www.xxxxxx.com:8000
# 서버2
# www.xxxxxsdx.com:8000

# TODO
# (1) 알람을 날릴 slack의 주소를 넣기
# url="https://hooks.slack.com/services/xxxxxx"
url="https://hooks.slack.com/services/xxxxxxxxxx"

# (2) port가 포함된 서버목록넣기
web_service_list="www.xxxxxx.com:8000
www.xxxxxsdx.com:8000"

# if [ $# -ne 1 ] ;
# then
#    echo "param이 없거나 2개 이상인경우"
#    exit 1
# fi

generate_post_data_fail()
{
        cat <<EOF
{
   "attachments":[
      {
         "fallback":"서비스 장애",
         "pretext":"서비스 장애",
         "color":"$1",
         "fields":[
            {
               "title":"Connection timed out",
               "value":"$2",
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

# 배열 key값으로 index를 활용. 파일생성명
cnt=0

for webservice in ${web_service_list} ; do

        # CORE
        domain=`echo $webservice | cut -d ":" -f 1`
        port=`echo $webservice | cut -d ":" -f 2`

        echo "domain : $domain"
        echo "port : $port"

        `echo > /dev/tcp/$domain/$port`
        status_code=`echo $?`


        # 웹 서버 장애인경우
        if [[ "$status_code" -ne 0 ]] ; then
            # POST request to Discord Webhook with the domain name and the HTTP status code
                curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data_fail $fail_color $webservice)" $url
                echo
                echo "정상입니다"
        fi

        # 파일명으로 사용될 index 증가
        cnt=$(($cnt+1))

        # 지연시간 추가
        sleep 3s
done
