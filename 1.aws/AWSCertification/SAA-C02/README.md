# SAA-02

## INDEX
#### [Reference](#reference)
#### [Test1](#test1)

### [Word](#word)
#### [Auto-scaling](#auto-scaling)
#### [elastic-load-balancing](#elastic-load-balancing)

### [Reference](#reference)

---

### test1
```
1. Amazon S3에서 실행되는 정적 웹 사이트
- 1.1. Amazon CloudFront를 통해 특정국가의 캐시할 위치를 결정할 수 있음
- 1.2. "Amazon CloudFront 배포를 생성하고 최고의 성능을 위해 모든 엣지 로케이션을 사용하도록 가격 등급을 설정하십시오"
  전 세계의 엣지 로케이션에 컨텐츠를 개재한다면 돈이 많이듬. 
- 1.3.미국, 캐나다 및 유럽에서 오리진을 사용하는 Amazon CloudFront 배포 생성"이 올바르지 않습니다. 
  오리진은 한 곳에 있을 수 있으므로 다른 리전에 오리진을 추가할 필요가 없습니다. 
- 1.4. Lambda@Edge는 데이터를 처리하므로, 정적인 데이터와 맞지않음
2. 이 애플리케이션은 단일 가용 영역에서 Amazon EC2 인스턴스를 사용하고 사용자는 레이어 4를 통해 연결합니다.
3. AWS Ec2 애플리케이션은 고가용성을 필요로 하며 비용 효율성을 위해 수요에 따라 동적으로 확장
   3.1. 여러 가용영역에 인스턴스를 배포하도록 ALB를 Auto Scaling 그룹 앞에 둔다
   3.3. 단일 자동 스케일링 그룹에서 여러 지역의 인스턴스를 실행할 수 없다.
4. Amazon S3 버킷에 매우 중요한 데이터를 업로드 데이터에 계속 액세스할 수 있어야 하며 사용자가 의도적으로 데이터를 삭제할 수 있어야 합니다.
5. Amazon RDS MySQL - 전송 중 암호화 - AWS KMS 키
6. Amazon VPC- API 호출이 인터넷을 통과하지 않도록 해야 합니다.
7. Amazon EC2 및 Amazon RDS MySQL 데이터베이스 인스턴스를 사용
- 루트 EBS 볼륨에 있는 구성 파일
1. 자주 사용되지 않으며 평일 오전과 오후에 사용량이 약간 급증합니다. 디스크 I/O는 최대 3,000IOPS에 도달할 때까지 다양할 수 있습니다.
2. 단일 가용 영역의 Amazon EC2 Auto Scaling 그룹에 있는 6개의 웹 애플리케이션 서버에서 애플리케이션을 실행
솔루션 아키텍트는 고가용성을 구현하기 위해 어떤 아키텍처를 선택해야 합니까?
3. 파트너 회사는 애플리케이션에 데이터를 보낼 때 많은 503 서비스를 사용할 수 없음 오류를 수신했으며 컴퓨팅 용량이 한계에 도달하고 데이터 볼륨이 급증하면 요청을 처리할 수 없습니다.
4. 인스턴스는 Amazon EBS 볼륨으로 지원됩니다. 인스턴스의 메모리 내용을 사용할 수 없을 때 보존해야 한다는 요구 사항
5. 온프레미스에서 애플리케이션 서버를 실행하는 회사에서 스토리지 용량 + 로컬 캐싱을 지원하는 솔루션
6. VPC의 Amazon EC2 인스턴스 간에 파일을 안전하게 복사하는 방법
7. Amazon SQS 배포, 계층간 우선순위 적용(EX : 유료, 무료)
8. Amazon DynamoDB 테이블에 대한 액세스를 VPC의 특정 프라이빗 소스 IP 주소로 제한하려고 합니다. 테이블에 대한 액세스를 보호
9. 웹 애플리케이션은 퍼블릭 서브넷에서 실행되고 데이터베이스는 프라이빗 서브넷에서 실행됩니다. 퍼블릭 서브넷과 프라이빗 서브넷은 모두 단일 가용 영역
10. Amazon SQS - 메세지 전송 최소 권한 액세스
11. Amazon API Gateway API 와 관련된 서비스
12. Amazon S3에 업로드- 가장 안정적이고 시간 효율적인 데이터 전송을 제공
13. 3개의 프라이빗 서브넷에 있는 여러 Amazon EC2 인스턴스에 애플리케이션을 배포
어떻게 public에서 접근하게 할 수 있을지
14. 데이터 보관의 최대성능, 내구성, 아카이브 스토리지
15. Amazon S3 버킷 - 직접 액세스가 불가능, 특정 IP 주소 액세스 허용
16. Amazon EC2 Linux, Amazon EBS 볼륨에 데이터
장애가 발생한 경우 애플리케이션의 복원력을 높일 수 있는 솔루션
17. NAS(Network Attached Storage) 장치 - 오프사이트 백업
18. Docker 컨테이너 - 관리형 솔루션
19. S3 스토리지 클래스 - 로그에 액세스
20. 물리적 백업 테이프를 사용하지 않음으로써 비용을 절감
21. 일괄 처리 작업의 비용을 줄이는 방법
22. 여러 AZ의 인스턴스에서 동시접근 가능 - 스토리지는 NFS 프로토콜
23. AWS RDS - 읽기 전용 복제본 암호화
24. 이번 주에 용량을 두 배
25. 콘텐츠에 대한 배포 권한을 사용하려면 다른 지역의 사용자에게 특정 지역의 콘텐츠를 제공
26. 미국의 온프레미스 서버에서 호스팅되는 동적 웹 사이트를 실행합니다. 이 회사는 유럽으로 확장
27. 매일 로그 파일에 대한 분석 작업을 실행할 계획이며 스토리지 솔루션
로그의 크기와 수는 알 수 없으며 데이터는 24시간 동안만 유지
28. DFSR(분산 파일 시스템 복제) - 파일 서버 팜을 대체하기 위해 어떤 서비스
29. 컴퓨팅 서비스를 분리하는 데 사용할 수 있는 서비스
30. 특정 국가에 대한 접근을 차단 - ACL 차단?
31. 웹 사이트가 다운된 경우 사용자가 자동으로 연결될 지원 연락처 세부 정보가 포함된 백업 웹 사이트
32. Microsoft SQL Server 데이터베이스입니다. 애플리케이션 소유자가 데이터베이스를 Amazon RDS 인스턴스로 마이그레이션
33. AWS S3 - 실수로 문서를 삭제하는 것을 방지하고 모든 버전의 문서를 사용할 수 있도록 해야 합니다.
ENI (Elastic Network Interface) : 탄력적 네트워크 인터페이스
AWS Organization - OU
SCP ???
AWS Fargate
Amazon Elastic Contatiner Service(ECS)
S3 Standard-Infrequent Access (S3 Standard - IA)
S3 One-Zone-Infrequent Access (S3 One Zone - IA)
iscsi 프로토콜
NSF 프로토콜
Amazon Kinesis Firehose
Route 53 지연 기반 라우팅
Amazon S3 지능형 계층화
AWS Transit GateWay
```
### Word
#### [Auto-scaling](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/aws-auto-scaling/)
#### [elastic-load-balancing](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/elastic-load-balancing/)

### reference

[AWSCertifiedSolutionsArchitectUnofficialStudyGuide](https://github.com/serithemage/AWSCertifiedSolutionsArchitectUnofficialStudyGuide)

[AWS Solutions Architect — Associate certificate Study — 공식 문서 정리 Part 1](https://medium.com/@tkdgy0801/aws-solutions-architect-certificate-%EA%B3%B5%EB%B6%80-%EC%98%81%EC%97%AD-1-7abd91cd91a8)

[AWS Solutions Architect — Associate certificate Study — 공식 문서 정리 Part 2](https://medium.com/@tkdgy0801/aws-solutions-architect-associate-certificate-study-%EA%B3%B5%EC%8B%9D-%EB%AC%B8%EC%84%9C-%EC%A0%95%EB%A6%AC-part-2-3775eb75230e)

[AWS Solutions Architect — Associate certificate Study — 공식 문서 정리 Part 3](https://medium.com/@tkdgy0801/aws-solutions-architect-associate-certificate-study-%EA%B3%B5%EC%8B%9D-%EB%AC%B8%EC%84%9C-%EC%A0%95%EB%A6%AC-part-3-b14f3e4005b)

[AWS_Cloud_Best_Practices](https://d1.awsstatic.com/whitepapers/AWS_Cloud_Best_Practices.pdf)

[AWS_well-architected](https://aws.amazon.com/ko/architecture/well-architected/?wa-lens-whitepapers.sort-by=item.additionalFields.sortDate&wa-lens-whitepapers.sort-order=desc)