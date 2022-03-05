
# ANS-C00
> AWS Certified Advanced Networking Specialty

하이브리드 클라우드의 DNS용 https://www.youtube.com/watch?v=_Z5jAs2gvPA를 시청하세요. Transit Gateway는 https://www.youtube.com/watch?v=9Nikqn_02Oc

---

## INDEX
- LECTURE
    - Section3 : Amazon VPC fundamentals
    - [Section4 : Additional VPC Features](#section4)
    - [Section5 : VPC and DHCP](#section5)
    - Section6 : Network Performance and Optimization
    - [Section7 : VPC Connectivity - VPC Peering](#section7)
    - [Section8 : VPC Connectivity - Transit Gateway](#section8)
    - Section9 : VPC Endpoints - VPC Gateway Endpoint
    - Section10 : VPC Interface endpoint and PrivateLink
    - Section11 : Hybrid Network basics
    - Section12 : AWS Site-to-Site VPN
    - Section13 : AWS Clint VPN
    - Section14 : AWS Direct Connect
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

---

### examtopics

---

###
- Reference : udemy