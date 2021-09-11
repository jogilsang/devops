
# 8.GRAFANA, PROMETHEUS

## INDEX
### - Learn to live Terminal
- ### [설치](#설치)
  - #### [window](#window)
  - #### [ubuntu 18.04](#ubuntu%2018.04)
  
---

## 설치
### window
### ubuntu 18.04
```
-- 1. 설치과정
sudo apt-get update
sudo apt-get upgrade
apt-get install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install grafana
sudo apt-get install -y apt-transport-https
sudo ls /usr/lib/systemd/system/grafana-server.service
cat /usr/lib/systemd/system/grafana-server.service
sudo systemctl start grafana-server
sudo systemctl status grafana-server
localhost:3000
// id : admin, password : admin

-- 2. 파일위치
설치위치 : /usr/sbin/grafana-server ( init 파일 : /etc/init.d/grafana-server )
설정파일 : /etc/grafana/grafana.ini
로그위치 : /var/log/grafana/grafana.log
환경파일 : /etc/sysconfig/grafana-server

-- Reference
source of link : 
https://devconnected.com/how-to-install-grafana-on-ubuntu-18-04/
https://has3ong.tistory.com/626
```