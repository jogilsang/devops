
# 4.linux

## INDEX
- ### [install](#install)
  - #### [lamp](#lamp)
- ### [network](#network)
  - #### [nmap](#nmap)
  - #### [mtr](#mtr)
  - #### [traceroute](#traceroute)
  - #### [ping](#ping)
  - #### [tcpdump](#tcpdump)
  
---
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

### network
- #### nmap
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
