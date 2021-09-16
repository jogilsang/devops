
# 4.linux

## INDEX
- ### [keymap](#keymap)
- ### [install](#install)
  - #### [lamp](#lamp)
- ### [crontab](#crontab)
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
<<<<<<< HEAD
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
=======
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
>>>>>>> 46ae033bce59feb5b4ee010644da1ce17d33387b
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

### Reference
Advanced Bash-Scripting Guide : https://tldp.org/LDP/abs/html/devref1.html        

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

