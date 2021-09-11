# manual-dev

# Requested Skills
```
프로그래밍 : node.js, Go, Python 
운영체제 : Shell, OS metrics, File System, 7 Layers 등
서버관리 : Iac, CI/CD, API, 가용성, 성능 등
오픈소스 : nginx, Tomcat, MySQL, Redis, Ansible, Terraform 등
클라우드 : AWS,Azure,GCP 등
```

# Reference
- [devops의 정의](https://www.atlassian.com/devops)
- [애자일 선언문](https://ko.wikipedia.org/wiki/%EC%95%A0%EC%9E%90%EC%9D%BC_%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4_%EA%B0%9C%EB%B0%9C#%EC%95%A0%EC%9E%90%EC%9D%BC_%EC%84%A0%EC%96%B8%EB%AC%B8)
- [12 factors](https://12factor.net/ko/)


### 시간 타임존 한국시간
sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime   

### ssh 접속
```
ssh -i EC2key.pem ubuntu @ EC2-Public-IP
```

### 리눅스 포트 linux port
```
netstat -nap | grep :4000
```

### 시간서버
```
time2.kriss.re.kr
```

###
winscp : ec2랑 파일교환 가능하게함  
https://winscp.net/eng/download.php

<hr/>

### 패스워드설정
passwd  

### PUTTY
1. default
```
로깅 LOGGING : 
&H-&Y&M&D_&T.putty.log

PEM -> PPK
https://blog.naver.com/jogilsang/221432071928
```

2. config
```
Terminal
Bell - None

Window
Lines of Scrollback 10000
Display Scrollbar in full screen mode

Window - Appearence
Font 14
Gap between text and window edge 3

Behaviour
Full screen on Alt - Enter

Window Translation
UTF-8
```

3. config down and backup
```
regedit
내 컴퓨터 - HKEY_CURRENT_USER - SOFTWARE - SimonTatham - PuTTY - Sessions
right mouse - 내보내기
```

### winSCP
다운로드 :  
https://winscp.net/download/WinSCP-5.9-Setup.exe  
(putty 설정도 다가져옴. 애시당초 )  

설명 :  
https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/putty.html  

### pscp
pscp -i C:\Users\user\Downloads\jogilsang.ppk C:\Users\user\Downloads\wpbox-woocommerce-korean-20180527\woocommerce-ko_KR.mo ec2-user@ec2-13-125-69-120.ap-northeast-2.compute.amazonaws.com:/home/ec2-user/woocommerce-ko_KR.mo  
-> 양식은 이런대 안됨...ㅡㅡ  

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
```
 
cd /var/www/html  
sudo touch dbcon.php  
sudo touch insert.php  

### 리눅스 명령어
```
환경변수 수정 :
sudo vi /etc/environment

삭제 :  
sudo rm - r [forder-name]  
```

### java 파일 실행하기
```
eclipse로 만든거 git에 올리기
git으로 다운받기
bin,src 중에서 bin으로 들어가기
java -cp 패키지명.메인클래스
```

### jar 만들기 생성
```
sudo vi manifest.txt
(Main-Class: MainClass <--- main 함수 있는 클래스)

jar -cvmf manifest.txt [jar파일명] [클래스1] [클래스2] or 
jar -cvmf manifest.txt [jar파일명] *.class

java -jar 파일명.jar

출처: http://ra2kstar.tistory.com/125 [초보개발자 이야기.]
```

### 사이트주소
- 프리티어 설명서
```
https://aws.amazon.com/ko/free/
```

- 10분 자습서
```
https://aws.amazon.com/ko/getting-started/tutorials/?pg=ln&p=s3
```

- AWS 기반 프로젝트
```
https://aws.amazon.com/ko/getting-started/projects/?pg=ln&p=s3
```

- AWS 무료 교육 및 자격증  
```
https://www.aws.training/
```

<hr/>

### linux command

sudo : 관리자권한  
touch : 파일생성  
vi : 편집 
mv : 

### Amazon EC2
window 2012 R2 Server  
```
-Default Setting
https://blog.naver.com/jogilsang/221385508604
(자습서 : https://aws.amazon.com/ko/getting-started/tutorials/launch-windows-vm/?trk=gs_card)

-WordPress Deploy
https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/WindowsGuide/EC2Win_CreateWordPressBlog.html

-Instance Connect
https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/WindowsGuide/connecting_to_windows_instance.html

```

Ubuntu Server 18.0.4
1. nodejs
```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v
sudo apt-get install build-essential
```

Ubuntu Server 16.0.4  
1. 시작
```
sudo apt-get update
```

2. 그 외 정보들
```
-elastic ip  
https://blog.naver.com/jogilsang/221380379924

-Domain DNS Setting  
https://blog.naver.com/jogilsang/221369907088

-dnsmasq, ns server  
https://blog.naver.com/jogilsang/221370424937

-timezone, korea  
https://blog.naver.com/jogilsang/221375057555
```


4. git 깃 설치
```
sudo apt-get install python-software-properties
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git-core
```

5. nodejs
```
sudo apt-get install nodejs
sudo apt-get install npm
nodejs -v
```

