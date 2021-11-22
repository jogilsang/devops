
## status_check

### 상세내용 기재
https://blog.naver.com/jogilsang/222112043252

### 코드설정
```
sudo crontab -e 
*/5 * * * * /위치/쉘파일.sh
sudo crontab -l
sudo cat /var/log/cron | grep 쉘파일.sh
```

### 참조 및 출처
```
source of cc :

1. 슬랙과 bash쉘스크립트를 이용한 웹사이트 상태체크하기
https://www.digitalocean.com/community/tutorials/how-to-use-discord-webhooks-to-get-notifications-for-your-website-status-on-ubuntu-18-04

2. bash 쉘 json함수 작성하기 :
https://ourcstory.tistory.com/405
```
