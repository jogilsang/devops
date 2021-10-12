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
### Word
### public
### [public-load-balancer-private-ec2](https://aws.amazon.com/premiumsupport/knowledge-center/public-load-balancer-private-ec2/)

### cheat
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
#### [elastic-load-balancing](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/elastic-load-balancing/)
#### [amazon-ec2](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/amazon-ec2/)
#### [amazon-s3](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/storage/amazon-s3/)
#### [amazon-rds](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/database/amazon-rds/)
#### [amazon-ebs](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/amazon-ebs/)
#### [amazon-lambda](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/compute/aws-lambda/)
#### [amazon-kinesis](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/analytics/amazon-kinesis/)
#### [aws-storage-gateway](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/storage/aws-storage-gateway/)
#### [aws-organizations](https://digitalcloud.training/certification-training/aws-solutions-architect-associate/management-tools/aws-organizations/)

### reference
[AWSCertifiedSolutionsArchitectUnofficialStudyGuide](https://github.com/serithemage/AWSCertifiedSolutionsArchitectUnofficialStudyGuide)

[AWS Solutions Architect — Associate certificate Study — 공식 문서 정리 Part 1](https://medium.com/@tkdgy0801/aws-solutions-architect-certificate-%EA%B3%B5%EB%B6%80-%EC%98%81%EC%97%AD-1-7abd91cd91a8)

[AWS Solutions Architect — Associate certificate Study — 공식 문서 정리 Part 2](https://medium.com/@tkdgy0801/aws-solutions-architect-associate-certificate-study-%EA%B3%B5%EC%8B%9D-%EB%AC%B8%EC%84%9C-%EC%A0%95%EB%A6%AC-part-2-3775eb75230e)

[AWS Solutions Architect — Associate certificate Study — 공식 문서 정리 Part 3](https://medium.com/@tkdgy0801/aws-solutions-architect-associate-certificate-study-%EA%B3%B5%EC%8B%9D-%EB%AC%B8%EC%84%9C-%EC%A0%95%EB%A6%AC-part-3-b14f3e4005b)

[AWS_Cloud_Best_Practices](https://d1.awsstatic.com/whitepapers/AWS_Cloud_Best_Practices.pdf)

[AWS_well-architected](https://aws.amazon.com/ko/architecture/well-architected/?wa-lens-whitepapers.sort-by=item.additionalFields.sortDate&wa-lens-whitepapers.sort-order=desc)