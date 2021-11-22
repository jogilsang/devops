#!/bin/bash

# TODO : request 하는 api의 endpoint 주소와 slack을 사용하는 경우 incomming webhook 주소기재하기
endpoint = "https://{domain}/api/report/daily"
url="https://hooks.slack.com/services/......."

generate_post_data_fail()
{
        cat <<EOF
{
   "attachments":[
      {
         "fallback":"당일 데이터가 누락됬습니다.",
         "pretext":"당일 데이터가 누락됬습니다.",
         "color":"#D00000",
         "fields":[
            {
               "title":"$1 데이터 확인해주세요",
               "short":false
            }
         ]
      }
   ]
}
EOF
}

# TODO
# 1. 당일 date형식을 만든다.
year=`date +%Y`
month=`date +%m`
day=`date +%d`
today=$year$month$day
today_form=`date +%Y-%m-%d`
echo $today

# 2. curl로 결과를 받아서, 해당 데이터를 조회해서 결과여부를 반환한다.
data=$(curl --location --request GET ${endpoint} \
-H 'Content-Type: application/json' \
-H 'Authorization: Bearer aaaaaaaaaaaaa=')
#dummy
#data="20210304"

# 3. 금일 날짜가 있다면
if [[ "$data" == *"$today"* ]]; then
  echo "It's there."
# 금일 날짜가 없다면
else
  # Slack 전송
  curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data_fail $today_form)"  $url
  echo "It's not there."
fi
