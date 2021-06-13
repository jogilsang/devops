# 1.aws / 2.EC2 / 1.CLI / README.md


---

## [인스턴스 메타데이터 검색](https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html)
```
curl http://169.254.169.254/latest/meta-data/local-ipv4;echo
```

#### 로컬IP - PING
ping `curl http://169.254.169.254/latest/meta-data/local-ipv4`

#### AccountID 
`curl http://169.254.169.254/latest/meta-data/identity-credentials/ec2/info;echo`
```JSON
{
  "Code" : "Success",
  "LastUpdated" : "2021-06-13T04:18:50Z",
  "AccountId" : "932351445346"
}
```
`curl http://169.254.169.254/latest/meta-data/identity-credentials/ec2/security-credentials;echo`
```
ec2-instance
```
---
