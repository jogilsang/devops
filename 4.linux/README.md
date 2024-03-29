
# 4.linux
> 서버의 4가지(CPU, 디스크, 네트워크, 메모리)는 잘 체크 해야한다
> 쉘이란? `사용자와 커널간에 인터페이스 역활을 하는 프로그램`   
> 쉘 스크립트란? `인터프리터에 의해 해석되고, 쉘에 의해 실행`   
> 쉘 스크립트를 사용하는 이유? `시스템 관리작업의 단순화, 자동화`
> Bash 의 변수는 본질적으로 타입이 없습니다(untyped)

## My Posting
- [쉘 스크립트 - curl 과 cookie를 활용한 서비스 모니터링](https://blog.naver.com/jogilsang/222353841647)   
- [쉘 스크립트 - 서버 가용메모리 체크 알람만들기, free 명령어](https://blog.naver.com/jogilsang/222508114389)
- [쉘 스크립트 - awk와 sed를 이용한 행열구조 데이터 추출, 서버 디스크용량체크 예시](https://blog.naver.com/jogilsang/222272256179)  

## INDEX
- [CONSOLE(KEYMAP)](#console(keymap))
- [VIM](#vim)
- [INSTALL](#install)
  - [LAMP](#lamp)
- [SHELL](#shell)
  - [ARR](#arr) 
  - [UNTIL](#until) 
  - [Boilerplate](#boilerplate) 
  - [복합조건](#복합조건) 
- [WHO](#who)
- [UPTIME](#uptime)
- [LOG](#log)
- [CRONTAB](#crontab)
- [CHMOD](#chmod)
- [Chown](#chown)
- [PARAM](#param)
- [WC](#wc)
- [LS,LL](#ls,ll)
- [FILE](#file)
- [Tar](#tar)
- [TOUCH](#touch)
- [CUT](#cut)
- [HEAD](#head)
- [TAIL](#tail)
- [FIND](#find)
- [GREP](#grep)
- [MKDIR](#mkdir)
- [PGREP](#pgrep)
- [LYNX](#lynx)
- [DATE,TIMEZONE](#date,timezon)
- [BASENAME,DIRNAME](#basename,dirname)
- [UNAME](#uname)
- [BC](#bc)
- [FREE](#free)
- [TR](#tr)
- [SORT](#sort)
- [AWK](#awk)
- [SED](#sed)
- [CAT](#cat)
- [FORM](#form)
  - [JSON(JQ)](#json(jq))
  - [XML(XMLLINT)](#xml(xmllint))
- [I\/O](#i\/O)
  - [df](#df)
  - [du](#du)
- [PROCESS](#process)
  - [PS](#ps)
  - [PSTREE](#pstree)
  - [PMAP](#pamap)
  - [PIDSTAT](#pidstat)
  - [top](#top)
  - htop
  - atop
  - [LSOF](#lsof)
- [SYSTEM](#system)
  - [NMON](#nmon)
  - iostat
  - sar
  - vmstat
- [NETWORK](#network)
  - [TCP](#tcp)
  - [ECHO > /DEV/TCP/](#echo%20>%20/dev/tcp/)
  - [NMAP](#nmap)
  - [MTR](#mtr)
  - [TRACEROUTE](#traceroute)
  - [PING](#ping)
  - [TCPDUMP](#tcpdump)
  - [CURL](#curl)
  - [DNS](#dns)
 - [REFERENCE](#Reference)
 - [TODO](#todo)
 - [쉘 스크립트를 쓰면 안 될 때](#쉘%20스크립트를%20쓰면%20안%20될%20때)

---
### console(keymap)
```
Tab : 자동 완성
Ctrl + D : 로그아웃
Ctrl + R : 히스토리 찾기
Ctrl + S : 키보드 잠그기
Ctrl + Q : 잠긴 키보드 풀기
Ctrl + M : Enter
Ctrl + P : 이전 명령어 (Up)
Ctrl + N : 다음 명령어 (Down)
Ctrl + L : 화면 지우기 (clear)
Ctrl + Y : 버퍼의 내용 붙여넣기
Ctrl + A : 입력 라인의 처음으로 이동 (Home)
Ctrl + E : 입력 라인의 끝으로 이동 (End)
Ctrl + B : 커서를 왼쪽으로 이동 (Left)
Ctrl + F : 커서를 오른쪽으로 이동 (Right)
Ctrl + XX : 커서를 이전 위치로 이동
Ctrl + U : 커서 왼쪽의 문자들을 버퍼에 저장 후 삭제
Ctrl + K : 커서 오른쪽의 문자들을 버퍼에 저장 후 삭제
Alt + L : 커서 위치에서 문자열 끝까지 소문자로 변환
Alt + U : 커서 위치에서 문자열 끝까지 대문자로 변환
Alt + T : 두 단어 위치 바꾸기
Alt + B : 커서를 다음 단어로 이동
Alt + F : 커서를 이전 단어로 이동

Alt + D : 커서기준 오른쪽삭제 (공백 이전까지)
Alt + Backspace : 커서기준 왼쪽삭제 (공백 이전까지)
```
### [vim](https://vim.rtorr.com/lang/ko/)

- vim에서 dd또는 yy로 복사한 텍스트를 크롬, 메모장, 워드와 같은 다른 프로그램으로 복사하고 싶을 때 복사가 되지않는다. vim은 os의 클립보드를 사용하는 것이 아닌, x11이라는 별도의 클립보드를 사용하기 때문이다. 시스템 클립보드를 지원하는 vim-huge 버전인  gvim 또는 vim-gtk, vim-gnome을 설치해야 시스템 클립보드를 사용할 수 있다
```
h,j,k,l - 좌,우,상,하 이동키
o : 현재 줄 다음위치 삽입

gg - 문서 첫 줄 시작으로 점프, 첫 라인으로
G - 문서 끝 줄 시작으로 점프, 마지막 라인으로
5G - 5번째 행 시작으로 점프
gd - 지역변수 선언위치로 점프
gD - 전역변수 선언위치로 점프
Ctrl + f - 한 화면 아래로 조정 (다음 페이지)
Ctrl + b - 한 화면 위로 조정 (이전 페이지)
H - 현재화면 상단으로 점프
M - 현재화면 중단으로 점프
L - 현재화면 하단으로 점프

e - 다음 단어 끝으로 점프 
b - 이전 단어 시작으로 점프 
% - 현재 괄호의 짝으로 점프

^ - 현재 행 시작으로 점프
$ - 현재 행 끝으로 점프 (공백 포함)

} - 다음 단락으로 점프
{ - 이전 단락으로 점프

Ctrl + e - 한 줄 아래로 화면 조정
Ctrl + y - 한 줄 위로 화면 조정

/pattern - 패턴 검색 (순방향)
n - 다음 검색항목으로 점프
N - 이전 검색항목으로 점프
:nohl - 패턴 하이라이트 끄기

u - 실행취소
Ctrl + r - 다시실행

dd - 한 행 잘라내기
cc - 한 행 삭제 (줄변경 없음)
2dd - 2줄 잘라내기
D - 한 행 끝까지 잘라내기
yy - 한 행 복사하기
2yy - 2줄 복사하기
yw - 다음 단어까지 복사하기
P - 커서 앞에 붙여넣기
dw - 다음 단어까지 잘라내기
x - 커서 앞 글자삭제
5x - 커서 앞 글자개수만큼 삭제 

V - 비주얼 라인

:q! - 강제종료 (저장X)
:wq! - 강제종료 (저장)
:%s/foo/bar/c - foo를 bar로 replace 한다
:set nu - 라인별로 number 표기
:set nonu - 라인별로 number 미표기
:e! - w 이후 작업 다 지우기

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
### shell
  `command나 script 작성을 위한 내용`
  ```bash
  su : substitute user
  sudo : substitute user do

  /usr/local/bin : 스크립트 파일을 이동할경우 스크립트 이름만으로 실행

  | : pipe는 표준출력을 표준입력으로 전달하며, |&로 사용할경우 표준에러도 함께 전달한다.
  > : redirection은 표준출력을 파일로 저장한다.

  0 : 표준입력 디스크립터(색인어)
  1 : 표준출력 디스크립터(색인어)
  2 : 표준에러 디스크립터(색인어)

  - /dev/null : 표준출력을 버리기위한 디스크립터(색인어)
  - 2>&1 : 표준에러를 표준출력으로 리다이렉션
  - example : 
    sample.sh > /dev/null
    sample.sh > /dev/null 2>&1
  
  # 문자열의 길이가 0이라면?
  param=""
  [ -z $param ] && echo "blank"

  # 디렉토리라면
  [ -d /home/ec2-user/scripts/ ] && echo "directory exist"
  exist
  [ -d /home/ec2-user/scripts ] && echo "directory exist"
  exist
  [ -d /home/ec2-user/scripts/empty ] && echo "directory exist"

  # 파일이 존재하면
  [ -e /home/ec2-user/scripts/memory_check.sh ] && echo "file exist"

  # 자기 자신을 지우는 스크립트.
  #!/bin/rm
  # 이 스크립트를 실행시키면 이 파일이 지워지는 것 말고는 아무일도 안 생깁니다.
  # 파일의 권한을 단순 실행만 주면 자동삭제안됨

  # 매개변수 체크하기
  if [ $# -ne 원하는_매개변수_갯수 ]
  then
    echo "사용법: `basename $0` 어쩌구저쩌구"
    exit $WRONG_ARGS
  fi

  # 공백이 포함된 문자열은 더블쿼팅을 하지않으면, echo할경우 공백이 지워지고 출력되게된다.

  # true false 기준
  echo "0 은 참." # if [ 0 ]
  echo "임의의 문자열은 참." # if [ xyz ]
  echo "NULL 은 거짓." # if [ ]
  echo "초기화 안 된 변수는 거짓." # if [ $xyz ]
  echo "널 변수는 거짓."     # xyz= if [ $xyz ]
  echo "\"false\" 는 참."   # if [ "false" ]

  ```

### 복합조건
  `&&와 ||을 사용한 if분기처리`
  `example`
  ```bash
  #  AND 연산
  #  if [ "$a" -eq 24 ] && [ "$b" -eq 24 ]
  #  if [ "$a" -eq 24 -a "$b" -eq 24 ]
  if [[ $a -eq 24 && $b -eq 24 ]]
  then
    echo "AND 연산확인 : 동일함"
  else
    echo "AND 연산확인 : 동일하지않음"
  fi

  #  OR 연산
  #  if [ "$a" -eq 24 ] || [ "$b" -eq 24 ]
  #  if [ "$a" -eq 24 -o "$b" -eq 24 ]
  if [[ $a -eq 24 || $b -eq 24 ]]
  then
    echo "OR 연산확인 : 동일함"
  else
    echo "OR 연산확인 : 동일하지않음"
  fi
  ```

### boilerplate
  `쉘 스크립트 모듈`
  `example`
  ```bash
  #!/bin/bash
  #!/bin/more
  # man magic

  # 루트사용자가 아니면 스크립트 실행불가
  if [ "$UID" -ne 0]
  then
    echo "이 스크립트는 루트로만 실행"
    exit 10
  fi

  # 매개변수 개수가 0인경우, 스크립트 실행불가
  if [ $# -eq 0]
  then
    echo "이 스크립트는 매개변수가 없음"
    exit 10
  fi

  # 명령어줄 인자가 존재하는지 여부
  if [ -n "$1"]
  then
    echo "인자가 존재하지않는다"
    exit 10
  fi

  # 현재경로와 지정된 경로와 비교
  # integer expression expected
  LOG_DIR=/var/log
  if [`pwd` != "$LOG_DIR"]
  then
    echo "$LOG_DIR 과 현재경로는 다릅니다"
  fi

  # null 로 초기화하기
  null_data=
  echo $null_data

  null_data=30
  unset null_data
  echo $null_data
  
  #  스크립트 종료시에 0을 리턴하면 쉘에게 성공했다고 알려줌.
  exit 0
  ```

### until
  `while문과 동일`
  `example`
  ```bash
  #!/bin/bash
  # ./shift.sh a b c d e f g
  # 모든 매개변수 다 사용하기
  until [ -z "$1" ]
  do
    echo "$1"
    shift
  done

  ```
### ARR
  `쉘 스크립트로 배열을 사용할 수 있다.`
  `example`
  ```bash
  # 배열 선언
  declare -A arr
  
  # 배열 초기화
  arr = (zero one two)
  arr = ([5]=zero [6]=fact)

  # 배열 값 할당 및 변경
  index=3
  arr[3]=5
  arr[5]="test"
  arr[$index]=8
  echo "${arr[$index]}"

  # 배열 값 증감
  # expr 문 사용 시, 띄어쓰기 필수
  arr[9]=3
  arr[10]=3
  arr[11]=`expr ${arr[9]} + ${arr[10]}`
  echo "${arr[11]}"
  6

  arr[11]=`expr ${arr[9]} + 3`
  echo "${arr[11]}"
  6

  # 배열의 index 증가
  index=0
  let "index += 1"
  index=`expr $index + 1`
  ```  

### who,w,ac,users,last
  `시스템에 현재 로그인해 있는 모든 사용자를 보여줍니다.`
  `example`
  ```bash
  # 전체 사용자들의 이름과 접속시간, IP정보
  [ec2-user@ip-172-31-36-232 ~]$ who
  ec2-user pts/0        2021-10-10 13:08 (61.74.251.71)

  # 현재 사용자의 이름과 접속시간, IP정보
  [ec2-user@ip-172-31-36-232 ~]$ who -m
  ec2-user pts/0        2021-10-10 13:08 (61.74.251.71)

  # 로그인하고있는 모든사용자
  [ec2-user@ip-172-31-36-232 ~]$ who -q
  ec2-user
  # users=1

  # 사용자이름만
  [ec2-user@ip-172-31-36-232 ~]$ whoami
  ec2-user

  # 로그인되어 있는 사용자와 관련된 모든 프로세스
  [ec2-user@ip-172-31-36-232 ~]$ w
  13:11:32 up 3 min,  1 user,  load average: 0.01, 0.03, 0.00
  USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
  ec2-user pts/0    61.74.251.71     13:08    2.00s  0.02s  0.00s w

  # ac :  GNU 계정 유틸리티(accounting utility)
  # 사용자가 로그인 해 있던 시간을 /var/log/wtmp 에서 읽어서 보여줍니다
  [ec2-user@ip-172-31-36-232 ~]$ ac -d
  Sep 10  total        3.21
  Sep 11  total        4.95
  Sep 12  total        4.34
  Sep 14  total        2.89
  Sep 16  total        4.03
  Sep 18  total        2.30

  # 사용자가 마지막으로 로그인 한 시간을 /var/log/wtmp
  [ec2-user@ip-172-31-36-232 ~]$ last
  ec2-user pts/0        61.74.251.71     Sun Oct 10 13:08   still logged in
  reboot   system boot  4.14.243-185.433 Sun Oct 10 13:07 - 13:21  (00:13)
  ec2-user pts/1        61.74.251.71     Sun Oct 10 13:00 - 13:05  (00:04)
  ec2-user pts/0        61.74.251.71     Sun Oct 10 10:23 - 13:01  (02:38)

  ```
### uptime
  `시스템이 얼마나 오랫동안 돌고 있었는지 나타내주는 시간`   
  `Load Average를 체크하여 이상여부 확인`   
  `example`
  ```bash
  # Load Average 확인
  # 1분,5분,15분값이 나열되어있다. 1분값이 > 5분,15분 -> 문제
  [ec2-user@ip-172-31-36-232 ~]$ uptime

  # 재부팅 후 켜져있는시간
  [ec2-user@ip-172-31-36-232 ~]$ uptime -p
  up 1 minute
  ```
### log
  `/var/log 경로에 있는 로그파일들`
  ```bash
  # /var/log/dmesg : 부팅 시의 시스템 로그가 기록(dmesg)
  # /var/log/wtmp : 최근의 접속 사항이 기록되는 파일(last 명령어)
  # /var/log/lastlog : 각 사용자의 마지막 로그인 내용(lastlog)
  # /var/log/httpd/access_logApache : Apache 서비스 데몬의 로그 파일
  # /var/log/httpd/error_log : Apache 서비스의 error 로그파일
  
  # 1. 시스템에 문제가 생겼을 때 가장 먼저 찾아보는 로그 파일
  sudo tail /var/logs/messages

  # 61.74.251.71의 IP를 가지고, 오늘 접속한 기록 최대 10개 출력
  # secure는 사용자 접속 정보가 기록되는 파일
  sudo cat secure | grep 61.74.251.71 | head -11
  ```

### dmesg

### crontab
  `example`
  ```bash
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

### chown
  `change owner, 즉 파일, 또는 폴더의 소유권을 변경하는 명령어`
  ```bash
  sudo chown ec2-user:ec2-user param_test.sh
  ```

### chmod
  `change mode, 파일이나 폴더의 권한(읽기, 쓰기, 실행)를 변경`
  `소유자(owner), group, others, r = 4, w = 2, x = 1`
  ```bash
  sudo chmod +x param_test.sh

  sudo chmod ug+rw test.txt
  sudo chmod u=rwx,g+x sample
  sudo chmod g+w test.txt
  sudo chmod o-rwx test.txt
  ```

### param
  `스크립트 파일에 사용자가 전달하는 변수. 매개변수는 공백으로 전달한다`
  `example`
  ```bash
  #!/bin/bash
  # param_test.sh
  # param의 길이
  length=$#
  echo "length : $length"

  # 파일이름
  fileName=$0
  echo "fileName : $fileName"

  # 파라미터
  param1=$1
  echo "param1 : $param1"

  # 파라미터 전부
  all_param=$*
  echo "all_param : $all_param"

  # pid
  pid=$$
  echo "pid : $pid"

  # exit param
  exit_param=$?
  echo "exit_param : $exit_param"

  [ec2-user@ip-172-31-36-232 scripts]$ ./param_test.sh a b c
  length : 3
  fileName : ./param_test.sh
  param1 : a
  all_param : a b c
  pid : 8657
  exit_param : 0
  ```
### wc -l
  `wc - print newline, word, and byte counts for each file`
  `라인이 몇라인인지 출력한다. grep과 같이 활용가능하다.`
  `example`
  ```bash
  -l, --lines, print the newline counts
  -w, --words, print the word counts
  -L, --max-line-length, print the length of the longest line
  
  [ec2-user@ip-172-31-36-232 logs]$ wc -l Apache_2k.log
  2000 Apache_2k.log
  [ec2-user@ip-172-31-36-232 logs]$ wc -l Apache_2k.log | awk '{print $1}'
  2000

  # 문서나 파일의 최대길이는 몇글자인지 출력
  # EX : 가장 긴 행의길이가 얼마일경우 
  [ec2-user@ip-172-31-36-232 logs]$ wc -L Apache_2k.log
  109 Apache_2k.log

  # 문서나 파일의 단어가 몇개인지 출력
  [ec2-user@ip-172-31-36-232 logs]$ wc -w Apache_2k.log
  24568 Apache_2k.log
  ```
  
### ls,ll
  `디렉토리의 파일리스트 출력`
  `example`
  ```bash
  # ll -> alias | grep ll
  # -a : 숨겨진 파일표시
  
  # 가장 용량이 큰 파일 10개를 사람이 읽을 수 있도록 출력
  ll -SS -h | head -11

  # 가장 용량이 작은 파일 10개를 사람이 읽을 수 있도록 출력
  ll -SSr -h | head -11
  
  # 가장 용량이 작은 파일 10개를 사이즈가 0인것을 제외하고, 사람이 읽을 수 있도록 출력
  ll -SSr -h | grep -v "0\s" | head -11

  # 가장 최근 파일부터 (내림차순)
  ll -t # ls -lat

  # 가장 오래된 파일부터 (오름차순)
  ll -tr # ls -latr


  ```

### file
  `파일의 타입을 확인한다`
  `example`
  ```bash
  # 단일 파일이나 디렉토리에 대한 타입확인
  [ec2-user@ip-172-31-36-232 scripts]$ file memory_check.sh
  memory_check.sh: Bourne-Again shell script, UTF-8 Unicode text executable

  # 디렉토리 내 모든 파일과 디렉토리의 파일타입확인
  [ec2-user@ip-172-31-36-232 ~]$ file *
  scp:     directory
  scripts: directory
  ```
### touch
  `파일을 생성한다`
  `example`
  ```bash
  # test파일을 생성한다.
  sudo touch test
  ```
### tar
  `Tape ARchiver의 줄임말. 여러개 파일을 compress하거나 extract할 떄 사용` 
  `example`
  ```bash
  # tar으로 압축하기
  tar cvf test.tar *
  tar cvf - `find . -mtime 1 -type f -print` > test.tar

  # gzip으로 압축하기
  gzip test.tar

  # gzip 풀기
  tar zxvf test.tar.gz

  # Option
  # -f     : 대상 tar 아카이브 지정. (기본 옵션)
  # -c     : tar 아카이브 생성. 기존 아카이브 덮어 쓰기. (파일 묶을 때 사용)
  # -x     : tar 아카이브에서 파일 추출. (파일 풀 때 사용)
  # -v     : 처리되는 과정(파일 정보)을 자세하게 나열.
  # -z     : gzip 압축 적용 옵션.
  # -j     : bzip2 압축 적용 옵션.
  # -t     : tar 아카이브에 포함된 내용 확인.
  # -C     : 대상 디렉토리 경로 지정.
  # -A     : 지정된 파일을 tar 아카이브에 추가.
  # -d     : tar 아카이브와 파일 시스템 간 차이점 검색.
  # -r     : tar 아카이브의 마지막에 파일들 추가.
  # -u     : tar 아카이브의 마지막에 파일들 추가.
  # -k     : tar 아카이브 추출 시, 기존 파일 유지.
  # -U     : tar 아카이브 추출 전, 기존 파일 삭제.
  # -w     : 모든 진행 과정에 대해 확인 요청. (interactive)
  # -e     : 첫 번째 에러 발생 시 중지.

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
### head
  `상위 몇개까지 보일 수 있는지 적용`
  `example`

### tail
  `파일의 마지막행을 기준으로 지정한 행까지 파일내용을 출력하는 명령어`
  ```bash
  # scripts
  #!/bin/sh

  # 감시 대상 로그 파일명 설정

  logfile="/var/log/apache2/access.log"

  # tail 로그명령어로 로그 감시
  # * -F 실시간 감시
  # * -n 추가분만 표시

  tail -F -n 0 "$logfile" |\
    while read line
    do
      case "$line" in
        *"200"*)
                echo "성공 :  $line"
                ;;
                    *"Application Error"*)
                    echo "!경고! 애플리케이션 이상 : $line"
                ;;	
      esac
    done
  ```

### find
  `디렉토리 상에 있는 파일을 찾는다.`
  `example`
  ```bash
  # 현재 경로부터 하위경로까지 단어를 포함한 파일을 찾는다.
  sudo find . -name "*file*"

  # 현재 디렉토리의 모든 파일중 최근 24시간 안에 변경된 파일들
  sudo find . -mtime 1 -type f -print
  ```
### mkdir
  `특정경로의 폴더를 생성한다`
  `example`
  ```bash
  # 상위경로까지 생성한다.
  mkdir -p
  ```
### grep
  `특정 문자열이나 정규식을 포함하고 있는 행이나 파일을 검색하는 명령어`
  `example`
  ```bash
  # -n, --line-number, 행 번호를 기재해서 표기
  # -i, --ignore-case, 대소문자 무시
  # -l, --files-with-matches, 포함되는 파일목록
  # -L, --files-without-match, 포함되지않는 파일목록
  # -c, --count, 매칭되는 행의개수
  # -x, --line-regexp, 라인전체가 일치
  # -w, --word-regexp, 단어가 정확히 일치해야함
  #  -o, --only-matching
  # -A NUM, --after-context=NUM, 패턴이 매칭된 라인 이후 몇라인
  # -B NUM, --before-context=NUM, 패턴이 매칭된 라인 이전 몇라인
  # -C NUM, -NUM, --context=NUM, 패턴이 매칭된 라인 전후 몇라인
  # -n, --line-number
  # -i, --ignore-case
  # -l, --files-with-matches 
  # -L, --files-without-match
  # -c, --count
  
  # 1. 문자가 포함된 행을 출력
  # 1.1 행번호 포함
  [ec2-user@ip-172-31-36-232 scripts]$ grep -n -w "echo" memory_check.sh
  6:echo "TotalMemory : ${TotalMemory}"
  8:echo "CurrentUsedMemory : ${CurrentUsedMemory}"

  # 1.2 before, after 전후 라인까지 출력
  [ec2-user@ip-172-31-36-232 scripts]$ grep -C 2 -n -w 'then' memory_check.sh
  13-
  14-# 한계값 이상인 경우, 알람
  15:if [ ${CurrentUsedMemory} -gt ${limit} ]; then
  16-  echo "현재 사용중인 메모리(${CurrentUsedMemory}) 는 전체 메모리(${TotalMemory})의 90%이상입니다."
  17-else

  # 2. 문자가 포함된 행의갯수
  [ec2-user@ip-172-31-36-232 scripts]$ grep -c -w "echo" memory_check.sh
  6
  [ec2-user@ip-172-31-36-232 logs]$ grep -w -c '\[notice\]' Apache_2k.log
  1405
  [ec2-user@ip-172-31-36-232 logs]$ grep -w -c notice Apache_2k.log
  1405
  # 2.1. 공백문자과 지정문자가 포함된 행의갯수 (걸러지지않으면, 공백이 아닌거임)
  [ec2-user@ip-172-31-36-232 logs]$ grep -i -w -c '[[:space:]]\[notice\]' Apache_2k.log
  1405
  [ec2-user@ip-172-31-36-232 logs]$ grep -i -w -c '\s\[notice\]' Apache_2k.log
  1405
  [ec2-user@ip-172-31-36-232 logs]$ grep -i -w -c ' \[notice\]' Apache_2k.log
  1405
  
  # 2.2. 단어의 개수
  [ec2-user@ip-172-31-36-232 logs]$ grep -o -w -c notice Apache_2k.log
  1405
  [ec2-user@ip-172-31-36-232 logs]$ grep -o -w notice Apache_2k.log | wc -w
  1405

  # 2.3. 로그통계 추출하기 (awk 이용)
  [ec2-user@ip-172-31-36-232 logs]$ cat Apache_2k.log | awk '{arr[$6]+=1} END {for(i in arr){print i, arr[i]}}'
  [notice] 1405
  [error] 595

  # 문자가 포함된 파일목록
  [ec2-user@ip-172-31-36-232 scripts]$ grep -l -w "echo" *
  memory_check.sh

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
### dirname,basename
   `파일명에서 파일이름과 경로명을 각각 보여준다`
   `example`
   ```bash
   a=/home/ec2-user/scripts

  echo "/home/ec2-user/scripts 의 basename = `basename $a`" #/home/ec2-user
  echo "/home/ec2-user/scripts 의 dirname = `dirname $a`" #scripts
  echo
  echo "내 홈 디렉토리는 `basename ~/`."
  echo "내 홈 디렉토리의 홈은 `dirname ~/`"
  echo

  echo "스크립트 이름은 \"$0\"."
  echo "스크립트 이름은 \"`basename $0`\"."
   ```

### date,timezon
   `timezone은 영국의 그리니치 천문대(본초 자오선, 경도 0도)를 기준으로 지역에 따른 시간의 차이` 
   ```bash
    ### TIMEZONE이 틀릴경우 (AWS ami 기준)
    sudo vi /etc/sysconfig/clock
    ZONE="Asia/Seoul"
    sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
    sudo reboot
   ```
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
    
                Format/result           |       Command              |          Output
    --------------------------------+----------------------------+------------------------------
    YYYY-MM-DD                      | date -I                    | $(date -I)
    YYYY-MM-DD_hh:mm:ss             | date +%F_%T                | $(date +%F_%T)
    YYYYMMDD_hhmmss                 | date +%Y%m%d_%H%M%S        | $(date +%Y%m%d_%H%M%S)
    YYYYMMDD_hhmmss (UTC version)   | date --utc +%Y%m%d_%H%M%SZ | $(date --utc +%Y%m%d_%H%M%SZ)
    YYYYMMDD_hhmmss (with local TZ) | date +%Y%m%d_%H%M%S%Z      | $(date +%Y%m%d_%H%M%S%Z)
    YYYYMMSShhmmss                  | date +%Y%m%d%H%M%S         | $(date +%Y%m%d%H%M%S)
    YYYYMMSShhmmssnnnnnnnnn         | date +%Y%m%d%H%M%S%N       | $(date +%Y%m%d%H%M%S%N)
    YYMMDD_hhmmss                   | date +%y%m%d_%H%M%S        | $(date +%y%m%d_%H%M%S)
    Seconds since UNIX epoch:       | date +%s                   | $(date +%s)
    Nanoseconds only:               | date +%N                   | $(date +%N)
    Nanoseconds since UNIX epoch:   | date +%s%N                 | $(date +%s%N)
    ISO8601 UTC timestamp           | date --utc +%FT%TZ         | $(date --utc +%FT%TZ)
    ISO8601 UTC timestamp + ms      | date --utc +%FT%T.%3NZ     | $(date --utc +%FT%T.%3NZ)
    ISO8601 Local TZ timestamp      | date +%FT%T%Z              | $(date +%FT%T%Z)
    YYYY-MM-DD (Short day)          | date +%F\(%a\)             | $(date +%F\(%a\))
    YYYY-MM-DD (Long day)           | date +%F\(%A\)             | $(date +%F\(%A\))
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
- `tr - translate or delete characters`
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

  # example
  1. get column info
  2. {print} {print $0} is mean everything
  3. awk -F ":" '{print $1}' /etc/passwd
  4. awk -F ":" '{print $1"\t"$6"\t"}' /etc/passwd
  5. awk BEGIN
  6. awk -F "/" '/^\// {print $NF}' /etc/shells | uniq | sort
  7. df | awk '/\/dev\/loop/ {print $1"\t"$2"\t"$3}'
  8. df | awk '/\/dev\/loop/ {print $1"\t"$2 + $3}'
  9. df | awk '/\/dev\/loop/ {print $1"\t"$2 - $3}'
  10. awk 'length($0) > 7' /etc/shells
  11. ps -ef | awk '{ if($NF == "[md]") print $0}'
  12. awk 'BEGIN { for(i=1; i<=10 ; i++) print "The square root of", i, "is", i*i;}'
  13. df | awk 'NR==7, NR==11 {print NR, $0}'
  14. awk 'END {print NR}' /etc/shells
  15. awk match

  #Sample
  온라인 연결 상태 (pid 가 없다면 그 프로세스는 실행중이 아님)
  https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/procref1.html#CONSTAT
    ```

### sed
- `패턴을 매칭하여 처리할 수 있다.`
- `example`
  ```bash
  # 출력결과에 2번째 행만 보여준다
  free -m | sed -n 2p
  # 출력결과의 글자를 다른글자로 바꿔준다
  free -m | sed -n 1p | sed -r 's/total/totalValue/g'

  # option
  # -n : 패턴이 일치할경우에만 줄 출력

  # example
  sed -i 's/Taylor/Tyler/g' .bashrc
  cat /etc/shells | sed -e 's/usr/u/g' -e 's/bin/b/g'
  cat /etc/shells | sed -e 's|usr|u|g' -e 's#bin#b#g'
  cat /etc/shells | sed -n '/usr/p' # usr을 포함하는 줄 출력
  sed -i 's/ *$//' test.sh
  sed -i 's/[[:space:]]*$//' test.sh
  sed 's/[a-z]/\U&/g' test.sh # 소문자 -> 대문자
  sed 's/[a-z]/\L&/g' test.sh # 대문자 -> 소문자 
  sed 11q .bashrc
  s/00*/0/g # 연속적인 모든 0을 하나의 0으로 압축하라.
  s/00*/0/ # 처음나오는 연속적인 0을 하나의 0으로 압축하라.
  sed '/^$/d' # 비어있는줄 제거 (empty line gone)
  sed '/GUI/d' 	"GUI"를 포함하는 모든 줄을 지워라.
  sed 's/GUI//d' 	"GUI"가 나오는 줄에서 "GUI"만 지워라

  # sample
  파일에서 빈 줄을 지워주는 간단한 스크립트
  파일에서 어떤 패턴을 다른 패턴으로 바꿔주는 스크립트
  https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/textproc.html#WF  

  파일 이름에 일반적이지 않은 문자나 공백 문자를 포함하는 파일을 지우기.
  https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/moreadv.html#EX57

  낱말 빈도수 분석
  https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/textproc.html#WF

  ```

### cat
  `두 개 이상의 파일을 concatenate해서 출력`
  `example`
  ```bash
  # 파일은 냅두고, 안의 내용만 삭제
  cat /dev/null > filename
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
### I/O
  - #### df
    `디스크나 디렉토리의 용량을 확인할 수 있다.`
    `example`
    ```bash
    df 
    ```
  - #### du
    `하위 디렉토리까지 파일크기의 점유율을 확인할 수 있다.`
    `example`
    ```bash
    # s : summarize
    # h : human readable
    du -sh 
    du -sh /usr/*
    ```
### process
  - #### ps
    `example`
    ```bash
    ### java로 실행중인 프로세스 찾기
    ps -ef | grep java
    ps -C java

    ### Thread의 ID찾기
    ### EX 1 : java로 실행중인 Thread 찾기
    ps -eLF | grep java
    ### EX 2 : java로 실행중인 Thread를 특정 PID로 찾기
    ps -LF -p 2250
    ```
  - #### pstree
    `특정 프로세스의 부모 프로세스와 자식 프로세스를 확인할 수 있다`
    `example`
    ```bash
    ### 1. 해당 프로세스를 kill해도 반응이없다면, 부모 프로세스를 찾아서 kill해야되는경우
    ```
  - #### pmap
    `프로세스의 메모리 상황을 확인`
  - #### pidstat
    `프로세스별 CPU 사용량 확인`
  - #### top
    `OS에서 수행중인 전반적인 작업들을 확인할 수 있다`
    ```bash
    # 배치작업도 가능
    # 장애가 발생한 시점에 어떤 프로세스들을 수행하고 있었는지 확인
    # 성능 테스트를 할 때 각 프로세스별로 CPU를 얼마나 사용하는지 확인가능

    # h키를 누르면 단축키도움말이 보임

    top
    # PR : 작업의 우선순위
    # NI : 작업의 nice값. 음수면 우선순위 높음
    # VIRT : RES + SWAP
    # RES : 점유중인 메모리
    # SHR : 공유 메모리 크기
    # S : 상태
    # TIME + : 해당 프로세스가 메모리를 점유한 누적시간
    # COMMAND : 명령어정보
    ```
  - #### lsof
    `list open files의 약자. 실행중인 프로세스에서 열고있는 파일 확인`
    ```bash
    # -c : 명령어로 실행되는 프로세스
    lsof -c java
    # -f : 파일에 대한 정보확인
    lsof -f -- /proc
    ```
    `네트워크 포트 확인명령어`
    ```bash
    lsof i4 ## ipv4
    lsof i@localhost
    lsof iTCP
    ```
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
- #### iostat
  `disk IO의 지표를 측정하는 명령어`
- #### sar
  `System Active Report, 시스템 운영정보를 확인하는 명령어`   
  -S XDISK : disk io 및 파일 시스템 지표 추출   
  -S SNMP : network 지표 중 icmp,ip,tcp 등의 지표를 추출

  `example`
  ```bash
  # [ -s [ <hh:mm:ss> ] ] [ -e [ <hh:mm:ss> ] ]
  sar -n SOCK -s 00:00:00 -e 01:00:00

  # CPU 사용률
  sar -u
  # 메모리 사용률
  sar -r
  # 소켓 사용률 
  # SOCK : 소켓 (v4)   
  sar -n SOCK
  
  # example1 : 메모리가 부족해서 swap을 하면 disk io에 부하가 생김
  sar -W -S
  # example2 : bad sector 카운트가 올라가면서 순간 io가 멈추는 경우가 생김.
  #            i/o util이나 await 항목 확인
  sar -d

  # example3 : 
  #            네트워크 디바이스의 통계  
  sar -n DEV 1

  # example4 : 
  #            tcp 연결요청(connect) (closed -> SYN-SENT)
  #            tcp 연결수락(accept) (listen -> SYN-RCVD)
  sar -TCP,ETCP 1
  ```
- #### vmstat
  ``
  `example`
  ```bash
  # r은 CPU Run Queue이기때문에, 실행대기중인 프로세스 
  # CPU코어개수가 r값(실행대기중 프로세스) 보다 작다면,과열되서 실행
  # User와 System의 PCU 사용량은 8:2가 정상. 9:1 이상인경우, 자바어플리케이션에서 대부분 CPU사용
  ```

### network
- #### tcp
> 클라우드 기반으로 동작하는 서버들은 서버가 낼 수 있는 최대의 성능을 끌어내야한다. 이런 작업은 커널에 대한 이해가 바탕이되어야 가능하다

- 1\. time wait 소켓
    - 4way handshake에서 fin패킷 보내는 쪽 time_wait 소켓을 생성한다.
    - `net.ipv4.ip_local_port_range`는 외부와 통신하기위한 로컬포트의 범위이다. 로컬포트가 고갈될경우, 어플리케이션 타임아웃이 발생한다.
    ```sh
    # 포트범위 조절
    sysctl -w "net.ipv4.ip_local_port_range=32768 32768"
    curl http://www.kakao.com > /dev/null
    curl http://www.kakao.com > /dev/null
    ```
    - 4개의 값이 커널 내 유일하게 존재(src ip, port, dst ip,port) 한다
    - 웹서버에서는 rw_recycle이 켜져있으면 안된다. 연결은 안되고 연결요청만 계속해서 발생하게될 수 있다
    - timewait 소켓은 세션연결을 먼저 끊으려는 쪽에서 발생한다
    - 클라이언트 쪽에서는 로컬포트고갈 문제가 net.ipv4.tcp_tw_reuse=1 를 설정함으로써 해결할 수 있다
    - 서버입장에서는 net.ipv4.rw_recycle 파라미터를 통해 소켓을 회수할 수 있지만, syn패킷이 버려질 수 있다
    - keepalive기능은 tcp 3way handshake와 time_wait를 줄일 수 있다
    - time_wait소켓은 정상적인 Tcp연결헤제를 위해서는 반드시 필요하다

- 2\. TCP keepalive 세션유지
    - netstat -napo
    - keepalive는 양 종단 간에 연결을 유지할 수 있고 좀비커넥션(=FIN패킷을 받지못해 정리되지 않고 남아있음)을 방지하기위해 비정상적인 소켓을 종료할 수 있도록한다
    - http keepalive와 Tcp keepalive가 둘다 설정되어있다면, http keepalive를 우선으로 적용한다.
    - nginx를 앞에 두는이유는 무엇일가? https 사용할경우 인증서설정과 관리등의 문제. UserAgent 확인, Referer 확인 등과같이 서비스 외적으로 설정해야하는 요소들
    - ab툴을 이용한 테스트
    ```sh
    ab -n 10000 -c 1 http://server.domain.com
    ```
    - 세션의 rto(retransmission timeout)값을 확인
    ```sh
    ss -i
    ```

- 3\. TCP 재전송과 타임아웃
- TCP 재전송과 관련된 커널 파라미터 확인하기
    - orphan_socket : fin_wait1 상태의 소켓으로 커널에 귀속된 상태. pid다 조회되지않는다
    - 재전송을 견디려면 ConnectionTimeout은 3초, ReadTimeout은 300ms
    ```sh
    sysctl -a | grep -i retries

    net.ipv4.tcp_retries1
    net.ipv4.tcp_retries2
    net.ipv4.tcp_syn_retries
    net.ipv4.tcp_synack_retries
    net.ipv4.tcp_orphan_retries
    ```

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
  
  # 공인IP, public IP 알아보기
  curl http://ipecho.net/plain
  
  # 인코딩이 깨질경우 (euc-kr, utf-8)
  | iconv -f euc-kr -t utf-8
  
  # 인코딩이 그래도 깨진다면
  | iconv -l
  
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

- #### dns 
  ```bash
  # nslookup 으로 도메인에 대한 DNS질의가 안된다면
  # 1. ip가 static으로 도메인과 연결되어있는지 확인
  cat /etc/hosts.conf
  # 2. nameserver 확인
  cat /etc/resolv.conf
  ```

### Reference
#### doc
- Advanced Bash-Scripting Guide : https://tldp.org/LDP/abs/html/devref1.html        
- Bash 쉘스크립트 개발 시작하기 : https://wikidocs.net/book/2370   
- dummy 시스템로그 다운받기 : https://github.com/logpai/loghub
- Bash Reference Manual : http://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html
- 고급 Bash 스크립팅 가이드 : https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/index.html

### Tip
[[Linux 팁] grep, awk를 이용한 access로그 통계 추출하기](https://blog.naver.com/PostView.nhn?isHttpsRedirect=true&blogId=kibani&logNo=220963537520)   
[[VIM] 1. VIM 을 이용한 코드 정리 정규 표현식](https://doitnow-man.tistory.com/160?category=676183)   
[고급 Bash 스크립팅 가이드](https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/index.html)

### TODO
- [톰캣 Accesslog 통계 count 추출](https://powerkkim.tistory.com/entry/log%EB%B6%84%EC%84%9D-2-%ED%86%B0%EC%BA%A3-Accesslog-%ED%86%B5%EA%B3%84-count-%EC%B6%94%EC%B6%9C-feature-awk-grep?category=654700)

### 쉘 스크립트를 쓰면 안 될 때
```
쉘 스크립트를 쓰면 안 될 때
- 리소스에 민감한 작업들, 특히 속도가 중요한 요소일 때(정렬, 해쉬 등등)
- 강력한 산술 연산 작업들, 특히 임의의 정밀도 연산(arbitrary precision)이나 복소수를 써야 할 때(C++이나 포트란을 쓰세요)
- 플랫폼간 이식성이 필요할 때(C를 쓰세요)
- 구조적 프로그래밍이 필요한 복잡한 어플리케이션(변수의 타입체크나 함수 프로토타입등이 필요할 때)
- 업무에 아주 중요하거나 회사의 미래가 걸렸다는 확신이 드는 어플리케이션
- 보안상 중요해서, 여러분 시스템의 무결성을 보장하기 위해 외부의 침입이나 크래킹, 파괴등을 막아야 할 필요가 있을 때
- 서로 의존적인 관계에 있는 여러 콤포넌트로 이루어진 프로젝트
- 과도한 파일 연산이 필요할 때(Bash는 제한적인 직렬적 파일 접근을 하고 , 특히나 불편하고 불충분한 줄단위 접근만 가능)
- 다차원 배열이 필요할 때
- 링크드 리스트나 트리같은 데이타 구조가 필요할 때
- 그래픽이나 GUI를 만들고 변경하는 등의 일이 필요할 때
- 시스템 하드웨어에 직접 접근해야 할 때
- 포트나 소켓 I/O가 필요할 때
- 예전에 쓰던 코드를 사용하는 라이브러리나 인터페이스를 써야 할 필요가 있을 때
- 독점적이고 소스 공개를 안 하는 어플리케이션을 짜야 할 때(쉘 스크립트는 필연적으로 오픈 소스입니다.)
출처 : https://wiki.kldp.org/HOWTO/html/Adv-Bash-Scr-HOWTO/why-shell.html
```

### Linux Performance Analysis in 60,000 Ms, 브렌든 그레그
```bash
uptime
dmesg | tail
vmstat 1
mpstat -P ALL 1
pidstat 1
iostat -xz 1
free -h
sar -n DEV 1
sar -TCP,ETCP 1
top
```

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

<!-- keyword
network :
  Possible  keywords  are  DEV,  EDEV,  NFS, NFSD, SOCK, IP, EIP, ICMP, EICMP, TCP, ETCP, UDP, SOCK6, IP6, EIP6, ICMP6, EICMP6 and UDP6.

https://github.com/netdata/netdata/wiki

 -->

