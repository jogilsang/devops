## 1. vpc 
dnsHostname enable
dnsCheck enable

## 2. sg created for efs 
Protocol : NFS
port : 2079
src : EC2-SG

## 3. mount 
```sh
# 마운트할 경로생성
sudo mkdir efs

# 마운트 진행
sudo mount -t efs -o tls fs-08ef8eb0eea9fcab4:/ efs

# 재부팅 방지
sudo vi /etc/fstab
fs-08ef8eb0eea9fcab4:/ /efs efs _netdev,tls 0 0
```
