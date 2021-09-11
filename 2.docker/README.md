
# 3.docker
## INDEX
### [설치](#설치)

---

### 설치
```
0. putty 한글폰트 설정, (EX : 터미널)

1. Docker 다운받기
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io

2. Mariadb 도커 이미지 다운받기
sudo docker pull mariadb
sudo docker images

3. 컨테이너 실행
sudo docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 --name mariadb mariadb
sudo docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 --name mariadb2 mariadb --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

-d : detached mode : 컨테이너를 백그라운드에서 동작하는 어플리케이션으로 실행
-p 3306:3306 : 외부의 3306요청을 컨테이너의 포트 3306과 연동
--name : 컨테이너의 이름

4. 도커 확인
sudo docker container ls
sudo docker ps

5. 접속, 해당 컨테이너 실행
sudo docker exec -i -t mariadb bash (exit)
mysql -uroot -p1234 (ctrl + c)

6. VI 편집기 설치, 컨피그 수정
apt-get update
apt-get install vim 
vi /etc/mysql/my.cnf 

/etc/mysql/my.cnf 설정파일에서

[client]
default-character-set=utf8

...

[mysql]
default-character-set=utf8

...

[mysqld]
collation-server = utf8_unicode_ci
init-connect='SET NAMES utf8'
character-set-server = utf8

7. 도커 언어수정
apt update
apt install locales
locale
export LANGUAGE=ko_KR.UTF-8
export LANG=ko_KR.UTF-8
dpkg-reconfigure locales
298
3

7. 컨테이너 재시작
sudo docker stop mariadb
sudo docker start mariadb
```