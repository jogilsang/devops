
# 4.linux

## INDEX
- ### [keymap](#keymap)
- ### [vim](#vim)
- ### [install](#install)
  - #### [lamp](#lamp)
- ### [crontab](#crontab)
- ### [cut](#cut)
- ### [pgrep](#pgrep)
- ### [lynx](#lynx)
- ### [date](#date)
- ### [uname](#uname)
- ### [bc](#bc)
- ### [free](#free)
- ### [tr](#tr)
- ### [sort](#sort)
- ### [awk](#awk)
- ### [sed](#sed)
- ### [form](#form)
  - #### [json(jq)](#json(jq))
  - #### [xml(xmllint)](#xml(xmllint))
- ### [process](#process)
  - #### ps
  - #### top
  - #### htop
  - #### atop
  - #### lsof
- ### [system](#system)
  - #### [nmon](#nmon)
  - #### iostat
  - #### sar
  - #### vmstat
- ### [network](#network)
  - #### [echo > /dev/tcp/](#echo%20>%20/dev/tcp/)
  - #### [nmap](#nmap)
  - #### [mtr](#mtr)
  - #### [traceroute](#traceroute)
  - #### [ping](#ping)
  - #### [tcpdump](#tcpdump)
  - #### [curl](#curl)
 - ### [Reference](#Reference)
---
### keymap
```
ctrl + a : 처음으로
ctrl + e : 끝으로
alt + b : 왼쪽으로
alt + l : 오른쪽으로
ctrl + u : 라인삭제
alt + backspace : 삭제
ctrl + l : 화면지우기
```
### [vim](https://vim.rtorr.com/lang/ko/)
```
gg - 문서 첫 줄 시작으로 점프, 첫 라인으로
G - 문서 끝 줄 시작으로 점프, 마지막 라인으로
5G - 5번째 행 시작으로 점프
H - 현재화면 상단으로 점프
M - 현재화면 중단으로 점프
L - 현재화면 하단으로 점프

e - 다음 단어 끝으로 점프 
b - 이전 단어 시작으로 점프 
% - 현재 괄호의 짝으로 점프

^ - 현재 행 시작으로 점프
$ - 현재 행 끝으로 점프 (공백 포함)

gd - 지역변수 선언위치로 점프
gD - 전역변수 선언위치로 점프

} - 다음 단락으로 점프
{ - 이전 단락으로 점프

Ctrl + e - 한 줄 아래로 화면 조정
Ctrl + y - 한 줄 위로 화면 조정

/pattern - 패턴 검색 (순방향)
n - 다음 검색항목으로 점프
N - 이전 검색항목으로 점프

u - 실행취소
Ctrl + r - 다시실행

yy - 한 행 복사하기
2yy - 한 행 복사하기
dd - 한 행 잘라내기
2dd - 2줄 잘라내기
D - 한 행 끝까지 잘라내기
yw - 다음 단어까지 복사하기
dw - 다음 단어까지 잘라내기
P - 커서 앞에 붙여넣기

V - 비주얼 라인

---------------------------------------------

# 테마 설정 
colorscheme jellybeans

# 기본 테마 확인 
$ ls -l /usr/share/vim/vim*/colors/

# 전체 사용자 환경설정
/etc/vimrc
# 사용자 설정 환경설정
~/.vimrc
```
### install
- #### lamp
  ```
  ### LAMP 설치
  https://webnautes.tistory.com/1185  

  Android php mysql 예제 :  
  https://webnautes.tistory.com/828

  Document Root : /var/www/html   

  sudo apt update && sudo apt upgrade  
  sudo apt install apache2  
  sudo apt install mysql-server  

  sudo mysql  
  create database db DEFAULT CHARACTER SET utf8;  
  create user 'jogilsang' identified by 'password';  
  GRANT ALL PRIVILEGES ON db.* TO 'jogilsang'@'localhost' identified by 'password';  

  adminer :  
  ```
  http://www.ubuntuboss.com/how-to-install-adminer-on-ubuntu/

  sudo apt-get update && sudo apt-get upgrade
  sudo apt-get install apache2 php5 php5-curl php5-cli php5-mysql php5-gd mysql-client mysql-server

  sudo mkdir /usr/share/adminer
  sudo wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
  sudo ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
  echo "Alias /adminer.php /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf
  sudo a2enconf adminer.conf
  sudo service apache2 restart
  
  cd /var/www/html  
  sudo touch dbcon.php  
  sudo touch insert.php  
  ```
### crontab
  `example`
  ```
  # 매일 1시에 log 로 끝나는 파일을 찾아서 find.log 파일로 저장
  0 1 * * *

  # 5분 마다 program.sh 실행
  */5 * * * *

  # 4-10 시 사이에 1시간마다 program.sh 실행
  0 4-10/1 * * *

  # 매일 1시, 3시에 program.sh 를 실행하고 로그를 저장
  0 1,3 * *

  # 평일에만 스크립트 실행
  * * * * 1-5
  ```

### cut
  `구분자(Delimiter)를 이용하여 출력. awk -F 와 동일`
  `example`
  ```bash
  # -d : delimiter
  # -f : fields
  echo "hello,world" | cut -d "," -f 1
  hello
  echo "hello,world" | cut -d "," -f 2
  world
  ```
### pgrep
  `ps와 grep을 합친 명령어. -f 옵션과 같이 사용해서 프로세스명으로 pid를 반환`
  `example`
  ```bash
  # 프로세스의 PID 출력
  [ec2-user@ip-172-31-36-232 ~]$ ps
  PID TTY          TIME CMD
  31831 pts/0    00:00:00 bash
  31858 pts/0    00:00:00 ps
  [ec2-user@ip-172-31-36-232 ~]$ pgrep -f bash
  31831
  [ec2-user@ip-172-31-36-232 ~]$ pgrep -f bas
  31831
  [ec2-user@ip-172-31-36-232 ~]$ pgrep -f bas | xargs echo
  31831
  # 프로세스 바로 죽임
  pgrep -f HiveMetaStore | xargs kill
  ```

### lynx
   `lynx는 텍스트 기반의 웹브라우저입니다.`
   `example`
   ```bash
   sudo lynx https://www.naver.com
   sudo lynx https://www.google.com
   ```
### date
   `date는 날짜형식을 출력합니다.`
   `example`
   ```bash
    # 당일
    year=`date +%Y` # 2021
    month=`date +%m` # 09
    day=`date +%d` # 22
    date=`date +%Y-%m-%d` # 2021-09-22

    # 어제, 내일
    yesterday=`date -d yesterday +%Y-%m-%d` # 2021-09-21
    tomorrow=`date -d tomorrow +%Y-%m-%d` # 2021-09-23

    # 요일
    monday=`date -d 'this monday'`
    tuesday=`date -d 'this tuesday'`
    wednesday=`date -d 'this wednesday'`
    thursday=`date -d 'this thursday'`
    friday=`date -d 'this friday'`
    saturday=`date -d 'this saturday'`
    sunday=`date -d 'this sunday'`

    # 예전,미래
    1_min_ago=`date -d '1 min ago' +%Y-%m-%d` # 1분전
    1_sec_ago=`date -d '1 sec ago' +%Y-%m-%d` # 1초전
    1_hour_ago=`date -d '1 hour ago' +%Y-%m-%d` # 1시간전
    1_day_ago=`date -d '1 day ago' +%Y-%m-%d` # 1일전
    1_week_ago=`date -d '1 week ago' +%Y-%m-%d` # 1주전
    1_month_ago=`date -d '1 month ago' +%Y-%m-%d` # 1달전
    1_year_ago=`date -d '1 year ago' +%Y-%m-%d` # 1년전

    # 문서
    info coreutils 'date invocation'
   ```
### uname
   `uname은 시스템 정보를 표시합니다`
   `example`
   ```
   # 전체정보
   uname -a
   Linux ip-10-253-97-240 4.9.32-15.41.amzn1.x86_64 #1 SMP Thu Jun 22 06:20:54 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux
   
   # 부분정보
   uname -a | awk '{print $1}'
   Linux
   ```
### bc
  `example`
  ```
  # 해당값의 90%를 구하기
  echo "($value / 10) * 9" | bc
  ```
### free
  `example1`
  ```
  # 전체(total)의 메모리 구하기 (정수)
  free -h | sed -n 2p | awk '{print $2}' | sed -r 's/M//g'
  
  # 사용중(used)의 메모리 구하기 (정수)
  free -h | sed -n 2p | awk '{print $3}' | sed -r 's/M//g'
  ```
  `example2`
  ```
  free -m
              total       used       free     shared    buffers     cached
  Mem:          3901       3711        189          0        118        741
  -/+ buffers/cache:       2851       1049
  Swap:            0          0          0

  # 
  # 리눅스는 사용하고 있지 않은 메모리를 빌려 디스크 캐싱에
  # 사용하기 때문에 메모리 여유공간이 없을 때 특정 프로그램의
  # 메모리 할당을 받으려고 하면 즉시 버퍼/캐시가 공간을 빌려 그 응용 프로그램에 
  # 할당을 해줍니다.
  # -/+ buffers/cache에 used와 free가 실제 사용량과 실제 남은 메모리양이다.
  ```
### tr
- `text replace`
  ```
  # 대상문자를 다른 문자로 변경한다. 
  echo "a:a" | tr ":" " " (= echo "a:a" | sed -r 's/:/ /g')
  a a
  
  # 대상문자를 다른 문자로 삭제한다. 
  echo "a:a" | tr -d ":" (= echo "a:a" | sed -r 's/://g')
  aa
  ```
### sort
- `출력을 정렬한다`
  ```
  # 출력결과를 뒤집는다.
  free -h | sort -r
  ```
### awk
- `입력을 분리하여 처리할 수 있다.`
  ```bash
  # 기본사용 : default
  $ echo "hello world" | awk '{print $1}'
  hello
  $ echo "hello world" | awk '{print $2}'
  world

  # -F 옵션 : 구분자(split 문자를 이용) 
  $ echo "hello world" | awk -F " " '{print $1}'
  hello
  $ echo "hello world" | awk -F " " '{print $2}'
  world
  $ echo "hello,world" | awk -F "," '{print $1}'
  hello
  $ echo "hello,world" | awk -F "," '{print $2}'
  world
  $ r=","
  $ echo "hello,world" | awk -F "$r" '{print $1}'
  hello
  $ echo "hello,world" | awk -F "$r" '{print $2}'
  world

  ```
### sed
- `패턴을 매칭하여 처리할 수 있다.`
  ```

  ```
### form
- #### json(jq)
- #### xml(xmllint)
  - `xml 형식에 맞게 출력하거나 데이터 추출`
  `example`
  ```
  # curl이나 파일 등을 읽고, xml 형식으로 beautify
  $ echo "<xml><key>A</key><value>B</value></xml>" | xmllint --format -
  
  # xml의 데이터를 추출
  $ 
  ```
### process
### system
- #### nmon
  `nmon는 로컬 시스템 정보를 표시하고 기록. 서버 성능모니터링 분석`
  `IBM AIX OS 분석용으로 제작됬지만, 리눅스용 제공됨`
  `install`
  1. [nmon16m_x86_64_rhel8 다운로드](http://nmon.sourceforge.net/pmwiki.php?n=Site.Download)
  2. 폴더만들기, sudo mkdir scp
  3. 윈도우에서 리눅스로 파일옮기기
  ```bash
  scp -i C:\Users\user\Downloads\key\ec2_cho_gilsangelandcokr.pem C:\Users\user\Downloads\nmon16m_x86_64_rhel8 ec2-user@ec2-13-124-146-48.ap-northeast-2.compute.amazonaws.com:/home/ec2-user/scp
  4. sudo chmod +x nmon16m_x86_64_rhel8
  5. ./nmon16m_x86_64_rhel8
  ```
  `option`
  ```
  ```
  `use`
  ```
  ```
### network
- #### nmap
`네트워크 보안 스캐너, Nmap(Network Mapper)`   
`option`   
`cli`
```
sudo yum install nmap
nmap -v

### 여러 IP대역대 확인
nmap 172.31.36.*/32
nmap 172.31.36.1-254

### port
대상 호스트의 특정 포트를 스캔하거나, 스캔할 포트의 범위를 지정
sudo nmap -p 1-1024 www.naver.com

### ping
#### 1. ICMP ping 확인
nmap -sP localhost

#### 2, ICMP ping 확인 (응답요청은 하지않음)
sudo nmap -PO localhost

#### 3.ping (ACK 패킷 송신)
sudo nmap -PT localhost

#### 4.ping (SYN 패킷 송신)
sudo nmap -PS localhost

### example
sudo nmap -vv -PT localhost --reason
sudo nmap -vv -dd -PT localhost --reason > test.txt
```   
- #### echo > /dev/tcp/
  ```
  // 성공
  $ echo > /dev/tcp/127.0.0.1/22
  $ echo $?
  0
  
  // 실패
  $ echo > /dev/tcp/127.0.0.1/10002
  bash: connect: 연결이 거부됨
  bash: /dev/tcp/127.0.0.1/10002: 연결이 거부됨
  $ echo $?
  1
  ```
- #### telnet
  - `원격지의 호스트나 IP에 해당 포트가 열려있는지 확인할 수 있는 명령어` 
  ```
  # 192.168.1.20주소의 80번 포트에 접속 
  telnet 192.168.1.20 80
  
  # https://www.naver.com의 443번 포트에 접속 
  telnet www.naver.com 443
  ```
- #### mtr
- #### traceroute
- #### ping
  ```
  -- 로컬IP - PING
  ping `curl http://169.254.169.254/latest/meta-data/local-ipv4`
  ```
- #### tcpdump
  `tcpdump는 CLI에서 실행하는 패킷캡쳐 프로그램 like wireshark, winDump`   
  `option`
  ```bash
  -- 옵션 : 출력카운트 10개
  -c 10
  -- 옵션 : 상세출력
  -v
  -- 옵션 : 프로토콜 미출력
  -q
  -- 옵션 : 주소번역 제거
  -n
  -- 옵션 : 타임스탬프, 전체정보, host및 port 출력
  -ttttvvvnn
  sudo tcpdump src 61.74.251.71 -ttttnnvvvc 5
  ```
  `use`
  ```bash
  -- 1. TCP/UDP만 캡쳐
  sudo tcpdump tcp
  sudo tcpdump udp
  
  -- 2. host와 src, dst 이용
  -- src의 ip가 192.168.0.1 이면서 port가 80인경우
  sudo tcpdump src port 80 and src 192.168.0.1
  -- src의 port가 8080이면서 tcp인경우
  sudo tcpdump src port 8080 and tcp
  -- src의 ip가 192.168.0.1이면서 dst의 포트가 8080 또는 8000 인경우
  sudo tcpdump 'src 192.168.0.1 and (dst port 8080 or 8000)'
  -- www.naver.com로 접속요청한 패킷
  sudo tcpdump host www.naver.com
  
  -- 3. 파일읽기/쓰기
  sudo tcpdump -w dump.log
  sudo tcpdump -r dump.log
  ```

- #### curl
  `네트워크 명령을 전송하는 도구`
  `example`
  ```bash
  # healthcheck - 200, 4xx, 5xx
  curl --write-out %{http_code} --silent --output /dev/null -L ${website}
  
  # 쿠키를 파일로 저장
  curl -v -I  -c cookiejar.txt https://www.example.com
  # 파일 또는 문자열에서 쿠키 읽기
  curl -v -I  -b cookiejar.txt https://www.example.com
  
  # 파일다운로드 
  curl -O http://apache.mirror.cdnetworks.com/oozie/4.3.1/oozie-4.3.1.tar.gz
  
  # 쉘 스크립트에서 백틱``으로 curl 명령어 호출 시, $변수사용하기
  $site_no => (X)
  ${site_no} => (X)
  "$site_no" => (X)
  \"$site_no\" => (X)
  "$((site_no))" => (X)
  '"$site_no"' => (O)
  ```

### Reference
Advanced Bash-Scripting Guide : https://tldp.org/LDP/abs/html/devref1.html        
Bash 쉘스크립트 개발 시작하기 : https://wikidocs.net/book/2370   

<!-- bash
System Performance
nmon, iostat, sar, vmstat

Others 
strace, dtrace, systemtap
uname,df,history

Network
nmap,tcpdump,ping,mtr,traceroute,dig
airmon,airodump, dig ,iptables, netstat

Process Monitoring
ps, top, htop, atop,lsof

Text Manipulation TOols
awk, sed, grep, sort, uniq, cat, cut, echo, fmt, tr, nl ,egrep, frep,wc -->

