
### AmazonWAF

- AWS WAF는 Amazon으로 전달되는 HTTP 및 HTTPS 요청을 모니터링할 수 있는 웹 애플리케이션 방화벽입니다.
```
요청이 시작되는 IP 주소
요청이 시작되는 국가
요청 헤더 값
요청에 나타나는 문자열 (특정 문자열 또는 정규식 패턴과 일치하는 문자열)
요청 길이
악성일 가능성이 있는 SQL 코드의 존재(SQL 명령어 주입이라고 알려짐)
악성일 가능성이 있는 스크립트의 존재(교차 사이트 스크립팅이라고 알려짐)
```
- 빈번하게 DDoS 공격을 받기 쉬운 경우 Shield Advanced가 제공하는 추가 기능을 구입하는 것이 좋습니다.
- 요청이 시작된 IP 주소 또는 쿼리 문자열의 값과 같이 사용자가 지정하는 조건에 따라 보호된 리소스와 연결된 서비스는 요청된 콘텐츠 또는 HTTP 403 상태 코드 (사용 권한 없음) 로 요청에 응답합니다.

---

## Network Security on AWS

# Agenda

### 어떤 공격이 있을까?
- L7 : SQL injection, exploit code, malware
- L4 : Port scanning, DDoS, Flag, manipulation

### 어떤 공격에 대해 방어해주는 서비스가 있을가?
> 기능이나 커버리지가 겹칠 수 있지만, 다른 use-case에 활용되고, 상호보완적인 역활을 할 수 있다

- DDoS 방어 : AWS Shield
- 어플리케이션 위협보호 : AWS WAF
- 네트워크 방화벽 : AWS Network Firewall
- 네트워크 접근제어 : AWS SG & NACL
- 네트워크 격리 : AWS VPC

### AWS WAF
- 정의 : Web Application Firewall (WAF)
- 특징
    - 1\. WebACL 생성 후 
    - 2\. 서비스 연결 (API Gateway, Cloudfront, Application Load Balancer)
    - 3\. 규칙(차단/허용) 우선순위 설정
        - Amazon managed Rule
            - Core Ruleset : OWASP Top 10 및 CVE
            - Admin Protection : 외부에 노출된 어드민 페이지에 대한 엑세스 차단
            - Known Bad Inputs : 알려진 취약성 악용 요청 차단
        - Custom Rule
            - 헤더, HTTP 메서드, 바디, 쿼리 문자열, 파라미터
            - IP, Region, 문자열, 크기, 정규식 패턴 적용가능
        - AWS Marketplace

### AWS Network Firewall
- 정의 : VPC를 위한 managed 형 네트워크 방화벽 및 IDS/IPS서비스
- 특징
    - 높은 가용성과 자동 확장성
    - Stateless & Stateful Rull
    - 웹 도메인 필터링
    - 위협 탐지 및 방지
    - Alert 와 flow logs
    - 중앙 집중식 관리와 가시성
- 차이점
    - SG & NACL
        - SG & NACL은 인스턴스와 서브넷 단위로 흐름을 검사하지만, AWS NetworkFirewall은 VPC 내 모든 흐름을 검사한다
    - WAF
        - WAF는 L7에 대해서만 적용됬지만, AWS NetworkFirewall은 Layer3~7에 상호보완적으로 적용된다.
        - WAF는 인터넷에서 어플리케이션으로 인입되는 트래픽에만 적용됬지만, AWS NetworkFirewall은 아웃바운드도 체크하기때문에 Internal threat 에도 활용가능하다
    - Traffic monitoring
        - ENI 수준에서 작동했지만, AWS NetworkFirewall은 VPC 내 모든 흐름을 검사한다
        - Out of band 구성에 비동기지만, AWS Networkfirewall은 인라인 및 동기식 동작을 한다.
- 구성
    - 1\. Rule Group 생성
    - 2\. Firewall policy 생성
    - 3\. Firewall Subnet 생성
    - 4\. Firewall 생성
    - 5\. Routing Table 편집
