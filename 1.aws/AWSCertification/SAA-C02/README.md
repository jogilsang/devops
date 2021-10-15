# SAA-02

## INDEX
### [Test](#test)
- #### [Test1](#test1)
- #### [Test2](#test2)
- #### [Test3](#test3)
- #### [Test4](#test4)
- #### [Test5](#test5)
- #### [Test6](#test6)
### [Word](#word)
- #### [Auto-scaling](#auto-scaling)
- #### [elastic-load-balancing](#elastic-load-balancing)
### [Cheat](#cheat)
- #### AWS 네트워킹 및 콘텐츠 전송
- #### AWS 컴퓨팅
- #### AWS 스토리지
- #### AWS 데이터베이스
- #### AWS 보안,자격증명 및 규정준수
- #### AWS 분석
- #### AWS 애플리케이션 통합
- #### AWS 마이그레이션 및 이전
- #### AWS 관리 및 거버넌스
### [Reference](#reference)

---

## test1
```javascript
1. Amazon S3에서 실행되는 정적 웹 사이트
  -> Amazon CloudFront를 통해 특정국가의 캐시할 위치를 결정할 수 있음
  -> Amazon CloudFront 배포를 생성하고 최고의 성능을 위해 모든 엣지 로케이션을 사용하도록 
     가격등급을 설정한다면, 전 세계의 엣지 로케이션에 컨텐츠를 개재한다면 돈이 많이듬. 
  -> 미국, 캐나다 및 유럽에서 오리진을 사용하는 Amazon CloudFront 배포 생성이 올바르지 않습니다. 
     오리진은 한 곳에 있을 수 있으므로 다른 리전에 오리진을 추가할 필요가 없습니다. 
  -> Lambda@Edge는 데이터를 처리하므로, 정적인 데이터와 맞지않음
2. 이 애플리케이션은 단일 가용 영역에서 Amazon EC2 인스턴스를 사용하고 사용자는 레이어 4를 통해 연결합니다.
  -> 트래픽을 인스턴스에 분배하기 위해서는 Ec2 인스턴스 앞에 L4 Network Load Balancer를 사용해야한다.
     (L7 ALB (X))
3. AWS Ec2 애플리케이션은 고가용성을 필요로 하며 비용 효율성을 위해 수요에 따라 동적으로 확장
  -> 여러 가용영역에 인스턴스를 배포하도록 ALB를 Auto Scaling 그룹 앞에 둔다
  -> 단일 자동 스케일링 그룹에서 여러 지역의 인스턴스를 실행할 수 없다.
4. Amazon S3 버킷에 매우 중요한 데이터를 업로드 데이터에 계속 액세스할 수 있어야 하며 사용자가 의도적으로 데이터를 삭제할 수 있어야 합니다.
  -> S3 버킷에 대한 수명주기정책은 삭제방지가 아닌 데이터 이동에 대한 내용이다.
  -> MFA 삭제는 버전관리가 활성화된 버킷에서 사용가능하며, 버킷정책과는 무관하다.
5. Amazon RDS MySQL - 전송 중 SSL/TLS암호화 - AWS KMS 키
  -> AmazonRDS가 SSL 인증서를 생성하고 DB인스턴스가 시작될 떄, 인증서를 설치한다.
  -> AWS에서 제공하는 루트인증서를 다운로드합니다. RDS DB인스턴스에 연결할 떄 인증서를 사용합니다
  -> 모든 리전에서 작동하는 루트 인증서를 AWS에서 다운로드하거나 리전별 중간 인증서를 다운로드할 수 있다.
  -> 자체서명된 인증서는 RDS와 함께 사용할수없고, RDS관리콘솔을 사용하여 암호화의 활성화/비활성화 불가능
6. Amazon VPC의 Ec2인스턴와 Amazon DynamoDB 간에 API 호출이 인터넷을 통과하지 않도록 해야 합니다.
  -> DynamoDB GateWay Endpoint를 만든다. 액세스 허용정책 설정 후 라우팅 테이블을 생성한다.
  -> 기존DB에 Endpoint를 생성할 수 있으므로, DB를 새로 만들 필요가없다. VPC 피어링은 VPC간에만 가능하다
7. 개발자는 EC2 애플리케이션 인스턴스의 루트 EBS 볼륨에 있는 구성 파일에 데이터베이스 사용자 이름과 암호를 저장
  -> DB접근에 대한 IAM Role을 Ec2인스턴스에 부여하여, 자격증명을 완전히 제거하는것이 가장안전
8. 자주 사용되지 않으며 평일 오전과 오후에 사용량이 약간 급증합니다. 디스크 I/O는 최대 3,000IOPS에 도달할 때까지 다양할 수 있습니다.
  -> Amazon EBS 범용 SSD(gp2)
9. 단일 가용 영역의 Amazon EC2 Auto Scaling 그룹에 있는 6개의 웹 애플리케이션 서버에서 애플리케이션을 실행
솔루션 아키텍트는 고가용성을 구현하기 위해 어떤 아키텍처를 선택해야 합니까?
    -> HA를 위해서는 여러 가용영역에 인스턴스를 분할해야한다. 인스턴스를 여러AZ에서 실행하면 AZ수준의 내결함성도 생긴다. 
    -> CloudFront는 고가용성보다는 미디어 콘텐츠에 대한 액세스 가속화이다. 고가용성을 위해선 다중리전보다는 다중AZ이다.
10. 파트너 회사는 애플리케이션에 데이터를 보낼 때 많은 503 서비스를 사용할 수 없음 오류를 수신했으며 컴퓨팅 용량이 한계에 도달하고 데이터 볼륨이 급증하면 요청을 처리할 수 없습니다.
    -> "Amazon Kinesis Data Streams를 사용하여 데이터를 수집하십시오. AWS Lambda 함수를 사용하여 데이터를 처리하십시오"
    -> EC2인스턴스를 Lambda로 바꾸고, Lambda는 여러 실행을 병렬로 실행하여 원활하게 확장할 수 있습니다. 
11. 인스턴스 최대절전모드(인스턴스의 메모리 내용을 사용할 수 없을 때 보존해야 한다는 요구 사항)
    -> 인스턴스 메모리(RAM)을 Amazon EBS 루트볼륨에 저장. 인스턴스 재시작 시, 이전상태로 복원. 
       실행됬었떤 프로세스가 재개되고 인스턴스ID유지된다
12. 온프레미스에서 애플리케이션 서버를 실행하는 회사에서 스토리지 용량 + 로컬 캐싱을 지원하는 솔루션
    -> AWS Storage Gateway 볼륨 게이트웨이는 블록프로토콜(iSCSI)를 통해 마운트되므로 블록 기반 스토리지 시스템을 교체하는 데 사용해야한다.
    -> AWS Storage Gateway 파일 게이트웨이는 파일프로토콜(NFS)를 사용하기때문에, NFS 파일 시스템을 교체하는 데 사용해야 합니다. ("NFS는 객체 기반 스토리지시스템이고, HTTP REST API를 사용한다.")
    -> Amazon ElasticFileSystem(EFS) 은 NFS를 사용하므로, NFS 파일 시스템을 교체하는 데 사용해야 합니다.
13. VPC의 Amazon EC2 인스턴스 간에 파일을 안전하게 복사하는 방법
    -> VPC 피어링을 연결한다.
    -> VPC 피어링은 서로 다른 region과 account의 VPC간 트래픽을 마치 동일한 네트워크환경에서 라우팅할 수 있도록 연결하는 것
    -> EC2 인스턴스에 VPC GateWay EndPoint를 생성할수없다. DynamoDB 및 S3에서만 사용가능하다
    -> VPC 간에는 AWS Managed VPN 연결을 생성할수없으므로, 가상 프라이빗 게이트웨이를 사용할 수 없다
    -> Direct Connect GateWay는 여러 VPC를 연결하는데 사용할 수 있다
14. Amazon SQS 배포, 계층간 우선순위 적용(EX : 유료, 무료)
15. Amazon DynamoDB 테이블에 대한 액세스를 VPC의 특정 프라이빗 소스 IP 주소로 제한하려고 합니다. 테이블에 대한 액세스를 보호
    -> 게이트웨이 VPN 엔드포인트를 생성하고 라우팅 테이블에 항목을 추가한다.
    -> "VPC 엔드포인트에는 인터페이스 엔드포인트와 게이트웨이 엔드포인트의 두 가지 유형이 있습니다. 인터페이스 엔드포인트를 사용하면 VPC에서 ENI를 사용합니다. 게이트웨이 엔드포인트를 사용하여 엔드포인트를 가리키도록 라우팅 테이블을 구성합니다."
16. 웹 애플리케이션은 퍼블릭 서브넷에서 실행되고 데이터베이스는 프라이빗 서브넷에서 실행됩니다. 퍼블릭 서브넷과 프라이빗 서브넷은 모두 단일 가용 영역
    -> "VPC 간에 로드 밸런싱할 수 없음"
    -> "다른 AZ에 새 퍼블릭 및 프라이빛 서브넷을 생성합니다. 데이터베이스를 Amazon RDS 다중 AZ배포로 마이그레이션합니다"
    -> "여러 AZ에 걸쳐 있는 EC2 Auto Scaling 그룹 및 Application Load Balancer을 생성합니다"
17. Amazon SQS - 메세지 전송 최소 권한 액세스
18. Amazon API Gateway API 와 관련된 서비스. 향후 증가 알수없으며, 요청범위가 많음
    -> AWS Lambda(서버리스, 쉽게확장), AWS DynamoDB(서버리스, 쉽게확장)
    -> "AWS RDS는 Key-value에 부적합. AWS Fargate와 Ec2는 요청이없어도 비용발생"
19. Amazon S3에 업로드- 가장 안정적이고 시간 효율적인 데이터 전송을 제공
20. 3개의 프라이빗 서브넷에 있는 여러 Amazon EC2 인스턴스에 애플리케이션을 배포
어떻게 public에서 접근하게 할 수 있을지
    -> "Application Load Balancer를 생성하고 프라이빗 인스턴스와 동일한 가용 영역에서 3개의 퍼블릭 서브넷을 연결하십시오. 프라이빗 인스턴스를 ALB에 추가하십시오가 정답입니다."
    -> "NAT 게이트웨이는 인바운드 트래픽이 아닌 아웃바운드 트래픽에 사용되며 인터넷 기반 클라이언트에서 애플리케이션을 사용할 수 있도록 할 수 없습니다"
21. 데이터 보관의 최대성능, 내구성, 아카이브 스토리지
    -> 최대성능을 위한 AWS EC2 인스턴스 스토어, 내구성 있는 보관을 위한 AWS S3, 아카이브 스토리지를 위한 Amazon S3 Glacier
    -> "비디오 처리를 위해 인스턴스 스토어 볼륨을 사용하면 최상의 I/O 성능을 얻을 수 있습니다. 이는 소스 파일에서 데이터를 다시 생성할 수 있는 사용 사례에 사용하기에 안전하므로 좋은 사용 사례입니다."
    -> "EBS는 인스턴스 스토어 볼륨만큼 많은 I/O 성능을 제공하지 않으므로 이 사용 사례에 가장 적합한 선택이 아닙니다."
22. Amazon S3 버킷 - 직접 액세스가 불가능, 특정 IP 주소 액세스 허용
    -> "정답 : 사용자가 서명된 URL을 사용하여 파일에 액세스하고, 오리진 액세스 ID(OAI)를 생성하고, Amazon S3 버킷의 파일에 대한 액세스를 OAI로 제한하도록 CloudFront를 구성"
    -> "사용자는 OAI로 로그인할 수 없습니다."
    -> "CloudFront를 사용하여 EBS 볼륨에서 직접 데이터를 가져올 수 없습니다."
    -> " S3 버킷이 웹 사이트 엔드포인트로 구성된 경우 CloudFront 및 OAI를 사용할 수 없습니다."
23. 보안구성으로 배포되었는지 확인
    -> "Amazon Inspector는 보안평가서비스. 배포를 보호하는데 사용될수없음"
23. Amazon EC2 Linux, Amazon EBS 볼륨에 데이터
장애가 발생한 경우 애플리케이션의 복원력을 높일 수 있는 솔루션
25. NAS(Network Attached Storage) 장치 - 오프사이트 백업
    -> "AWS Storage Gateway 하드웨어 어플라이언스는 온프레미스 배포를 위한 검증된 물리적 독립형 서버 구성입니다. "
    -> "파일 게이트웨이는 NFS 및 SMB 프로토콜을 통한 마운트에 적합하므로 이 사용 사례에 사용할 올바른 유형의 어플라이언스입니다."
    -> "데이터 사본을 AWS에 자동으로 동기화하는 Storage Gateway를 사용하는 것이 좋습니다."
25. Docker 컨테이너 - 관리형 솔루션
26. 회사는 특정 Amazon EC2 인스턴스 유형만 시작하는 기능을 제한해야 합니다. 최소한의 노력으로 이 정책을 계정 전체에 적용하려면 어떻게 해야 합니까?
    -> "여러 멤버 계정에 제한을 적용하려면 AWS Organization에서 서비스 제어 정책(SCP)을 사용해야 합니다. 이를 수행하는 방법은 허용하려는 특정 인스턴스 유형과 동일하지 않은 모든 항목에 적용되는 거부 규칙을 만드는 것입니다."
    -> SCP(Service Control Policy)
    -> "IAM을 사용하면 정책을 중앙에서 적용하지 않고 각 계정 내에서 적용해야 하므로 훨씬 더 많은 노력이 필요합니다."
    -> "AWS Resource Access Manager(RAM)는 AWS 계정이나 AWS 조직 내에서 AWS 리소스를 쉽고 안전하게 공유할 수 있는 서비스입니다. 액세스 또는 권한을 제한하는 데 사용되지 않습니다."
28.  Amazon S3로 일부 애플리케이션 로그 파일을 백업해야 합니다. 얼마나 자주 로그에 액세스할지 또는 어떤 로그에 가장 많이 액세스할지 알 수 없습니다.
    -> "S3 Intelligent-Tiering 스토리지 클래스는 성능 영향이나 운영 오버헤드 없이 데이터를 가장 비용 효율적인 액세스 계층으로 자동 이동하여 비용을 최적화하도록 설계되었습니다."
    -> "두 개의 액세스 계층에 개체를 저장하여 작동합니다. 하나는 빈번한 액세스에 최적화된 계층이고 다른 하나는 자주 액세스하지 않는 데 최적화된 저비용 계층입니다. 로그 파일에 대한 액세스 패턴을 알 수 없기 때문에 이는 지능형 계층화에 대한 이상적인 사용 사례입니다."
29. 물리적 백업 테이프를 사용하지 않음으로써 비용을 절감
    -> "NFS 프로토콜은 AWS Storage Gateway 파일 게이트웨이에서 사용되지만 기존 백업 인프라를 교체하는 데 적합한 가상 테이프 기능을 제공하지 않습니다."
    -> "iSCSI 프로토콜은 AWS Storage Gateway 볼륨 게이트웨이에서 사용되지만 기존 백업 인프라를 교체하는 데 적합한 가상 테이프 기능을 제공하지 않습니다."
    -> "iSCSI 가상 테이프 라이브러리(VTL)를 사용하여 백업 애플리케이션을 AWS Storage Gateway에 연결이 정답입니다."
30. 일괄 처리 작업의 비용을 줄이는 방법
    -> "예약 인스턴스는 1년 또는 3년 동안 실행되는 지속적으로 실행되는 워크로드에 적합합니다."
    -> "스팟 블록은 5일 동안 분기에 한 번만 실행되므로 이 작업에 가장 적합한 솔루션이므로 예약 인스턴스는 유용하지 않습니다. 스팟 블록의 최대 지속 시간은 6시간입니다."
29. 여러 AZ의 인스턴스에서 동시접근 가능 - 스토리지는 NFS 프로토콜
30. AWS RDS - 읽기 전용 복제본 암호화
31. 이번 주에 용량을 두 배
32. 콘텐츠에 대한 배포 권한을 사용하려면 다른 지역의 사용자에게 특정 지역의 콘텐츠를 제공
33. 미국의 온프레미스 서버에서 호스팅되는 동적 웹 사이트를 실행합니다. 이 회사는 유럽으로 확장
34. 매일 로그 파일에 대한 분석 작업을 실행할 계획이며 스토리지 솔루션
로그의 크기와 수는 알 수 없으며 데이터는 24시간 동안만 유지
35. DFSR(분산 파일 시스템 복제) - 파일 서버 팜을 대체하기 위해 어떤 서비스
36. 컴퓨팅 서비스를 분리하는 데 사용할 수 있는 서비스
37. 특정 국가에 대한 접근을 차단 - ACL 차단?
38. 웹 사이트가 다운된 경우 사용자가 자동으로 연결될 지원 연락처 세부 정보가 포함된 백업 웹 사이트
39. Microsoft SQL Server 데이터베이스입니다. 애플리케이션 소유자가 데이터베이스를 Amazon RDS 인스턴스로 마이그레이션
40. AWS S3 - 실수로 문서를 삭제하는 것을 방지하고 모든 버전의 문서를 사용할 수 있도록 해야 합니다.

/**
 * ENI (Elastic Network Interface) : 탄력적 네트워크 인터페이스
 * AWS Organization - OU
 * SCP ???
 * AWS Fargate
 * Amazon Elastic Contatiner Service(ECS)
 * S3 Standard-Infrequent Access (S3 Standard - IA)
 * S3 One-Zone-Infrequent Access (S3 One Zone - IA)
 * iscsi 프로토콜
 * NSF 프로토콜
 * Amazon Kinesis Firehose
 * Route 53 지연 기반 라우팅
 * Amazon S3 지능형 계층화
 * AWS Transit GateWayG5
 * 

```
## Word
### public
### [public-load-balancer-private-ec2](https://aws.amazon.com/premiumsupport/knowledge-center/public-load-balancer-private-ec2/)

## cheat
### AWS 네트워킹 및 콘텐츠 전송
### AWS 컴퓨팅
### AWS 스토리지
### AWS 데이터베이스
### AWS 보안,자격증명 및 규정준수
### AWS 분석
### AWS 애플리케이션 통합
### AWS 마이그레이션 및 이전
### AWS 관리 및 거버넌스

#### [amazon-vpc](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/networking-and-content-delivery/amazon-vpc/)
```
amazon-vpc
- 가상 네트워크
- AWS 리소스 격리된 섹션을 프로비저닝
- VPC는 AWS의 다른 VPC와 논리적으로 격리됩니다.
기본 VPC는 ​​각 AZ에 서브넷이 있는 각 지역에 생성됩니다.
기본적으로 리전당 최대 5개의 VPC를 생성할 수 있습니다.
기본 VPC에는 모든 퍼블릭 서브넷이 있습니다.
- 서브넷 라우팅 테이블에는 연결된 인터넷 게이트웨이가 있습니다.
- "공용 IPv4 주소 자동 할당"이 "예"로 설정되었습니다.

가상 프라이빗 게이트웨이:  VPN 연결의 Amazon VPC 측.
인터넷 게이트웨이:  공용 인터넷 연결의 Amazon VPC 측입니다.
서브넷:  격리된 리소스 그룹을 배치할 수 있는 VPC IP 주소 범위의 세그먼트입니다(AZ에 매핑, 1:1).
피어링 연결:  피어링 연결을 사용하면 피어링된 두 VPC 간에 프라이빗 IP 주소를 통해 트래픽을 라우팅할 수 있습니다.


---------------
VPC 라우터는 서로 다른 AZ를 함께 연결하고 VPC를 인터넷 게이트웨이에 연결합니다.
VPC 라우터는 리전 내의 AZ 간에 라우팅을 수행합니다.
각 서브넷에는 라우터가 VPC 내에서 트래픽을 전달하는 데 사용하는 라우팅 테이블이 있습니다.
각 서브넷은 하나의 라우팅 테이블에만 연결할 수 있습니다.
하나의 라우팅 테이블을 여러 서브넷에 할당할 수 있습니다.
모든 VPC 서브넷이 서로 통신하도록 허용하는 기본 규칙이 있습니다. 이 규칙은 삭제하거나 수정할 수 없습니다.
서브넷 간의 라우팅은 이 규칙 때문에 항상 가능합니다. 통신 문제는 보안 그룹 또는 NACL일 가능성이 더 큽니다.
---------------

서브넷 유형:

서브넷의 트래픽이 인터넷 게이트웨이로 라우팅되는 경우 서브넷을  퍼블릭 서브넷이라고 합니다.
서브넷에 인터넷 게이트웨이에 대한 경로가 없으면 서브넷을  프라이빗 서브넷이라고 합니다.
서브넷에 인터넷 게이트웨이에 대한 경로가 없지만 VPN 연결을 위해 트래픽이 가상 프라이빗 게이트웨이로 라우팅되는  경우 서브넷을 VPN 전용 서브넷이라고 합니다.

VPC가 생성되면 CIDR 블록을 변경할 수 없습니다.
기존 CIDR 블록과 겹치는 추가 CIDR 블록을 생성할 수 없습니다.
다른 RFC 1918 범위에서 추가 CIDR 블록을 생성할 수 없습니다.
IP 주소 범위가 겹치는 서브넷을 만들 수 없습니다.
서브넷의 처음 4개와 마지막 1개의 IP 주소는 예약되어 있습니다.

각 서브넷은 완전히 하나의 가용 영역 내에 있어야 하며 여러 영역에 걸쳐 있을 수 없습니다.

---------------
IGW(인터넷 게이트웨이)는 두 가지 용도로 사용됩니다. .
- 인터넷 라우팅 가능한 트래픽에 대해 VPC 라우팅 테이블에 대상을 제공합니다.
- 퍼블릭 IPv4 주소가 할당된 인스턴스에 대해 개인 IPv4 주소와 공용 IPv4 주소 간에 NAT(네트워크 주소 변환)를 수행합니다.

IGW를 가리키도록 서브넷 라우팅 테이블을 업데이트해야 합니다.
- 모든 대상으로(예: IPv4의 경우 0.0.0.0/0 또는 IPv6의 경우 ::/0).
- 특정 퍼블릭 IPv4 주소(예: AWS 외부에 있는 회사의 퍼블릭 엔드포인트).

VPC 서브넷의 인스턴스에 대해 인터넷 액세스를 활성화하려면 다음을 수행해야 합니다.

인터넷 게이트웨이를 VPC에 연결합니다.
서브넷의 라우팅 테이블이 인터넷 게이트웨이를 가리키는지 확인하십시오(아래 참조).
서브넷의 인스턴스에 전역적으로 고유한 IP 주소(퍼블릭 IPv4 주소, 탄력적 IP 주소 또는 IPv6 주소)가 있는지 확인합니다.
네트워크 액세스 제어 및 보안 그룹 규칙이 관련 트래픽이 인스턴스로 들어오고 나가는 것을 허용하는지 확인하십시오.

---------------
단일 퍼블릭 서브넷이 있는 VPC:
퍼블릭 및 프라이빗 서브넷이 있는 VPC:
퍼블릭 및 프라이빗 서브넷과 하드웨어 VPN 액세스가 있는 VPC:
프라이빗 서브넷만 있고 하드웨어 VPN 액세스가 가능한 VPC:

----------------
NAT 인스턴스에 대한 보안 그룹은 프라이빗 서브넷에서 HTTP/HTTPS 인바운드 및 0.0.0.0/0으로 아웃바운드를 허용해야 합니다.
여러 서브넷에서 여러 NAT를 사용하여 확장할 수 있습니다.
배스천(점프) 호스트로 사용할 수 있습니다.
NAT 인스턴스는 인터넷 게이트웨이에 대한 경로가 있는 퍼블릭 서브넷에 있어야 합니다.
NAT 게이트웨이를 사용하여 VPC 피어링, VPN 또는 Direct Connect에 액세스할 수 없으므로 라우팅 테이블에 특정 경로를 포함해야 합니다.
보안 그룹과 연결되어 있지 않습니다.
라우팅 테이블을 업데이트하고 게이트웨이를 가리키는 것을 잊지 마십시오.

----------------

보안 그룹 끝에 암시적 거부 규칙이 있습니다.
모든 규칙은 허가가 발생할 때까지 평가되거나 암시적 거부가 될 때까지 계속됩니다.

----------------
보안그룹은 인스턴스 레벨에서 실행
기본적으로 사용자 지정 보안 그룹에는 인바운드 허용 규칙이 없습니다(모든 인바운드 트래픽은 기본적으로 거부됨).
기본적으로 기본 보안 그룹에는 인바운드 허용 규칙(그룹 내에서 오는 트래픽 허용)이 있습니다.
모든 아웃바운드 트래픽은 기본적으로 사용자 지정 및 기본 보안 그룹에서 허용됩니다.

----------------
서브넷 수준에서 네트워크 ACL의 기능.
VPC 라우터는 네트워크 ACL 기능을 호스팅합니다.
NACL은 서브넷 내 트래픽이 아닌 서브넷으로 수신 또는 송신되는 트래픽에만 적용됩니다.
VPC는 모든 인바운드/아웃바운드 트래픽을 허용하는 기본 네트워크 ACL과 함께 자동으로 제공됩니다.
네트워크 ACL은 동일한 서브넷에 있는 인스턴스 간의 트래픽을 필터링하지 않습니다.
NACL은 특정 IP 또는 범위를 차단하는 데 선호되는 옵션입니다.
보안 그룹은 특정 범위의 IP를 차단하는 데 사용할 수 없습니다.
NACL은 첫 번째 방어선이고 보안 그룹은 두 번째 방어선입니다.

-----------------
VPN은 클라이언트 쪽 VPN GateWay랑 AWS 쪽 VGW(가상 프라이빗 게이트웨이)가 필요


AWS Direct Connect를 사용하면 온프레미스 네트워크에서 Amazon VPC로의 전용 연결을 쉽게 설정할 수 있습니다.
업계 표준 VLAN을 사용하여 프라이빗 IP 주소를 사용하여 Amazon VPC 내에서 실행되는 Amazon Elastic Compute Cloud(Amazon EC2) 인스턴스에 액세스합니다.

-----------------
VPC 피어링
두 VPC의 인스턴스는 마치 동일한 네트워크 내에 있는 것처럼 서로 통신할 수 있습니다.
VPC는 다른 리전에 있을 수 있습니다(리전 간 VPC 피어링 연결이라고도 함).
한 번에 두 VPC 간에 피어링 연결을 하나만 가질 수 있습니다.
다른 계정과 피어링할 수 있습니다(지역 내 또는 지역 간).

-------------------

모든 트래픽이 모니터링되는 것은 아닙니다. 예를 들어 다음 트래픽은 제외됩니다.

Route53으로 가는 트래픽.
Windows 라이선스 활성화를 위해 생성된 트래픽입니다.
169.254.169.254(인스턴스 메타데이터)를 오가는 트래픽.
Amazon Time Sync Service에 대해 169.254.169.123을 오가는 트래픽.
DHCP 트래픽.
기본 VPC 라우터에 대해 예약된 IP 주소에 대한 트래픽입니다.
```
#### [aws-auto-scaling](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/aws-auto-scaling/)
```
WHAT : 인스턴스에 대한 수평적 확장
WHY : 애플리케이션의 로드를 처리하는 데 사용할 수 있는 적절한 Amazon EC2 가용 인스턴스의 수를 확보한다
HOW : 
- Auto Scaling은 동일한 AWS 리전 내의 여러 AZ에 걸쳐 있을 수 있습니다.
- Auto Scaling은 ELB, CloudWatch 및 CloudTrail과 함께 작동합니다.
- EC2 인스턴스 태그 및 인스턴스 시작 후에 생성된 추가 블록 스토어 볼륨은 고려되지 않습니다.

ASG(Auto Scaling Groups)
- 편집가능
다음 조건이 충족되는 경우 실행 중인 인스턴스를 ASG에 추가할 수 있습니다.
1. 인스턴스가 실행 중 상태입니다.
2. 인스턴스를 시작하는 데 사용된 AMI가 여전히 존재합니다.
3. 인스턴스가 다른 ASG의 일부가 아닙니다.
4. 인스턴스는 ASG에 대해 동일한 AZ에 있습니다.

- 병합가능
1. 여러 단일 AZ Auto Scaling 그룹을 단일 다중 AZ ASG로 병합할 수 있습니다.
2. 병합은 CLI를 통해서만 수행할 수 있습니다.
3. 프로세스는 다른 ASG에 대해 다른 AZ를 커버/스팬하도록 그룹 중 하나의 영역을 조정하는 것입니다.
   그런 다음 다른 ASG를 삭제합니다.
5. 결과 ASG는 기존 ASG 중 하나여야 합니다.

스케일링에는 네 가지 크기 조정 옵션이 있습니다.
1. 유지 – 특정 또는 최소 인스턴스 수를 실행 상태로 유지합니다.
    EX : Scaling 정책이 최소 인스턴스 1개, 원하는 용량 2개, 최대 4개 인스턴스로 설정
2. 수동 – 최대, 최소 또는 특정 수의 인스턴스를 사용합니다.
3. 예약됨 – 일정에 따라 인스턴스 수를 늘리거나 줄입니다.
4. 동적 – 실시간 시스템 지표(예: CloudWatch 지표)를 기반으로 확장합니다.

그 외
- Amazon Simple Queue Service(SQS) 대기열을 기반으로 확장할 수도 있습니다.
- 인스턴스는 ELB에 의해 서비스에서 제거되지만 Auto Scaling에 의해 종료되지는 않습니다.

CLI 
// command can be issued to set the instance’s status to unhealthy, 
aws autoscaling set–instance-health –instance-id i-123abc45d –health-status Unhealthy


-----------------------------------
```
#### [elastic-load-balancing](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/elastic-load-balancing/)
```
WHAT : 수신된 애플리케이션 트래픽을 자동으로 분산합니다.
WHY : 
    1. 단일 리소스에 과부하가 걸릴 위험을 최소화합니다.
    2. 정상적인 대상만 트래픽을 수신하도록 하여 애플리케이션에 내결함성을 제공합니다.
HOW : 
AWS에는 세 가지 유형의 Elastic Load Balancer(ELB)가 있습니다.
    1. CLB(Classic Load Balancer) – 세 가지 중 가장 오래된 것으로 레이어 4와 레이어 7 모두에서 기본 로드 밸런싱을 제공합니다.
    - tcp,ssl, http,https
    2. ALB(Application Load Balancer) – 요청 내용을 기반으로 연결을 라우팅하는 계층 7 로드 밸런서입니다.
    - http,https
    - lambda function as a target
    3. NLB(Network Load Balancer) – IP 프로토콜 데이터를 기반으로 연결을 라우팅하는 레이어 4 로드 밸런서입니다.
    - tcp

1. ALB
Application Load Balancer는 요청 수준(계층 7)에서 작동하여 요청 내용을 기반으로 EC2 인스턴스, 컨테이너 및 IP 주소와 같은 대상으로 트래픽을 라우팅합니다.
HTTP/HTTPS 애플리케이션의 부하를 분산하고 X-Forwarded-For 헤더와 같은 계층 7 관련 기능을 사용할 수 있습니다.
사전 정의된 보안 정책에 대해 AWS IAM 및 AWS Certificate Manager를 통한 SSL 인증서 관리를 지원합니다.
최소 2개의 가용 영역이 필요하며 여러 가용 영역의 대상 간에 수신 트래픽을 분산할 수 있습니다.
콘텐츠 기반 라우팅을 사용하면 요청 콘텐츠를 기반으로 서비스에 요청을 라우팅할 수 있습니다.

호스트 기반 라우팅 – HTTP 헤더의 호스트 필드를 기반으로 클라이언트 요청을 라우팅하여 동일한 로드 밸런서에서 여러 도메인으로 라우팅할 수 있습니다.
경로 기반 라우팅 - HTTP 헤더의 URL 경로(예: /images 또는 /orders)를 기반으로 클라이언트 요청을 라우팅합니다.
라운드 로빈 로드 밸런싱 알고리즘을 사용합니다.
ALB는 백엔드 서버 인증을 지원하지 않습니다(CLB는 지원함).
ALB는 EC2-Classic을 지원하지 않습니다(CLB는 지원).
CloudTrail을 사용하여 API 호출을 캡처할 수 있습니다. S3 스토리지 요금만 지불하세요
ALB는 여러 대상 그룹으로 라우팅할 수 있습니다.
다른 포트(마이크로 서비스에 대한 요청 라우팅에 사용)를 사용하여 동일한 대상 그룹에 동일한 EC2 인스턴스 또는 IP 주소를 여러 번 등록할 수 있습니다.
대상 그룹(EC2, ECS, IP) 내에서 서로 다른 유형을 혼합할 수 없습니다.
EC2 인스턴스는 여러 포트를 사용하여 동일한 대상 그룹에 여러 번 등록할 수 있습니다.
IP 주소는 다음을 등록하는 데 사용할 수 있습니다.
피어링된 VPC의 인스턴스.
IP 주소 및 포트로 주소를 지정할 수 있는 AWS 리소스입니다.
Direct Connect 또는 VPN 연결을 통해 AWS에 연결된 온프레미스 리소스.

2. ELB
ELB는 단일 가용 영역 또는 여러 가용 영역의 Amazon EC2 인스턴스에 수신 트래픽을 분산할 수 있습니다.
각 ELB에 대해 AZ당 서브넷 1개만 활성화할 수 있습니다.
Route 53은 각 지역에 구성된 ELB 인스턴스로 지역 로드 밸런싱에 사용할 수 있습니다.
ELB는 트래픽을 eth0(기본 IP 주소)으로 전달합니다.
ELB를 삭제해도 ELB에 대해 등록된 인스턴스에는 영향을 미치지 않습니다(삭제되지 않으며 더 이상 요청을 받지 않을 뿐입니다).
ALB의 경우 최소 2개의 서브넷을 지정해야 합니다.
NLB의 경우 하나의 서브넷만 지정해야 합니다(최소 2개 추가 권장).
ELB는 클라이언트 인증서 인증을 지원하지 않습니다(API Gateway는 이를 지원함).


ELB는 CloudFront와 마찬가지로 유효한 TCP 요청만 지원하므로 UDP 및 SYN 플러드와 같은 DDoS 공격은 EC2 인스턴스에 도달할 수 없습니다.

CloudWatch – 1분마다.
ELB 서비스는 요청이 활성화된 경우에만 정보를 보냅니다.
SNS 알림을 트리거하는 데 사용할 수 있습니다.
액세스 로그.
기본적으로 비활성화되어 있습니다.
클라이언트에 대한 정보를 포함합니다(CloudWatch 지표에 포함되지 않음).
요청자, IP, 요청 유형 등을 식별할 수 있습니다.
선택적으로 S3에 저장하고 유지할 수 있습니다.
클라우드트레일.
ELB에 대한 API 호출을 캡처하는 데 사용할 수 있습니다.
S3 버킷에 저장할 수 있습니다.

3. CLB
CLB에서 모니터링하는 인스턴스는 InService 또는 OutofService로 보고됩니다.
와일드카드 인증서가 지원됩니다.
AWS Certificate Manager(ACM)에서 생성한 인증서 또는 자체 인증서를 사용할 수 있습니다.
프록시 프로토콜은 L4에만 적용됩니다.
X-forwarded-for는 L7에만 적용됩니다.
사용자 지정 보안 정책을 선택할 때 암호 및 프로토콜을 선택할 수 있습니다(CLB에만 해당).
```
#### [amazon-s3](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/storage/amazon-s3/)
```
Amazon S3
매우 낮은 비용으로 내구성, 고가용성, 무한 확장성 데이터 스토리지 인프라를 제공하는 간단한 스토리지 서비스
Amazon S3는 간단한 키 기반 객체 저장소입니다.
객체는 Amazon S3 리전의 여러 시설(AZ)에 있는 여러 디바이스에 중복 저장됩니다.
Amazon S3는 모든 인터넷 개발 도구 키트와 함께 작동하도록 설계된 간단한 표준 기반 REST 웹 서비스 인터페이스를 제공합니다.
단일 PUT에 업로드할 수 있는 가장 큰 개체는 5GB입니다.
100MB보다 큰 객체의 경우 멀티파트 업로드 기능을 사용하십시오. (5bm~5TB의 개체에 사용가능)
개체에 대한 시간 제한 액세스를 제공할 수 있습니다.
S3 데이터는 다음으로 구성됩니다.
- 키(이름).
- 값(데이터).
- 버전 ID.
- 메타데이터.
- 액세스 제어 목록.
초당 최소 3,500개의 PUT/POST/DELETE 및 5,500개의 GET 요청을 달성
CloudFront 엣지 로케이션을 사용하여 S3에서 오프로드

버킷을 다른 계정의 다른 버킷에 백업할 수 있습니다.
더 나은 성능, 더 짧은 지연 시간, 더 낮은 비용을 위해 클라이언트에 더 가까운 버킷을 만드십시오.

하위 리소스는 객체에 종속되며 독립적으로 존재하지 않지만 항상 객체 또는 버킷과 같은 다른 엔터티와 연결됩니다.
수명 주기 – 개체의 수명 주기를 정의합니다.
웹 사이트 – 정적 웹 사이트를 호스팅하기 위한 구성입니다.
버전 관리 – 개체의 여러 버전이 변경될 때 유지합니다.
ACL(액세스 제어 목록) – 버킷에 대한 액세스 권한을 제어합니다.
버킷 정책 – 버킷에 대한 액세스를 제어합니다.
CORS(교차 출처 리소스 공유).
bulk

S3 Standard(내구성, 즉시 사용 가능, 자주 액세스).
S3 Intelligent-Tiering(데이터를 가장 비용 효율적인 계층으로 자동 이동).
S3 Standard-IA(내구성, 즉시 사용 가능, 자주 액세스하지 않음).
S3 One Zone-IA(복원성이 낮고 자주 액세스하지 않는 데이터에 대한 비용 절감).
*** S3 One Zone-IA 스토리지 클래스에 저장된 객체는 선택한 AWS 리전의 단일 가용 영역 내에 중복 저장됩니다.
S3 Glacier(보관된 데이터, 검색 시간(분 또는 시간)).
S3 Glacier Deep Archive(장기 보존을 위한 가장 저렴한 스토리지 클래스).


기본적으로 버킷, 해당 객체 및 관련 하위 리소스는 모두 비공개입니다.
기본적으로 리소스 소유자만 버킷에 액세스할 수 있습니다.
IAM 정책 내에서 프로그래밍 방식 액세스 또는 AWS Management Console 액세스 권한을 Amazon S3 리소스에 부여할 수 있습니다.
버킷 소유자는 다른 AWS 계정(또는 계정의 사용자)에게 교차 계정 권한을 부여하여 객체를 업로드할 수 있습니다.
- 객체를 업로드하는 AWS 계정이 객체를 소유합니다.
- 버킷 소유자는 다른 계정이 소유한 객체에 대한 권한이 없습니다.
- 버킷 소유자가 요금을 지불합니다.
	- 버킷 소유자는 소유권에 관계없이 모든 객체에 대한 액세스를 거부할 수 있습니다.
	- 버킷 소유자는 소유권에 관계없이 모든 객체를 아카이브하거나 아카이브된 객체를 복원할 수 있습니다.
	
요청자는 다음을 지불합니다.
버킷 소유자는 객체 스토리지 요금만 지불합니다.
요청자는 요청(업로드/다운로드) 및 데이터 전송에 대한 비용을 지불합니다.

버킷 및 객체에 대한 액세스 권한은 다음에 부여할 수 있습니다.
- 개별 사용자.
- AWS 계정.
- 모든 사람(공개/익명).
- 인증된 모든 사용자(AWS 사용자).

리소스 기반 정책: -> ACL
- 버킷 및 개체에 연결됩니다.
- ACL 기반 정책은 권한을 정의합니다.
- ACL을 사용하여 다른 계정에 읽기/쓰기 권한을 부여할 수 있습니다.
- 버킷 정책을 사용하여 다른 AWS 계정 또는 IAM 사용자에게 버킷 및 객체에 대한 권한을 부여할 수 있습니다.

사용자 정책: -> ACL
- IAM을 사용하여 S3 리소스에 대한 액세스를 관리할 수 있습니다.
- IAM을 사용하여 사용자, 그룹 및 역할을 생성하고 여기에 리소스에 대한 액세스 권한을 부여하는 액세스 정책을 연결할 수 있습니다.
- 정책이 사용자에게 연결되어 있으므로 IAM 사용자 정책에서 익명 권한을 부여할 수 없습니다.
- 사용자 정책은 버킷과 그 안의 객체에 권한을 부여할 수 있습니다.

버킷 및 개체 권한은 서로 독립적입니다.
피부여자는 AWS 계정이거나 사전 정의된 Amazon S3 그룹 중 하나일 수 있습니다.

교차 계정 액세스 다른 계정에서 제공하는 액세스 권한을 개별 사용자에게 위임할 수 있습니다.
이메일 주소 또는 정식 사용자 ID를 사용하여 다른 AWS 계정에 권한을 부여합니다.
다른 계정에서 권한을 받는 계정은 교차 계정 권한을 제3의 AWS 계정에 위임할 수 없습니다.

READ, WRITE, READ_ACP, WRITE_ACP, FULL_CONTROL
권한은 인증된 사용자에 대해 계정 수준에서 할당됩니다.
개별 IAM 사용자에게 권한을 할당할 수 없습니다.

동일한 리전의 EC2와 S3 간에 전송되는 데이터에 대해서는 요금이 부과되지 않습니다.
S3로의 데이터 전송은 무료입니다.
다른 지역으로 전송된 데이터는 요금이 부과됩니다.

Amazon S3 Transfer Acceleration을 사용하면 클라이언트와 Amazon S3 버킷 간에 장거리에서 빠르고 쉽고 안전한 파일 전송이 가능합니다.
Amazon CloudFront의 전 세계에 분산된 AWS 엣지 로케이션을 활용합니다.
환승 시간에 이점이 있는 경우에만 요금이 부과됩니다.
비활성화할 수 없으며 정지만 가능합니다.

S3는 정적 웹사이트를 호스팅하는 데 사용할 수 있습니다.
PHP, .Net 등과 같은 동적 콘텐츠를 사용할 수 없습니다.
요청자 지불은 웹사이트 엔드포인트에서 작동하지 않습니다.
HTTPS/SSL을 지원하지 않습니다.

사전 서명된 URL을 사용하여 AWS 자격 증명이 없는 사용자에게 특정 객체에 대한 임시 액세스를 제공할 수 있습니다.
기본적으로 모든 개체는 비공개이며 소유자만 액세스할 수 있습니다.
만료 날짜 및 시간을 구성해야 합니다.

버전관리 
이전 버전은 영구적으로 삭제될 때까지 청구 가능한 크기로 계산됩니다.
활성화된 버전 관리는 비활성화할 수 없으며 일시 중단됩니다.
MFA 삭제는 다음에 적용됩니다.
- 버킷의 버전 관리 상태 변경
- 개체를 영구적으로 삭제합니다.
교차 리전 복제를 사용하려면 소스 및 대상 버킷에서 버전 관리를 활성화해야 합니다.
이전 버전으로 되돌리는 것은 복제되지 않습니다.
버전 관리가 활성화되면 S3 버킷 소유자만 객체를 영구적으로 삭제할 수 있습니다.

객체 수명 주기 관리
- 만료 작업 — 객체가 만료되는 시기를 정의합니다. Amazon S3는 사용자를 대신하여 만료된 객체를 삭제합니다.
- 전환 작업 - 객체가 다른 스토리지 클래스로 전환되는 시기를 정의합니다  . 예를 들어, 객체를 생성한 지 30일 후에 STANDARD_IA 스토리지 클래스로 객체를 전환하거나 생성한 지 1년 후에 객체를 GLACIER 스토리지 클래스로 아카이브하도록 선택할 수 있습니다.

어떤 스토리지 클래스에서도 STANDARD 스토리지 클래스로 전환할 수 없습니다.
객체는 STANDARD_IA 또는 ONEZONE_IA로 전환하기 전에 현재 스토리지 클래스에서 최소 30일 동안 저장되어야 합니다. 
예를 들어, 객체를 생성한 후 하루가 지나면 STANDARD_IA 스토리지 클래스로 객체를 전환하는 수명 주기 규칙을 생성할 수 없습니다.
객체는 ONEZONE_IA 클래스로 전환하기 전에 STANDARD_IA 스토리지 클래스에 최소 30일 동안 저장되어야 합니다.

S3 암호화
- SSE-S3 – S3 관리 키를 사용한 서버 측 암호화.
-> AES 256을 사용하고, AWS가 마스터키를 주기적으로 교체해주는데, 마스터키를 사용해 객체의 암호화를 복호화한다
- SSE-KMS – AWS KMS 키를 사용한 서버 측 암호화
-> 유료고, 고객마스터키를 사용하여 암호화하는대 이거는 자동으로 생성될 수도있고, 사용자가 만들수도있다. 봉투에 담겨져있어서 안전하다?
- SSE-C – 클라이언트 제공 키를 사용한 서버 측 암호화
-> 키는 고객이 가지고, 암호화는 AWS가 하는대 키를 분실하면 복호화가 불가능하고 AWS는 키를 따로 저장하지않는다
- Client-Side : 업로드하기전에 클라이언트가 암호화

CloudWatch 스토리지 지표는 기본적으로 모든 버킷에 대해 활성화되며 하루에 한 번 보고됩니다.
모니터링할 수 있는 S3 지표는 다음과 같습니다.
- S3 요청.
- 버킷 스토리지.
- 버킷 크기.
- 모든 요청.
- HTTP 4XX/5XX 오류.

교차 지역 복제 (CRR)
- 모든 객체가 선택한 다른 AWS 리전의 대상 버킷에 자동으로 복제
- 서로 다른 지역의 버킷 간에 자동 비동기식 객체 복사
복제를 위해 다른 리전의 대상 버킷을 지정하여 원본 버킷에서 CRR 구성을 활성화합니다.
원본 및 대상 버킷은 서로 다른 지역에 있어야 합니다.
소스 및 대상 버킷 모두에 대해 버전 관리를 활성화해야 합니다.
복제 구성에서 대상 KMS 키를 제공하여 KMS로 암호화된 개체를 복제할 수 있습니다.
AWS 계정 간에 CRR을 설정하여 복제된 데이터를 대상 리전의 다른 계정에 저장할 수 있습니다.
동일한 키 이름과 메타데이터를 공유합니다.
AWS S3는 SSL을 사용하여 전송 중인 데이터를 암호화합니다.
AWS S3에는 객체를 복제할 수 있는 권한이 있어야 합니다.

복제되지 않는 것:
- 복제를 활성화하기 전에 존재했던 객체(복사 API를 사용할 수 있음).
- SSE-C 및 SSE-KMS로 생성된 개체입니다.
- 버킷 소유자에게 권한이 없는 객체입니다.
- 버킷 수준 하위 리소스에 대한 업데이트입니다.
- 수명 주기 규칙의 작업은 복제되지 않습니다.
- 다른 리전에서 복제된 원본 버킷의 객체는 복제되지 않습니다.

요금:
- 업로드 요청.
- 지역 간 전송.
- 두 지역의 S3 스토리지.

동일한 지역 복제(SRR)
- 복제된 객체는 실수로 삭제되는 것을 방지하기 위해 원본 복사본과 동일한 AWS 계정 또는 다른 계정이 소유할 수 있습니다.
 Transfer Acceleration은 대륙에 걸쳐 정기적으로 기가바이트에서 테라바이트의 데이터를 전송하는 데 이상적입니다. 
 또한 전 세계에서 중앙 집중식 버킷으로 업로드하는 클라이언트에게도 유용합니다.
 
계층 간의 주요 차이점은 Deep Archive가 비용은 더 저렴하지만 검색 시간은 훨씬 더 길다는 것입니다(12시간).
S3 Glacier 계층에는 몇 분에서 몇 시간까지 구성 가능한 검색 시간이 있습니다(따라서 지불).
보관된 개체는 실시간 액세스에 사용할 수 없으며 검색 요청을 제출해야 합니다.
Glacier는 AES 256 대칭 키를 사용하여 저장 데이터를 자동으로 암호화하고 SSL을 통한 안전한 데이터 전송을 지원합니다.
Glacier는 객체 메타데이터를 보관하지 않으므로 이 정보를 유지하려면 클라이언트 측 데이터베이스를 유지해야 합니다.
아카이브는 1바이트에서 최대 40TB까지 가능합니다.
아카이브 업로드는 동기식입니다.
아카이브 다운로드는 비동기식입니다.
AWS는 작은 객체가 많은 경우 업로드하기 전에 아카이브(예: zip 파일)에 결합할 것을 권장합니다.
아카이브에 설명을 추가할 수 있으며 다른 메타데이터는 추가할 수 없습니다.
90일 이내에 데이터를 삭제하면 요금이 부과됩니다.
```
#### [amazon-ebs](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/amazon-ebs/)
#### [amazon-efs](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/storage/amazon-efs/)
#### [aws-storage-gateway](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/storage/aws-storage-gateway/)
#### [amazon-cloudfront](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/networking-and-content-delivery/amazon-cloudfront/)
#### [amazon-fsx](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/storage/amazon-fsx/)
#### [amazon-rds](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/database/amazon-rds/)
#### [aws-database-migration-service]((https://digitalcloud.training/certification-training/aws-solutions-architect-associate/migration/aws-database-migration-service/)
#### [aws-datasync](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/migration/aws-datasync/)
#### [amazon-ec2](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/amazon-ec2/)
#### [amazon-lambda](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/aws-lambda/)
#### [amazon-kinesis](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/analytics/amazon-kinesis/)
#### [amazon-sqs](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/application-integration/amazon-sqs/)
#### [amazon-sns](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/application-integration/amazon-sns/)
#### [amazon-mq](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/application-integration/amazon-mq/)
#### [aws-organizations](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/aws-organizations/)
#### [aws-iam](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/security-identity-compliance/aws-iam/)
#### [aws-waf-and-shield](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/security-identity-compliance/aws-waf-and-shield/)
#### [aws-cloudformation](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/aws-cloudformation/)

### reference
[AWSCertifiedSolutionsArchitectUnofficialStudyGuide](https://github.com/serithemage/AWSCertifiedSolutionsArchitectUnofficialStudyGuide)

[AWS Solutions Architect — Associate certificate Study — 공식 문서 정리 Part 1](https://medium.com/@tkdgy0801/aws-solutions-architect-certificate-%EA%B3%B5%EB%B6%80-%EC%98%81%EC%97%AD-1-7abd91cd91a8)

[AWS Solutions Architect — Associate certificate Study — 공식 문서 정리 Part 2](https://medium.com/@tkdgy0801/aws-solutions-architect-associate-certificate-study-%EA%B3%B5%EC%8B%9D-%EB%AC%B8%EC%84%9C-%EC%A0%95%EB%A6%AC-part-2-3775eb75230e)

[AWS Solutions Architect — Associate certificate Study — 공식 문서 정리 Part 3](https://medium.com/@tkdgy0801/aws-solutions-architect-associate-certificate-study-%EA%B3%B5%EC%8B%9D-%EB%AC%B8%EC%84%9C-%EC%A0%95%EB%A6%AC-part-3-b14f3e4005b)

[AWS_Cloud_Best_Practices](https://d1.awsstatic.com/whitepapers/AWS_Cloud_Best_Practices.pdf)

[AWS_well-architected](https://aws.amazon.com/ko/architecture/well-architected/?wa-lens-whitepapers.sort-by=item.additionalFields.sortDate&wa-lens-whitepapers.sort-order=desc)