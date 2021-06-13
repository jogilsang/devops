# 1.aws / 2.EC2 / 1.CLI / README.md


---

## [인스턴스 메타데이터 검색](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html)
```
curl http://169.254.169.254/latest/meta-data/local-ipv4;echo
```

#### 로컬IP - PING
ping `curl http://169.254.169.254/latest/meta-data/local-ipv4`

---
