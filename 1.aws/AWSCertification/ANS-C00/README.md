
# ANS-C00
> AWS Certified Advanced Networking Specialty

---

## INDEX
- Section3 : Amazon VPC fundamentals
- Section4 : Additional VPC Features
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