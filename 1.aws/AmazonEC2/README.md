# 1.aws / EC2

## INDEX
### [meta-data](#meta-data)
### [EBS](#EBS)
### [SecurityGroup](#SecurityGroup)
### [jar 만들기 생성 :: java](#jar%20만들기%20생성%20::%20java)

---

## CLI
```bash
## 시간 타임존 한국시간
sudo ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime   

## ssh 접속
ssh -i EC2key.pem ubuntu @ EC2-Public-IP


### 시간서버
time2.kriss.re.kr

### 파일복사 이동 윈도우 -> 리눅스 pscp 
*** scp -i [pem파일경로] [보낼려는파일경로] [사용자계정]@[AWS-EC2주소]:[받으려는위치]
*** [받으려는위치]는 mkdir 등으로 리눅스 서버에 미리 생성해야한다.
scp -i C:\Users\user\Downloads\key\ec2_cho_gilsangelandcokr.pem C:\Users\user\Downloads\nmon16j.tar.gz ec2-user@ec2-13-124-146-48.ap-northeast-2.compute.amazonaws.com:/home/ec2-user/scp
pscp -i C:\Users\user\Downloads\jogilsang.ppk C:\Users\user\Downloads\wpbox-woocommerce-korean-20180527\woocommerce-ko_KR.mo ec2-user@ec2-13-125-69-120.ap-northeast-2.compute.amazonaws.com:/home/ec2-user/woocommerce-ko_KR.mo  

```

## meta-data
```
curl http://169.254.169.254/latest/meta-data/local-ipv4;echo

src : https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html
```

### EBS
```
EC2 인스턴스 디스크용량 확장하기(Free tier 에서 30GB 까지 가능)  
https://blog.naver.com/jogilsang/221370362752
```

### SecurityGroup
```
유형
프로토콜
포트 범위
소스
설명 - 선택 사항
HTTP	TCP	80	0.0.0.0/0	–
HTTP	TCP	80	::/0	–
사용자 지정 TCP	TCP	8080	0.0.0.0/0	TOMCAT
사용자 지정 TCP	TCP	8080	::/0	TOMCAT
사용자 지정 TCP	TCP	4200	0.0.0.0/0	Angular
사용자 지정 TCP	TCP	4200	::/0	Angular
사용자 지정 TCP	TCP	8443	0.0.0.0/0	redirect tomcat
사용자 지정 TCP	TCP	8443	::/0	redirect tomcat
사용자 지정 TCP	TCP	8009	0.0.0.0/0	TOMCAT3
사용자 지정 TCP	TCP	8009	::/0	TOMCAT3
사용자 지정 TCP	TCP	5229	0.0.0.0/0	FCM
사용자 지정 TCP	TCP	5229	::/0	FCM
사용자 지정 TCP	TCP	3030	0.0.0.0/0	GRAFANA
사용자 지정 TCP	TCP	3030	::/0	GRAFANA
사용자 지정 TCP	TCP	7000	0.0.0.0/0	cafe24
사용자 지정 TCP	TCP	7000	::/0	cafe24
SMB	TCP	445	0.0.0.0/0	smb
SMB	TCP	445	::/0	smb
HTTPS	TCP	443	0.0.0.0/0	–
HTTPS	TCP	443	::/0	–
SSH	TCP	22	0.0.0.0/0	–
SSH	TCP	22	::/0	–
사용자 지정 TCP	TCP	21	0.0.0.0/0	FTP
사용자 지정 TCP	TCP	21	::/0	FTP
사용자 지정 UDP	UDP	137 - 138	0.0.0.0/0	smb
사용자 지정 UDP	UDP	137 - 138	::/0	smb
사용자 지정 TCP	TCP	4000	0.0.0.0/0	NodeJS
사용자 지정 TCP	TCP	4000	::/0	NodeJS
사용자 지정 TCP	TCP	5601	0.0.0.0/0	KIBANA
사용자 지정 TCP	TCP	5601	::/0	KIBANA
사용자 지정 TCP	TCP	139	0.0.0.0/0	smb
사용자 지정 TCP	TCP	139	::/0	smb
사용자 지정 TCP	TCP	8005	0.0.0.0/0	TOMCAT2
사용자 지정 TCP	TCP	8005	::/0	TOMCAT2
MYSQL/Aurora	TCP	3306	0.0.0.0/0	mariaDB
MYSQL/Aurora	TCP	3306	::/0	mariaDB
사용자 지정 TCP	TCP	3000	0.0.0.0/0	GRAFANA
사용자 지정 TCP	TCP	3000	::/0	GRAFANA
사용자 지정 TCP	TCP	5230	0.0.0.0/0	FCM
사용자 지정 TCP	TCP	5230	::/0	FCM
사용자 지정 TCP	TCP	9200	0.0.0.0/0	ELASTIC
사용자 지정 TCP	TCP	9200	::/0	ELASTIC
사용자 지정 TCP	TCP	5228	0.0.0.0/0	FCM
사용자 지정 TCP	TCP	5228	::/0	FCM
사용자 지정 TCP	TCP	3690	0.0.0.0/0	SVN
사용자 지정 TCP	TCP	3690	::/0	SVN
```

### jar 만들기 생성 :: java
```bash
sudo vi manifest.txt
(Main-Class: MainClass <--- main 함수 있는 클래스)

jar -cvmf manifest.txt [jar파일명] [클래스1] [클래스2] or 
jar -cvmf manifest.txt [jar파일명] *.class

java -jar 파일명.jar
```

---
