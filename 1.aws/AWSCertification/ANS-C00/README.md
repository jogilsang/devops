
# ANS-C00
> AWS Certified Advanced Networking Specialty

- 하이브리드 클라우드의 DNS용 : https://www.youtube.com/watch?v=_Z5jAs2gvPA
- Transit Gateway : https://www.youtube.com/watch?v=9Nikqn_02Oc

- Amazon ANS-C00 Exam : https://www.examtopics.com/exams/amazon/ans-c00/

- [blog-AWS Certified Advanced Networking – Speciality (ANS-C00) Exam Learning Path](https://jayendrapatil.com/aws-certified-advanced-networking-speciality-ans-c00-exam-learning-path/)

---

## INDEX
- LECTURE
    - Section3 : Amazon VPC fundamentals
    - [Section4 : Additional VPC Features](#section4)
    - [Section5 : VPC and DHCP](#section5)
    - [Section6 : Network Performance and Optimization](#section6)
    - [Section7 : VPC Connectivity - VPC Peering](#section7)
    - [Section8 : VPC Connectivity - Transit Gateway](#section8)
    - [Section9 : VPC Endpoints - VPC Gateway Endpoint](#section9)
    - [Section10 : VPC Interface endpoint and PrivateLink](#section10)
    - [Section11 : Hybrid Network basics](#section11)
    - Section12 : AWS Site-to-Site VPN
    - Section13 : AWS Clint VPN
    - [Section14 : AWS Direct Connect](#section14)
    - Section15 : AWS CloudFront
    - Section16 : Elastic Load Balancers
    - Section17 : Route 53
    - Section18 : AWS Network Security Services
    - Section19 : Gateway Load Balancers
- [EXAMTOPICS](#examtopics)

### 

---

### section4
- Extending VPC Address space
    - 다중 CIDR 허용
    - CIDR은 중복되면안되며, 커서는 안된다
    - Non RFC1918
        - 100.64.0.0/16
    - RFC1918 이 중복되면안된다
        - 192.168.0.0/16
        - 172.16.0.0/12
        - 10.0.0.0/8
    - 10.0.0.0/16, 10.2.0.0/16 enable
    - case
        - VPC CIDR 10.0.0.0/16, 10.2.0.0/16
        - subnet 10.0.0.0/17, 10.2.0.0/17
- ENI
    - elasticIP 1개당 ENI 1개랑 매칭된다.
    - EC2 인스턴스 유형에 따라 여러개의 ENI를 사용할수있다
    - 각각의 ENI는 여러개의 private IP를 가질 수 있다
    - EC2 하나로 multi based(public, private) subnet 사용이 가능하다
    - ENI를 여러개 쓴다고해서, network bendwith가 배수로 올라가지않는다
    - ENI의 scope는 AZ이기때문에, 다른AZ에서 사용할수없다
    - ENI는 attach가 가능하지만, primary를 dettach 할순없다
    - etho0가 primary이고, secondary부터 eth1로 붙는다
    - 인스턴스에서 ip address li 로 보유중인 ip를 검색할 수 있다
    - AWS 서비스 별로 자동생성되거나 적용되는 managed ENI가 있다
- BYOIP
    - Bring Your Own IP
    - why
        - keey ip reputation
        - move application without change
        - keep whitelist
        - AWS as a hot stanby
    - ROA
        - ASNS 16509 ~ 14618
    - ipv4
        - /24, /25 enable
        - /22, /23 unable
    - RIR
        - ARIN
        - RIPE
        - APNIC 
- VPC Traffic Monitoring
    - case
        - VPC Flow logs
        - Subnet Flow logs
        - ENI Flow logs
    - how
        - cloudwatch logs insight
    - why
        - 트러블슈팅
        - 연결이슈
        - 모니터링
    - Action
        - allow와 reject를 확인가능 (원인은 SG 또는 NACL)
    - stored in s3, cloutwatch logs
    - AWS Managed Inteface 는 ???
- VPC Traffic Mirroring
    - realtime
    - ENI (Session or Target)
    - 특정 트래픽을 대상으로 하기때문에, 전체 트래픽이 아님
    - 인바운드와 아웃바운드 각각에 대해 가능하다
    - different account enable, diffrent VPC enable
    - VXLAN
    - case
        - 1\. EC2
        - 2\. NLB
            - each traffic analyizer
            - allowed UDP 4789
    
### section5
- scenario
    - Private DNS Resolution
    - Hybrid DNS Resolution
        - bi-directional (On-Premise <-> AWS)
            - 1\. SimpleAD
            - 2\. EC2 - DNS Resolver 
            - 3\. Route53 Resolver Endpoints
- DHCP Option Set
    - 1\. create hosted zone
    - 2\. A Recode Created
    - *** VPC per only 1, not zero, can't changed
- VPC DNS Server = AWSProviderDNS (only 1)
- Option (Requird)
    - enableDNSSupport
    - enableDNSHostname
- 169.254.169.253=DNS Server
```sh
# EC2 Auto created and changed
/etc/resolv.conf
# manually DHCP Renewal
sudo dhclient -r eth0
```


### section6
- Network Performance and Optimization
    - AWS 내에서는 JumboFrame이 9001 MTU 가 default이다
    - AWS 리소스간, 온프레미스에 대해, 인터넷에 대해서 최대지원이 다르다
        - Over the Internet : 1500
        - VPC 내부 : 9001
        - 리전 내 VPC Peering : 9001
        - 리전 간 VPC Peering : 1500
        - VPC Endpoint : 8500
        - VPN Via VGW : 1500
        - DX : 9001
        - DX Via TGW : 8500
        - VPN Via TGW : 1500
    - MTU가 1500을 넘으면, dropped되거나 fragment 될 수 있다
    - 인스턴스 타입에 따라 점보프레임 지원여부가 다를 수 있다
    - 점보프레임은 ENI Level에서 설정할 수 있다
        ```sh
        ### 점보프레임 사용여부 확인
        tracepath amazon.com

        ### 점보프레임 확인
        ip link show eth0

        ### 점보프레임 설정
        sudo ip link set dev eth0 MTU 9001
        ```
- basic of network performance
    - Bandwidth - 전송되는 최대양
    - latency - 네트워크가 연결되는 두 지점사이에 통신지연
        - 네트워크 장비(Hop)을 통과하면서 발생하는 딜레이를 포함
    - jiter - 지터는 패킷 간의 지연 차이입니다. 지연을 보다 일관되게 만들어 지터를 줄일 수 있습니다.
        - packet delay variation
        - 예를들면 패킷도달에 대한 지연시간이 일정하게 1ms여야하는대, 지연값이 달라질 떄
        - 예를들면 패킷의 지연이 2밀리초에서 120밀리초 사이인경우
    - PPS (Packet Per Seconed) : 
    - Interface MTU : 물리적인 인터페이스에서 지원하는 MTU
    - Path MTU : 출발지 - 목적지 사이 인터페이스의 최소 MTU 
        - 최대 1500 Byte
    - Jumbo Frame : 1500 byte이상 최대 9000 byte
        - 패킷을 덜 보내고, 쓰루풋이 증가하고, 낮은 PPS로 전송량을 만족시킬 수 있다
    - Path MTU Discovery
        - 통신하는 host간에 fragmentation이나 packet drop을 피하기위한 메커니즘
        - 1. Interface MTU가 Path MTU와 동일하다고 가정하고 flag를 1로 설정(DF마킹=don't fragment)
        - 2. MTU 1500 를 전송해서 Router가 지원하면 통과
        - 3. 다음 Router가 MTU를 지원못하고 1000 Byte가 한계인경우 통과할 수 없음
        - 4. flags가 1이기떄문에, ICMP 프로토콜을 통해 MTU를 1000으로 변경회신
        - 5. MTU 1000 으로 전송시작
        - *** ICMP must be enabled
    - PlacementGroups
        - HPC를 목적으로 논리적으로 동일AZ, 동일 RACK으로 EC2를 묶는다.
        - 10GBPS의 네트워크를 지원한다
    - EBS Optimized EC2 instances
        - EBS는 네트워크 드라이브이기떄문에, EC2에서 I/O가 발생할 때 Network 통신을한다.
        - 일반적인 EC2 인스턴스는 외부통신과 EBS I/O에 대해서 단일 I/F로 통신하기때문에 대역폭 문제가 생길 수 있다.
        - EBS 최적화 EC2인스턴스는 EBS I/O 처리를 별도의 I/F로 한다.
- Enhanced Networking
    - 1M PPS를 넘어고, 적은 지연, ENA를 사용하는 것
    - 인스턴스와 하이퍼바이저 간의 패킷프로세싱의 오버헤드를 감소
    - option1 : intel 82599 VF IF(=intel ixgbevf) 
        - Instance <-> NIC <-> byPassing Virtual Layer
    - option2 : ENA (Elastic Network Adapter)
        - Instance <-> ENA <-> byPassing Virtual Layer
    - 명령어 : 드라이버 확인하기
        ```sh
        ### 드라이버 확인하기
        ethtool -i eth0
        ```
    - Multifle Flow 일경우, 최대100G
    - Sing Flow 일경우, Placement group 내이면 최대10G
    - Sing Flow 일경우, 그 외 최대5G
    
- DPDK
    - Intel The Data Plane Development Kit
    - DPDK는 운영 체제에서 네트워킹 오버헤드를 줄이는 데 사용되는 라이브러리 및 도구 세트입니다.
    - OS내부에서 kernelByPass로 패킷 프로세싱의 오버헤드를 감소시킨다
- EFA
    - Elastic Fabric Adapter
    - ENA의 특별한 유형으로, 리눅스만 지원
- network I/O Credit
    - 네트워크 크레딧이 누적된다
- bandwidth
    - MAX Bandwidth는 Single Flow가 아니며 Multifle Flow이다
    - SingleFlow는 Placement group 내에서는 최대 10G, 그 외에는 5G까지 가능하다
    - IGW : No Limit
    - VPC : No Limit
    - VPC Peering : No limit
    - NAT Gateway : 45 Gbps (여러개 쓸경우 스케일업 가능)
    - TransitGW : 최대 50Gbps
        - VPN Connection 당 1.25Gbps
    - VPNGateway
        - Site-to-SiteVPN 역시 1.25Gbps
        - DX는 DX port당 적용
    - EC2
        - Intance Family Type, Enhanced Networking 에 영향
        - 32vcpu 미만이거나 제너레이션 타입이 아닌경우, 인터넷을 통하거나 다른 Region간의 대역폭은 최대 5G이다
- SR-IOV, PCI

- quiz
- 향상된 네트워킹은 지터와 네트워크 성능을 줄이는 데 도움이 될 수 있습니다. 
- 배치 그룹 및 짧은 지연 시간은 VPC를 떠나는 흐름을 지원하지 않습니다. 
- 네트워크 인터페이스는 네트워크 성능에 영향을 미치지 않습니다. 
- Application Load Balancer는 성능 문제를 지원하지 않습니다.
- Using more than one instance will increase the performance because any given flow to Amazon S3 will be limited to 5 Gbps
- R4 인스턴스는 크레딧을 사용할 수 있을 때 더 높은 대역폭을 허용하는 네트워크 I/O(입/출력) 크레딧을 사용하며, 이는 기준 성능 테스트에 영향을 미칠 수 있습니다. 성능 테스트 전에 네트워크 크레딧을 축적했다면, 이는 더 높은 피크값을 허용합니다
- ENA(Elastic Network Adapter) 드라이버를 지원하는 최신 버전으로 커널을 업데이트한 뒤, 그 외에도 향상된 네트워킹 지원을 위해 AMI 또는 인스턴스에 플래그를 지정해야 합니다.
- 초당 패킷을 늘리면 처리량이 감소할 가능성이 큽니다.
- 운영 체제 TCP(Transmission Control Protocol) 스택 조정, 네트워크 가속기 사용 또는 애플리케이션 메커니즘 변경과 같은 추가 조치
- 매우 높은 처리량 데이터 전송을 위해 네트워크 성능을 확장하려면, 주어진 흐름이나 인스턴스의 대역폭이 전체 성능을 제한하지 않도록 여러 인스턴스에 흐름을 분산합니다.
- 지터는 패킷 간의 지연 차이입니다. 지연을 보다 일관되게 만들어 지터를 줄일 수 있습니다. 향상된 네트워킹과 CPU 또는 디스크 병목 현상 제거는 지터를 줄이는 데 도움이 될 수 있습니다.
- Amazon VPC는 ​​QoS 없이 모든 패킷을 공정하게 처리합니다.
- 인스턴스별로 Network Load Balancer를 사용하면 비효율적이고 성능이 저하됩니다.
- 단일 배치 그룹은 하나의 가용 영역에만 적용되므로 가용성이 감소합니다.
- 운영 체제가 지원하는 인스턴스 크기와 제품군은 최대 처리량과 대역폭을 크게 정의합니다.
- 점보 프레임은 기본적으로 VPC에서 활성화되며 배치 그룹 외부에서 작동합니다.
- MTU를 증가시키는것은 PPS(초당 패킷수)가 제한되는 어플리케이션에 적합합니다. 패킷당 더 많은 데이터를 보낼수 있으므로 처리량이 증가합니다
- 탄력적 네트워크 인터페이스는 향상된 네트워킹을 지원하는 인스턴스의 네트워크 성능에 영향을 미치지 않습니다
- 멀티캐스트 트래픽에는 VPC에 없는 레이어 2 스위칭 및 라우팅 인프라가 필요합니다. 애플리케이션 구성 요소를 재설계하고 배치 그룹에 짧은 대기 시간을 제공하는 것이 가장 좋습니다.
- AWS Direct Connect 연결을 사용하면 온프레미스 연결을 개별 Amazon EC2 인스턴스 네트워크 제한 이상으로 확장할 수 있습니다.


### section7
> VPC Peering : 서로 다른 VPC를 같은 네트워크처럼 사용하는 것으로 관리형 서비스이며, AWS 내에서 최저지연시간과 일관된 대역폭을 제공한다
- why
    - VPC가 각각의 IGW로 통신하게될경우
        - 1\. 덜 보안적이다
        - 2\. latency와 bandwidth 영향
        - 3\. NAT Gateway 등 사용 시 비용발생
        - 4\. public으로 노출되기를 원하지않음
- note
    - 다른 계정, 다른 Region의 VPC와 연결이 가능하다
    - VPC별로 VPC Peering은 최대 125개까지 설정가능하다
    - VPC Peering을 2개설정한다고해서, bandwidth와 latency가 2배가되지않는다.
    - non-transitive 특성
        - A-B, A-C 로 연결되어있다고해서, A-C로 연결되지않는다
        - C의 VPC Gatewayendpoint를 통해 S3 접근 등도 제한된다.
        - C를 통해 IGW를 통과해서 인터넷사용도 제한된다
        - B의 프록시 인스턴스를 이용한다면 C로 접근할 수 있다
    - non-overlapping (CIDR)
        - RoutingTable에서 각각의 VPC Subnet을 업데이트해야한다
    - 가용영역이 동일하면, VPC Peering은 비용이 무료다

### section8
> Transit Gateway : 
- introduction
    - Multi-VPC의 full-mesh 연결을 단순하게 해준다
        - 6개의 VPC를 peering으로 연결하려면 15개의 연결이필요
        - 6개의 VPC를 transit GW로 연결하면 1개만 필요
    - On-premise의 VPN Connection을 hub and spoke 모델 지원
    - On-premise의 Router를 Direct Connect와 연결해서 지원
    - 서로 다른 Region 끼리는 Transit Gateway Peering을 이용하여 연결할 수 있다.
    - Customizing 할 수 있다면, 방화벽 용으로 Traffic Inspection VPC를 사용할 수 있다.
- attachment-routing
    - tgw는 기본 Routing Table이 있다
    - VPC간 CIDR이 overlapping 되면안된다
    - Auto
        - attachment하게되는 VPC별로 자동으로 라우팅경로가 추가된다 (EX : 10.1.0.0/16 via att-a)
    - Static
        - 각 VPC별 RoutingTable에 TGW 전체 서브넷을 적용해야한다 (EX : 10.0.0.0/8)
- attachment-routing-control
    > 특정 VPC 간만 통신하게 한다
    - setting - do not enable RT Association
    - setting - do not enable RT Propagation
    - create TGW RT
    - create Assoiastion : VPC 연결
    - create Propagation : VPC 할당
- transitGateway AZ Considerations
    - TGW랑 연결된 AZ의 해당 서브넷만 통신할수있다?
- transitGateway Peering
    - Regional Router이기때문에, Region간 연결가능
    - routing은 static으로 진행한다
- TGW Architecture : Centralized outbound internet using NAT
    - SpokeVPC, centralized VPC
    - NAT Gateway를 여러개쓰지않고, 1개 또는 2개로 인터넷 개통
    - HA를 만족할 수 있다
    - 10.0.0.0/8 -> blackholl
- TGW Architecture : Centralized IPS/IDC on EC2
    - SpokeVPC, EgreesVPC
    - 장애발생 시, cloutwatch alarm과 lambda를 활용해
    라우팅 테이블을 수동으로 변경해야한다. tgw는 로드벨런싱을 지원하지않는다
- TGW Architecture : Centralized VPC Endpoints
    - AWS VPN - IPSec + BGP (supported loadbalansing, detect fail)
    - VPN ECMP Support - 50GB - 멀티VPN 터널
- vpc peering vs transit gateway

### section9
- VPC Endpoint는 공개 서비스에 대한 비공개 액세스입니다.
- VPC Endpoint를 사용하면 인터넷으로 트래픽이 흐를필요가없다
- VPC 엔드포인트는 동일한 AWS 리전의 AWS 서비스에 대해 작동합니다.
- IGW, NAT GW를 사용하지않아도 되며, 대역폭 제한도없다
- GW Endpoint(S3,DynamoDB)와 ENI(SQS 등)가 있다
- privateIP에 대해서 접근을 제한할 수는없다
- process
    - 1. s3 endpoint를 만든다
    - 2. RoutingTable에 PL로 시작하는 prefix를 추가한다
    - 3. HTTP,HTTPS 허용여부를 확인한다
    - 4. VPC Endpoint Policy를 확인한다.
    - 5. EC2에 S3 Resource Based IAM Role을 부여한다
    - 6. S3 Bucket Policy를 확인한다
        - VPCE : One
        - VPC : Entire VPC
    - 7. S3 Bucket Policy에서 VPC 엔드포인트에 대한 액세스를 제한하도록 구성되지 않은 한, 퍼블릭 API를 통해 서비스를 계속 사용할 수 있습니다.

- quiz
- VPC 엔드포인트 정책에는 콘솔에 특별히 적용되는 조건이 없으며 엔드포인트 정책은 버킷에 액세스할 수 있는 리소스를 제한하지 않습니다. AWS Management 콘솔을 통해 Amazon S3 버킷에 대한 액세스를 활성화하려면 퍼블릭 액세스를 허용해야 합니다.
- Amazon S3 엔드포인트가 작동하려면 DNS를 활성화해야 합니다. 
- Amazon S3 엔드포인트에는 IP 주소가 필요하지 않습니다. 
- 엔드포인트는 또한 프라이빗 또는 퍼블릭 서브넷의 영향을 받지 않습니다. 
- Amazon S3 엔드포인트에는 라우팅 테이블의 경로가 필요합니다.

### section10
- VPC Peering과의 차이점은 한 가지 서비스만 허용할 수 있다
- VPC interface endpoint
    - 동일 Region의 AWS 리소스 : SQS, kinesis 등
        - hands-on
            - 1\. Enable DNS Name
            - 2\. VPC - DNS Resolution - Enable
            - 3\. VPC - DNS Hostname - Enable
            - 4\. SG - 443 - attach to SQS
            - 5\. IAM Role - SQSFullAccess Polices - attach to EC2
        - VPC Interface Endpoint는 ipv4 만 지원한다
        - VPC Interface Endpoint는 Regional, Zonal 둘다 DNS 엔트리를 제공한다
        - AZ당 ENI를 생성할 수 있기때문에 고가용성이다
        - 443을 이용하기때문에 보안이 적용된다
    - privateLink
        - ServiceVPC <-> NLB <-> EC2
        - ServiceVPC <-> NLB <-> VPN/DX <-> On-Premise-Server
        - 1000개의 CustomerVPC에 노출될 수 있다
- VPC Interface Endpoint DNS
    - AWS는 private hosted zone을 생성해서, VPC에 associate 해준다. 
    - DNS query를 할경우, public hostname -> private ip로 자동으로 resolution 해준다
    - VPC Peering을 하게될경우, Route53 Private Hosted Zone을 attach해준다면, interface endpoint에 대한 DNS resolve가 가능하다
    - Route53 Private Hosted Zone을 사용해서 interface Endpoint의 alias Record를 추가할 수 있다.
    - 온프레미스 네트워크와 VPN or DX로 연결될경우, Cusotm Route53 DNS Resolver로 DNS Query를 포워딩해서 interface Endpoint에 접근할 수 있다
    - CASE 1 : Unable
        - subnet 1
            - public dns -> igw -> internet -> service
            - private dns -> other subnet -> private eni -> service
        - subnet 2 (ENI)
            - public dns -> x
            - private dns -> private eni -> service
    - CASE 2 : Enable
        - subnet 1
            - public dns -> other subnet -> private eni -> service
            - private dns -> other subnet -> private eni -> service
        - subnet 2 (ENI)
            - public dns -> private eni -> service
            - private dns -> private eni -> service
    - required
        - VPC - Endpoint - Edit - PrivateDNSName - Enable
        - VPC - Enable DNS Hostname - True
        - VPC - Enable DNS Support - True
    - cli
        - \-\-queue-url [public-hostname]
        - \-\-endpoint-url [regional-hostname]
- AWS PrivateLink는 interface VPC Endpoint의 확장이다
- vpc peering vs vpc privatelink
    - privatelink는 VPC의 CIDR이 동일해도된다
    - privatelink는 one service만 exposed 된다
    - privatelink는 Connection에 제한이 없다
    - privatelink는 consumer가 service provider VPC로 단방향 통신이다

- quiz
- AWS PrivateLink는 서비스 VPC에 대한 요청을 시작하는 솔루션에만 적합합니다
공유 VPC의 서비스는 스포크 VPC에 대한 연결을 시작할 수 없습니다.
- AWS PrivateLink는 VPC 피어링보다 더 많은 스포크 VPC를 지원합니다.
- AWS PrivateLink는 소스 NAT(Network Address Translation)를 적용하므로 소스 IP를 기본적으로 사용할 수 없습니다.
- IPsec을 지원하지 않기 때문에 AWS PrivateLink를 통해 VPN을 생성할 수 없습니다.
- AWS PrivateLink는 TCP 트래픽만 지원합니다.
- DNS 이름 대신 AWS PrivateLink 엔드포인트의 IPv4 주소를 사용할 수 있습니다.
- AWS PrivateLink는 접두사 목록을 사용하지 않습니다.
- AWS PrivateLink가 있는 라우팅 테이블에는 IP 주소가 없습니다.
- AWS PrivateLink는 중앙 서비스를 제공할 뿐만 아니라 이 사용 사례에 맞게 확장할 수 있습니다.
- 개발 시스템에 대한 액세스를 제공하기 위한 최상의 디자인은 중앙 VPC에 개발시스템을 배포하고, 개발자가 AWS PrivateLink를 통해 시스템에 엑세스하도록 허용합니다.

### section11
- introduction To Hybrid Networking
    - flow over the internet
    - client-to-site VPN
        - EC2 - VPN Endpoint
        - aws <-> client
    - site-to-site VPN
        - VGW (Virtual Private Gateway)
        - aws <-> on-prem
    - Direct Connect
        - phyically connected
        - private fiber line
        - 대역폭 확보가능
        - aws <-> on-prem
- OSI7 Layer
    - Layer7 : EndUser Layer
        - HTTP, FTP, SSH, DNS
    - Layer6 : Convert to Binary Layer
        - Encryption
        - Decryption
        - Compression
            - EX : 10mb -> 2mb
    - Layer5 : Session Management
        - Authentication
        - Authorization
    - Layer4 : End to End Connection Layer
        - Segments
            - data
        - TCP,UDP
        - Segmentation
        - Flow Control
            - src의 대역폭이 100Mbps, dst의 대역폭이 10Mbps만 지원한다면 변경
        - Error Control
    - Layer3
        - Packets
            - data-ip
        - IP, IPSec, ICMP
    - Layer2 : Media Access Contol Layer
        - Frames
            - data-ip-mac
        - Ethernet, PPP
    - Layer1
        - Electronic, Radio via Ethernet Cable or optical fiber
- How IPSec VPN Works ?
    - AWS는 IPSec VPN만 지원한다
    - Site-to-Site VPN(VGW <-> CGW) 연결 시, 2개의 tunnel(4개의 SA)를 통해 HA를 확보할 수 있다
    - UDP port 500에서 동작한다.
    - Layer 3에서 Encrpyted 된다
    - two phase가 있다
        - IKE phase1
            - Identification & Authentication SA
            - pre-shared 등의 Credential을 교환한다
        - IKE phase2
            - IPSec SA
            - 실제로 데이터가 전송된다
    - 그 외, 디프하만 등의 개념이있다
- How BGP works
    - AS : Autonomus Systems (자율시스템)
        - public AS : 1 ~ 64495 (IANA)
        - private AS : 64512 ~ 65534
    - static route
        - 경로에 대해서 라우팅테이블에 경로를 전부 추가해줘야함
    - dynamic route
        - dynamically propagated
        - BGP ( Bolder Gateway Protocol )
            - Path-Vector Protocol
            - TBGP (within AS)
            - EBGP (between AS)
                - Highest Weight
                - Highest Local preference
                - Shorted AS Path : how many hops via dst?
                - Lowest MED (Multi Exit Discriminator)
            - Each AS is connected by MPLS or Other link
            - each entry in Routing Table has a Dst, Nexthop, Path
                - DST : 10.30.0.0/16, 10.10.0.0/16
                - NextHop : 10.30.0.1, 0.0.0.0
                - Path : i, 400

- BGP Route selection

### section14
- Introduction DX
    - DX Location은 3rd Party에서 제공된다.
    - AWS에서 나오는 트래픽을 비용으로 청구하며, 종합적으로 저렴할 수 있음
    - 1/10/100 GBPS를 DX Location에 지원한다
    - 25 Region에 108 DX가 지원된다
    - 연결에 4-12 weeks의 시간이 소요된다.
    - OSI 7 Layer
        - L1 : single Mode Fiber
        - L2 : 802.1Q
        - L3 : peer and AWS IP
        - L4 : TCP 179
        - L7 : BGP
    - Connected Flow
        - AWS <-> AWS DX Router <-> Customer Router <-> On-prem Router
    - PublicVIF : Connected S3, DynamoDB etc...
    - PrivateVIF : Connected VPC 
- DX Component
    - AWS Backbone Network <-> Cross Connect <-> Customer Router & Access Point <-> Customer Backbone Network
        - AWS Backbone Network = AWS <-> DX Router
        - Cross Connect = DX Router <-> Customer or Partner Router
            - managed by DX Provider
        - Access Point = Customer or Partner Router <-> DX Location
            - managed by Customer or Partner
        - Customer Backbone Network = Customer or Partner Router <-> On-prem
            - managed by Customer or ISP Provider
- DX Requirement
    - 802.1q VLAN
        - Ethernet Frame -> 802.1q Encaptulation Frame (VLAN TAG Added = 4 Byte)
    - Single Mode Fiber
    - Auto-negotiation(port speed and duplex mod) for the port disabled
    - BGP, BGP MD5
        - (AWS AS {range 4byte} supported)
    - BFD (Bidirectional Forwarding Detection)
        - why ? : network is not always available connection
        - fail detect within 1 second
        - optional, not required
    - ip-ranges.json
        - https://ip-ranges.amazonaws.com/ip-ranges.json
        - enable AWS SNS Topic in Region ip-range changed

---

### examtopics


- 2\. AWS VPC에서는 브로드캐스트를 보낼 수 없지만 주소는 아직 예약되어 있습니다.
- 3\. IDS - 침입 탐지, 네트워크 트래픽 흐름 기준을 설정하도록 설계되지 않았습니다.
- 8\. AWS Direct Connect에서 네트워크는 BGP(Border Gateway Protocol) 및 BGP MD5 인증을 지원해야 하며
Amazon Virtual Private Cloud(VPC)에 연결하려면 프라이빗 ASN(자율 시스템 번호) 을 제공해야 합니다. 첫단계는 AWS Direct Connect 연결 요청 제출, https://docs.aws.amazon.com/directconnect/latest/UserGuide/maximum_resiliency.html
- 10\. 정의에 따르면 HTTP는 연결 지향 프로토콜이므로 TCP를 사용합니다.
- 11\. AWS Direct Connect는 표준 1기가비트 또는 10기가비트 이더넷 단일 모드 광섬유 케이블을 통해 내부 네트워크를 AWS Direct Connect 위치에 연결합니다.
- 12\. AWS Direct Connect를 사용하려면 가상인터페이스 생성이 필요한대 매개변수로 VLAN ID와 IP prefixes to advertise 가 필요하다.
- 13\. AWS Config CLI의 describe-compliance-by-config-rule 명령을 사용하여 각 규칙의 규정 준수 상태를 확인할 수 있습니다. http://docs.aws.amazon.com/config/latest/developerguide/evaluate-config_view-compliance.html
- 14\. Amazon CloudFront의 웹 배포의 경우 오리진은 Amazon S3 버킷 또는 HTTP 서버가 될 수 있습니다.
- 15\. 6초의 HealthCheck Interval, unhealthy threshold 가 5, healthy threshold가 10일 때인스턴스를 정상으로 선언하려면 10번의 성공적인 확인이 필요합니다. 인스턴스를 비정상으로 선언하려면 5번의 실패한 확인이 필요합니다.
- 16\. Direct Connect 연결을 사용하여 모든 유럽 지역에 액세스하려고 합니다. DX Gateway를 사용하면됩니다. AWS Direct Connect 게이트웨이 또는 퍼블릭 가상 인터페이스를 사용하면 선택한 위치에서 다른 AWS 리전(중국 제외)에 액세스할 수 있습니다. https://aws.amazon.com/ko/directconnect/locations/
- 17\. Amazon CloudFront와 관련하여 HTTP 및 HTTPS 웹 배포의 경우 CloudFront에서 오리진으로 쿠키를 전달할지 여부를 선택할 수 있습니다. RTMP 배포의 경우 쿠키를 처리하도록 CloudFront를 구성할 수 없습니다.
- 18\. Amazon SNS 주제에 대해 CloudWatch로 구성한 지표는 자동으로 수집되어 1분 간격으로 CloudWatch에 푸시됩니다. https://docs.aws.amazon.com/sns/latest/dg/sns-monitoring-using-cloudwatch.html
- 19\. 모든 트래픽이 "보안 그룹 1"을 사용하는 "서브넷 1"의 인스턴스에 액세스할 수 있도록 하려면, 0.0.0.0/0이 "서브넷 1"에 액세스하도록 허용하는 NACL 규칙, 0.0.0.0/0 인바운드를 허용하는 "보안 그룹 1"의 보안 그룹 규칙이 필요하다
- 20\. 데이터를 교환할 수 있어야 하는 세 개의 가상 사설 클라우드(VPC)가 있습니다. 각 VPC를 다른 모든 VPC에 피어링하여 전체 메시 피어링을 생성합니다. 또는 그들 사이에 VPN을 만들고 그에 따라 라우팅 테이블을 조정합니다.
- 21\. Amazon CloudFront의 배포에서 신속하게 항목을 삭제해야 하는 경우, 객체를 무효화한다. https://docs.aws.amazon.com/AmazonCloudFront/latest/DeveloperGuide/Invalidation.html
- 22\. MS SmoothStreaming 형식의 온디맨드 스트리밍 서비스 제공을 위해 CloudFront를 사용할 수 있다
- 23\. AWS CloudTrail은 단일 영역에서 수많은 트레일을 생성함으로써 예를 들어 보안 관리자는 모든 지역에 적용되는 추적을 만들고 하나의 키 관리 서비스 키를 사용하여 암호화를 구성할 수 있습니다. 개발자는 운영 문제를 해결하기 위해 한 지역에 적용되는 추적을 만들 수 있습니다.
- 24\. VPC 보안그룹의 기본측면 중 하나는 허용규칙은 지정할 수 있지만, 거부규칙은 지정할 수 없다. https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html
- 25\. CloudTrail 로그 파일에 SSE-KMS를 사용하면, Cloud trail 보안계층을 직접관리할 수 있다. 직접 관리 가능한 보안 계층을 제공하기 위해 CloudTrail 로그 파일 에 대해 AWS KMS 관리형 키(SSE-KMS)로 서버 측 암호화를 대신 사용할 수 있습니다.
- 26\. AWS CloudFormation의 변경에대한 알람을 알 수 있는 방법은 AWS SNS, AWS Config, AWS CloudFormation 이다
- 27\. RTMP 배포의 경우 Amazon CloudFront가 오리진 서버에서 객체를 요청할 때 요청을 오리진으로 전달하기 전에 모든 쿠키를 제거합니다. 오리진이 객체와 함께 쿠키를 반환하는 경우 CloudFront는 최종 사용자에게 객체를 반환하기 전에 쿠키를 제거합니다.
- 28\. 많은 수의 승인된 사용자만 CloudFront 배포에서 제공하는 파일에 접근하게하려면 signed cookie를 사용하거나 버킷정책을 오직 CloudFront OAI로만 구성한다.
- 29\. ENI는 AZ내에서만 이동할 수 있다. 새로운 인스턴스를 사용하려면, 대기 인스턴스의 보조ENI를 생성하고 DB의 보안그룹을 연결합니다.
- 30\. AWS DirectConnect의 CrossConnect단계를 실행하려면, 연결요청 후 72시간 이내에 LOA-CFA 를 AWS로부터 받아야한다.
- 31\. 인스턴스의 메타데이터에 엑세스하려면 아웃바운드, tcp 프로토콜, 80 port, 목적지 169.254.169.254를 허용해야한다.
- 32\. Adobe Flash 멀티미디어 콘텐츠는 UDP 이기때문에, HTTP,HTTPS를 지원하는 CloudFront로 배포할 수 없다
- 33\. Route53은 Geolocation과 GeoProximity을 기반으로 라우팅을 제공할 수 있다.
- 34\. AWS CloudFormation 템플릿에서는 사용자 지정 리소스를 통해 AWS에서 제공하지않는 리소스를 사용할 수 있다. 따라서 IPAM 같은 리소스를 사용할 수 있다.
- 35\. 비즈니스는 225개의 모바일 및 데스크톱 디바이스와 300개의 파트너 VPN을 위한 AWS VPC에 액세스해야 합니다. VPN 사용자는 서로 통신할 수 없어야 합니다.
    - 단일지역의 하나의 VPC는 하나의 VGW랑 연결되며 Site-to-String VPN의 상한수는 50개이다
    - Amazon EC2 인스턴스 VPN을 사용합니다. VPN 인스턴스의 기능을 사용하여 라우팅 및 연결을 제한합니다.
- 36\. AWS Config는 규정(compliant)을 준수하지않는 리소스에 대해서 SNS알람을 사용자에게 보내고, 리소스를 비준수(non-compliant)로 표기합니다. 리소스의 사용여부는 사용자가 이후 결정합니다.
- 37\. CloudFront Resource에 적합한 사람이 접근하게하려면, signed URL 또는 signed Cookie를 사용하는것입니다.
- 38\. CIDR 블록 33.16.0.0/16의 보조 CIDR 블록이 될 수 있는 서브넷은 33.17.0.0/16과 100.70.0.0/17 입니다. https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html#add-cidr-block-restrictions
- 39\. 기존 VPC를 사용하고 Amazon S3 엔드포인트가 있는 프라이빗 서브넷에서 Amazon EMR을 구성합니다. IGW와 NAT Gateway를 사용할 필요가 없다
- 40\. 10.0.0.0/16의 CIDR 블록의 DNS주소(Amazon Route 53 Resolver)는 169.254.169.253과 10.0.0.2 이다
- 41\. 클러스터 배치 그룹은 단일 가용 영역 내 인스턴스의 논리적 그룹입니다. 클러스터 배치 그룹은 동일한 리전의 피어링된 VPC에 걸쳐 있을 수 있습니다. 배치 그룹은 병합할 수 없습니다.
- 42\. 어떤 디자인이 백엔드 인스턴스를 가능한 한 적게 공개할까요?
    - ALB용 퍼블릭 서브넷, 웹 티어용 프라이빗 서브넷, 애플리케이션 티어용 프라이빗 서브넷이 있는 VPC. 애플리케이션 계층은 VPC 엔드포인트를 통해 DynamoDB를 연결합니다.
- 44\. Route Table에는 default로 50개의 경로설정이 가능하고, 최대 1000개 까지 증가시킬 수 있지만 관리가 잘 안될 수 있다. BGP를 사용하는 Routetable은 default가 100개이다. 
    - https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html
- 45\. RDS의 서브넷 그룹에는 2개가 있어야 HA(고가용성) 이 보장된다
- 46\. 거의 실시간에 가까운 IDS(침입 탐지 시스템) 솔루션을 사용하고 있습니다. 즉시 시스템을 구현하는 방법은 Amazon GuardDuty 활성화입니다
    - Amazon GuardDuty with network intrusion detection systems (IDS) on threat detection of network layer attacks.
- 47\. 1Gbps의 속도로 AWS Direct Connect 연결을 최근에 설치했습니다. Direct Connect 위치와 포트 간의 교차 연결을 주문
    - 1-Gbps Single Mode Fiber Interface, 802.1Q VLAN, Peer IP Address, BGP Session with MD5.
- 49\. AWS Marketplace에서 배포한 타사 VPN 솔루션
    - AWS 기반 하드웨어 VPN에는 암호 변경/키 회전 및 인증서 기반 인증 기능이 없기 때문에 정답은 B입니다. AWS Marketplace에서 제공되는 타사 VPN 소프트웨어에서 이러한 고급 VPN 기능을 가져와 모든 지역의 EC2 인스턴스에 설치할 수 있습니다.
- 50\. CloudFront가 최종 사용자에게 반환할 응답 본문의 최대 크기는 30GB입니다

- memo
- 예를 들어 com에 대한 장애 조치 레코드를 구성합니다. 기본 별칭 레코드가 latency.example.com을 가리키고 평가 대상 상태 설정을 활성화합니다. 보조 레코드가 Amazon S3에서 호스팅되는 정적 HTML 유지 관리 페이지를 가리키도록 합니다.
- IPAM : IP 주소관리도구
- 43 ???
- OSI 7 Layer에서 One-to-One Mapping은 불가능하다
- jq -r ???
- RIRs ???

---

###
- Reference : udemy