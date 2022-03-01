
# ANS-C00
> AWS Certified Advanced Networking Specialty

---

## INDEX
- Section3 : Amazon VPC fundamentals
- Section4 : Additional VPC Features
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
        
- Section5 : VPC and DHCP
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
- Section6 : Network Performance and Optimization
- Section7 : VPC Connectivity - VPC Peering
- Section8 : VPC Connectivity - Transit Gateway
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

### 
---