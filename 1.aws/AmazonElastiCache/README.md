
## redis-cli
`설치`   
```bash
### AWS AMI
### make 하기 위핸 gcc 다운
sudo yum install -y gcc

### redis-cli 설치 및 make
wget http://download.redis.io/redis-stable.tar.gz && tar xvzf redis-stable.tar.gz && cd redis-stable && make

### redis-cli를 bin에 추가해 어느 위치서든 사용 가능하게 등록
sudo cp src/redis-cli /usr/bin/
```

`접속`   
```bash
redis-cli -h 000.000.000.000 -p 6379
```