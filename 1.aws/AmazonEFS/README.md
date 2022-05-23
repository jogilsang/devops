
## INDEX
- mount
  - [fileSystem](#filesystem)
  - [accessPoint](#accessPoint)
- [unmount](#unmount)
- [tr](#tr)

---

### filesystem
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

---

### accessPoint

---

```
EFS를 사용하는 대부분의 환경은 컨테이너 환경일 것이다. 
결국 1개의 EFS에 대해 마운트하는 대상 컨테이너 n개에 대응하여 
복수개의 액세스 포인트를 생성해야 한다. 대상 컨테이너마다 사용자, 
그룹 ID를 파악하는 것이 중요하다. 이 정보는 아래와 같이 확인 가능하다.
```

### unmount
sudo umount {PATH_TO_MOUNT}   
-l :   
-f :  

---

### tr
- b'mount.nfs4: access denied by server while mounting 127.0.0.1:/'


