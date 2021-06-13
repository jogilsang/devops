

## 보안그룹 예시
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
