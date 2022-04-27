# 1.AWS
Amazon Web Service for me.

### Reference
#### 커뮤니티
- [AWS 포럼 repost](https://repost.aws/)
- [AWS Certified Global Community](https://aws-certification.influitive.com/forum/)
- [The Official AWS Podcast](https://aws.amazon.com/ko/podcasts/aws-podcast/?sc_icampaign=aware_aws-podcast&sc_ichannel=ha&sc_icontent=awssm-2021&sc_iplace=blog_tile&trk=ha_awssm-2021&podcast-list.sort-by=item.additionalFields.EpisodeNum&podcast-list.sort-order=desc&awsf.episode-type=*all&awsf.tech-category-filter=*all&awsf.product-filter=*all&awsf.industry-filter=*all)
- [AWS Gear Store](https://www.sunriseidcart.com/AWS/default.aspx)
- [AWS Resume](https://www.hiration.com/blog/aws-resume/]
- [AWS SlidesharePPT-1](https://www.slideshare.net/awskr/iac-aws-ausg-aws-community-day-online-2021)

#### 기본
- [AWS 프리티어 설명서](https://aws.amazon.com/ko/free/)
- [AWS 10분 자습서](https://aws.amazon.com/ko/getting-started/tutorials/?pg=ln&p=s3)
- [AWS 기반 프로젝트](https://aws.amazon.com/ko/getting-started/projects/?pg=ln&p=s3)
- [AWS 무료 교육 및 자격증](https://www.aws.training/)
- [AWS 한국백서](https://aws.amazon.com/ko/blogs/korea/ko-whitepapers/)
- [AWS 용어집](https://docs.aws.amazon.com/general/latest/gr/glos-chap.html)

#### 심화 및 실무적용
- [AWS와 Azure, Google비교](https://cloud.google.com/free/docs/aws-azure-gcp-service-comparison?hl=ko)
- [AWS Bastion Host에서 SSH 세션의 기록을 남기는 법 (How to Record SSH Sessions Established Through a Bastion Host)](https://aws.amazon.com/ko/blogs/security/how-to-record-ssh-sessions-established-through-a-bastion-host/)
- [Receive AWS Developer Tools Notifications over Slack using AWS Chatbot](https://aws.amazon.com/ko/blogs/devops/receive-aws-developer-tools-notifications-over-slack-using-aws-chatbot/)
- [How do I use webhooks to publish Amazon SNS messages to Amazon Chime, Slack, or Microsoft Teams?](https://aws.amazon.com/tw/premiumsupport/knowledge-center/sns-lambda-webhooks-chime-slack-teams/)

#### 사용사례 및 사용수준
![image](https://user-images.githubusercontent.com/20831981/148506377-f687aa56-d11e-4657-ab99-d1c2e490a697.png)   
![image](https://user-images.githubusercontent.com/20831981/148506397-4f0786be-cb26-4ce7-bc90-40e9e6e59ebb.png)

### AWS 클라우드 비용 최적화를 위한 모범 사례 - 정민정 매니저(AWS 코리아)
> https://www.youtube.com/watch?v=Ks0hJ2CTFsA

```
TCO는 Total cost of ownership의 약자로 AWS와 온프레미스을 운영할경우 총 비용 비교를 할 수 있는 개념이다.
크게 생각해볼 수 있는 비교대상은 네트워크,서버,스토리지,인건비를 떠올릴 수 있다. 간과할 수 있는 비용도 생기게되는데, 그것은 전기,항온항습 등이 있을 수 있다.
AWS는 필요한만큼 사용하고 지불하는 구조이기때문에 적합하다
클라우드 비용을 절감할 수 있는 5가지 방법이있다.

첫번째는 적절한 인스턴스 유형을 찾는것이다.
워크로드가 메모리 최적화가 필요할 수 도있고, 범용 컴퓨팅으로 사용될 수 도 있다.

두번째는 탄력성을 증가시키는 것입니다.
개발이나 테스트환경, non-production 인스턴스들을 사용하지않는 시간에 유휴시간을 적용하는 것입니다.
또한 오토스케일링을 적용해서 최대수요를 적용해서 운용하지않고, 최대수요를 대비해서 유연하게 운용할 수 있도록합니다.

세번째는 적합한 비용모델을 적용하는 것입니다
예를들면 1년 또는 3년 약정의 예약인스턴스나 일부시간에만 적용할 수 있는 스팟인스턴스를 적용하는 것입니다.
스팟인스턴스는 필요한 물리적요소 CPU, 메모리 등을 지정해놓은 스팟피드, 반드시 워크로드가 돌아야할 수 있는 시간을 설정하는 스팟블락 두 가지 개념을 적용할 수 있습니다.

네번째는 적합한 스토리지 유형을 사용하는 것입니다
전체파일들을 한달내내 접근한다면 스탠다드 유형을 사용하고,
한달의 20프로 혹은 40프로 기간동안만 접근한다면 IA (Infrequent access)유형을 사용해서 비용을 절감합니다

다섯번째는 이런부분들을 계속 측정하고 모니터링하는 것입니다
AWS TrustAdvisor나 AWS CostExplorer, AWS Budgets 등을 활용합니다.
비용최적화를 하기쉽지않은 이유는 리소스를 사용하는 것에 대한 대시보드,BI같은 가시성 확보와 제품에 대한 오너십 부족입니다.
```

### 아마존, 구글, 애플, 페이스북 실리콘밸리 기업 문화 / 스타트업 - 김동찬
> https://youtu.be/WNbBZXj1dkM
### '나는 아마존에서 미래를 다녔다' 저자 박정준
> https://youtu.be/gQby06293CM
### [실리콘밸리의 한국인 2019] '아마존과 나의 성장 이야기' 박정준 이지온 글로벌 대표
> https://www.youtube.com/watch?v=wJo9oCwP2kw

```
1. 아마존에서의 혁신은 무언가 효율적으로 하는것 또는 낭비를 줄이는 것이다
2. 아마존은 인터넷 시대의 첫날에 살고있다는 DAY 1 정신이있고, 건물이 있다.
3. 아마존은 플라이휠이라는 고객중심주의로 성장했다. 
4. 아마존은 실패를 해도 되는 문화를 지향했고 다음 사업에 실패할 수 있는 이커머스라는 안정적인 기반이 있었기때문에, 기존 시장에 없던 아이템인 AWS,킨들 등의 사업에서 성공할 수 있었다.
5. 5년뒤, 10년뒤 아마존이 어떤모습일가요?  5년뒤, 10년 뒤 아마존이 무엇을 할지 표현할 수있는단어는 존재하지않는다 - 제프 베조스-
6. 아마존은 나를 위협할 수 있는사람, 회사의 수준을 높일 수 있는 사람을 채용한다
```

### 클라우드 세상에서 살아남기2 “진화의시작 인프라 엔지니어에서 Ops엔지니어로” 이한주 대표이사베스핀 글로벌
> https://youtu.be/_CRrbEAGOTk

```
- devops는 툴이나 도구가 아니라 철학과 프로세스이다하나씩 하나씩 수동업무들을 자동화하게되서, 나중에 모이게되는 결과물이 devops이다.
- 클라우드는 손질되지않은 재료이다
- 클라우드IT는 devops + cloud + msa 이다
- 소프트웨어가 주도하는 회사
- 2018 년 엔터프라이즈 IT 시장은 2000조 였고, 3분의1이 개발, 3분의1이 구매, 3분의1이 인프라 비용이였다.
- devops, noops의 시대가 올 때, 어떤 행동을 취해야하는가
- 클라우드 컨설팅이란, 고객이 클라우드로 옮겨가는데 있어서 전략을 세우고,마이그레이션을 하게되고, 아키텍팅을 하는 등 로드맵을 만들어드리는 것입니다.
- 새로운 기술을 배우고 적용함에 있어서, 내 동료와 회사와 고객이 이익을 가져갈수 있는 것은 중요하다


```

### [아마존을 아는 사람, 모르는 사람] 03_"지루하게 성공한 직원은 불필요한 존재다"
> https://www.youtube.com/watch?v=Y6_8Vf9x_p4

```sh
# 실패한 서비스들
 -2007년 모바일송금서비스 웹페이
  시기가 너무 빨랐음
- 2014년 파이어폰, 파이어OS
  약 2000억 손실보고 중단
- 2015년 아마존 데스티네이션(호텔예약서비스)
- etc
    - 아마존 월렛
    - 아마존 로컬 레지스터
    - 아마존 로컬(부동산 서비스)

# 제프 베조스
큰 성공은 수십 번의 실패가 있어야한다
실패가 회사의 문화가 되도록 해야한다
실패할 작정을 하고 실험을 해야한다. 성공을 목표로 하면 거기서 멈춰버린다.
지루하게 성공한 직원들은 회사의 적이다

실패와 혁신은 쌍둥이입니다
이것이 우리가 끊임없이 실패에 도전하는 이유입니다.
나는 아마존을 가장 성공한 회사보다도 가장 편하게 실패할 수 있는 회사로 만들고자합니다
2016년 연례서한
```

### 아마존 혁신의 문화: Amazon Culture of Innovation - 김상필, AWS | AWS Builders 온라인 시리즈
> https://youtu.be/lm2gBt7J5so

```sh
# Amazon의 모토
지구 상에서 가장 고객 중심적인 회사가 되겠다

# 2016년 주주서한
고객들은 언제나 불만족스러워한다
(고객을 중심으로 놓고 해결책을 제시할 때, 기술을 도구로 삼는다)

# Invent & Simplify
리더들은 조직 내에서 지속적으로 혁신기회를 찾아내고
단순화하고 정립해서 다른 조직으로 전파해야한다.
내 아이디어에 집착하지말고, 외부에서도 새로운 아이디어를 얻어서 내재화해야한다.
혁신을 하고자할때는 이해받을 수 있기를 기대하지말고, 오랜시간동안 참아내야한다

# 고객관점의 Value Proposition
Price, Selection, Convenience

# Single threaded Ownership
상품의 기획, 연구개발, 운영, 피드백의 반영
한팀이 오너십을 가지고 책임을 져야한다
하나의 문제를 책임지고 해결할 수 있는 단일팀을 가져야
고객 중심적인 상품혁신이 빠르게 이루어질 수 있다는 철학
시작부터 끝까지 강력한 책임감을 가지게 된다

# 아마존이 집중하는 3가지
1. 경영 프로세스의 고객을 최우선 순위
2. 고객의 문제를 해결해주기 위해 혁신하고 발명
3. 인내심을 가지고 장기적인 것에 투자

```

### AWS 고객이 주로 겪는 운영 이슈에 대한 해법 - 이범석 테크니컬 어카운트 매니저(AWS 코리아), 조성열 클라우드 서포트 엔지니어(AWS 호주)
> https://youtu.be/b-whfv74tw4

```sh
AWS 서비스를 사용하면서 겪는 운영 이슈 발생 시
좋은 아키텍처의 요건
- 보안 -> private zone으로 db이동
- 안정성 -> elb -> a-zone -> c-zone
          master db - read replica
		  slave db
- 성능효율성 -> auto-scailing
- 비용최적화
- 운영우수성

아키텍처 관점에서 해결할 수 있는 방법
AWS 주요 서비스 사용 시 문제 해결방법
AWS Support 를 통한 지원

ec2
- 상태확인이슈
	- system status check
	  - 물리적 호스트 네트워크 연결, 전원중단 
	- instance status check
	  - 호환되지않는 커널
	  - 메모리 모두 사용
	  - 파일시스템 에러
	  - 리눅스는 커널 파라미터 파일 수정
	  - Windows : ec2rescue를 이용한 수정
	  - 루트 볼륨을 인스턴스에서 분리
	  - 다른 인스턴스에 데이터 볼륨으로 연결 후 설정 파라미터 변경
	  - 루트 볼륨 인스턴스에 연결
    - 인스턴스 스토어 데이터는 재시작 시 삭제
	- Cloudwatch take action 체크
- 자동재시작이슈
	- 예정된 이벤트  ?
	- ec2 console 이벤트
	- Personal Health Dashboard
	- syslog, dmesg
	- cloudtrail은 AWS에서 발생하는 API 콜을 모두 기록
- 생성이슈
- 접속이슈
	- ACL
	- SG
	- Route Table
		- VPC 바깥으로 나가는 트래픽이 0.0.0.0 모두 IGW로 나가는지 확인

asg
인스턴스 런칭, 터미네이팅, 재시작
- 인스턴스 생성
	- lanch configuration
		- security group
		- ec2 keypair
- Scale in/out
	- suspended 프로세스에서 launch-terminate 삭제
	- 마지막 scaling event로부터 cool down 시간이 안지남
		- OS부팅, 어플리케이션 배포
	- Complete-lifesycle-action 동작여부 확인
- cloudwatch alarm
	- Consecutive period 동안 연속으로 threshold를 넘어서야 알람이 울림

elb
- HTTP 5xx errors
  - 502 : bad gateway
    - header 값이 malformed 된 경우
    - elb가 백엔드 인스턴스로부터 응답을 못 받는경우
  - 503 : Service Unavailable
    - 인스턴스가 등록 안된경우
    - 모든 인스턴스가 unhealty 인경우
    - 짧은시간에 request가 급격히 들어오는경우 (수분 이내해결)
      - 예상된 피크 트래픽인경우, Pre-warming 신청
  - 504 Gateway timeout
    - 인스턴스 요청처리시간이 elb Timeout보다 큰 경우
      - laytency metric
        - CPU Utilization, DB나 외부API와 지연가능성 확인
      - 인스턴스가 elb의 요청을 닫을경우
        - keep alive timeout을 elb보다 높게설정
- Instance Out of service
- Health Check Failure
  - health check targetpage를 200 이 아닌 302 (Redirect) 반환 확인
  - health check timeout이 발생할경우, keep alive timeout 설정
```

### AWS IAM과 친해지기 (레벨 200) – 조이정:: AWS Builders Online Series
> https://www.youtube.com/watch?v=zIZ6_tYujts

iam은 인증과 인가를 관리하는 통합 엑세스 컨트롤 서비스
```
cdk
iac
script
cli,sdk
console

aws자원끼리 주고받는 요청과 응답도 모두 API형태
예를 들어보겠습니다
기본적으로 모든 aws api에는 자격증명이 포함되어있음
accesskey, secreyKey 형태를 띄고있다
비밀키는 노출되면안되므로, 비밀키를 가진사람만 생성할수있는
HMAC 서명값을 포함하게됩니다
iam role 과 같이 임시 Credential을 쓰는경우
Session Token이 추가됩니다
결과적으로 요청이 db에 도착하면
aws는 요청내용과 비교해서 서명과 비교하고
해당 타임 스탬프와 같은것을 확인하고
이 크레덴셜이 적절한 권한을 가진지 판단하고
허용을 결정하게됩니다

aws 보안이 강조하는 내용
쉐얼드 레스펀스빌리틴 ㅐ용이 나옵니다
aws와 고객이 함꼐 만들어나가는 중요과제입니다
데이터나 어플리케이션, 클라우드 위의 보안은 고객이 챙겨야합니다
aws가 제공하는 iam 서비스의 사용과 db 사용자
테이블 퍼미션같은 고객측 iam 구성등이 포함됩니다
보시는것처럼 사용하시는 awㄴ서비스의 추상화에 따라 범위가
달라지지만 iam은 늘 포함되는걸 보실 수 있습니다
iam구성은 고객이 하시게됩니다
aws는 고객이 구성하실수있또록 bp같은것들을 제공해드리고있습니다

iam은 aws 전반에 걸쳐 권한을 통제하는 시스템
인증과 인가로 나누어서 설명합니다
인증은 클라이언트가 자신이 주장하는 사용자와 같은 사용자인지 확인하고
인가는 클라이언트가 하고자하는 작업이 해당 클라이언트에게 허가된 작업인지를 확인하는 권한부여와
관련된 과정입니다

아이덴티티는 aws로 요청할 수 있는 보안주체를 aws 어카운트 내에
만들어주는 역활을 하고자하는
access management는 누가 어떤 리소스들에 대해
어떤 일을 할 수 있는 권한을 가지는지를 정의하는 도구로 동작을 하게됩니다

aws 계정을 생성한 고객은 계정을 생성할떄
사용한 이메일 계정과 동일한 루트 유저를 가지고있습니다
루트계정은 보안상 사용하기에는 취약한 계정
User/ROle같은 보안주체가있다
모든 보안주체는 aws에 api요청을 할 때
엑세스키, 시크릿키를 포함한 크레덴셜로 인증을 받는다
이중 iam 사용자는 장기 크레덴셜을 사용해서 서비스에
접근을 하는 보안주체입니다

iam role입니다. iam 사용자는 장기크레덴셜을 사용하고
자격증명이 영구적으로 지속되기떄문에, 서버에 하드코딩 등을
하는 행위는 위험합니다
Role은 자동으로 로테이션되는 임시자격증명을 사용하기 떄문에
장기 크레덴셜을 설정해서 사용하는것보다 안전하게
사용할 수 있습니다
임시 크레덴셜은 여기에 더해 일정시간이 지나면 마뇰되는 토큰이
같이 발급되서 사용합니다
이 역활 사용하는걸 어숨한다고 합니다
어숨을 하면 임시 크레덴셜을 발급받아 특정액션을 수행할 수있습니다
aws 서비스가 사용자 대신 권한을 수행하는경우가 있습니다
어플리케이션 통신이라고 할 수 있습니다
lambda가 s3에 접근해서 특정데이터를 가져온다던가
api 접근을 있을떄 role을 사용한다면
일정시간뒤에 timeout이 발생하는 임시 크레덴셜을 할 수있습니다
aws 외부에 조재하고있는 iam user가 아닌 보안주체에게
임시적으로 권한을 수행하기 위해 iam role을 사용할 수 있습니다saml이나 openIDC같은 연계 프로토콜을 사용해서
외부사용자를 iam role과 매핑해주게됩니다
다른 aws 어카운트에 접근할 때, cross account 상황에서도 ,role을 사용해서
안전한 접근이 가능합니다
두번쨰인가의 과정은 접근제어정책을 기반으로 이뤄집니다
aws 내에서 할수있는 액션은 json형태로 기술해놓은 퍼미션 문서이비다
api 호출은 매번 이 정책을 통해 인가됩니다
정책은 앞서 봤던 role이나 사용자나 aws 서비스 자체에
연결을 할 수가 있고, 아주 중요한 내용중 하나는 이 정책안에서는
다양한 액션들을 어떤 허용하고 어떤 차단하고 자유롭게 할수가있는대
가장 밑에 보이는것처럼 디폴트가 deny이고
명시적인 allow보다 명시적인 deny가 우선순위가 높기떄문에
이런 특성을 잘 이해하고 정책을 작성해야합니다
모든 요청은 인증과 인가의 과정을 거치게됩니다
보안주체의 서명값을 보고 요청을 처리할지 말지 결정하고
and조건으로 퍼미션 폴리시조건을 보고 권한을 확인하게됩니다
iam 정책을 더 들여다 보겠습니다
세트이트먼트안에 여러개의 정책을 기술할수있습니다
allow,deny의 효과를 가지게됩니다
액션안에 다양한 api를 기술할 수 있습니다
리소스안에는 해당 정책 영향권안에 어떤 aws 리소스가
들어갈지 정의할수있다 마지막으로 컨디션은 옵셔널한 부분이고
특정 조건에 대해서만 해당 정책이 유효하도록 설정할 수 있습니다
액션과 리소스안에 아스타리스 표시를 하면 모든 액션과 모든 리소스에 대해서 허용을 할 수있습니다.
사무실 nat ip를 조건을 기재하게되면 회사 네트워크 외부에서는 요청할 수 없도록 설정할 수 있습니다

보안주체가 접근할 aws자원에 할당하는 리소스 베이스드 정책
아이템 보안주체의 권한의 최대치를 규정하는 퍼미션 바운드리
멀티어카운트 환경에서 사용하는 오가니제이션에서 가드레일 역활로 사용하는 scp
세션정책,acl정책,앤드포인트 정책과 같이 특정 usecase에 사용되는 정책들

identity-based정책과 resource-based 정책의 커버리지는
동일 account인지 Cross account 환경인지 에 따라 달라집니다

접근을 하기위한 정책
접근을 받기위한 정책
양쪽에 다 기술한다면 겹칠수밖에없다
동일 어카운트라면 합집합의 형태로 요청검사가 이뤄진다
요청이 허용될테고
크로스어카운트환경에선느 공집합으로 이뤄집니다.
요청이 거부됩니다.
deny정책이 우선됨에 따라서 둘다 요청이 차단됩니다.

bp
aws 일반적인 관리 업무에서도 사용을 권장하지않습니다
1. 계정을 생성할 때
2. 첫번쨰 iam 사용자를 만들기 위해서
엑세스 키페어는 삭제를 하거나 비활성화하는 걸 권장
루트 로그인을 위해서는 MFA를 활성화하는 것을 권고
iam 사용자를 다수의 사용자들이 함께 공유하면안됩니다
하나의 iam 사용자를 만들어사용한다면, 보안사고나 문제가
발생했을 떄 누가했는지 확인이 어렵습니다
실제 사용자와 iam을 1:1 매핑합니다

iam group으로 관리포인트를 줄이고, 퍼미션 바운드리를 통해
그룹에 속한 iam 사용자가 가질 수 있는 max 권한을 제어합니다
사용자의 자격증명은 보안을 위해 주기적으로 교체합니다
크레덴셜 리포트를 통해 교체주기가 지난 iam 사용자의 자격증명을 파악해서
교체해야합니다

iam의 access advisor가있습니다
정책에 포함된 각 서비스를 실제 보안주체가 언제 마지막에 접근했는지 확인합니다
시간이 흐른 뒤 해당 보안주체가 거의 접근하지않은 서비스에 대해 알게되고
불필요한 권한이 무엇인지 알게됩니다
s3처럼 중요한 데이터가 담겨있는 서비스는 서비스가 아니라 액션단위로도
엑세스 어드바이저를 사용할 수 있습니다

iam role은 aws 사용자라면 끊임없이 사용하게되는
중요한 요소입니다
iam role을 부여하는 액션 자체에도 제어가 필요합니다
개발자에게 ec2 인스턴스를 시작할 수 있는권한과
iam 역활을 적용할 수있는권한 둘다 필요한대요
pass role이라고합니다
iam role은 크로스 어카운트에서도 중요한 역활을합니다

정책조건을 활용하는것이 좋습니다
여러개의 조건을 and, or로 할 수 있습니다

IAM 활동감사와 관련된 핵심서비스 몇가지를 소개하겠습니다
클라우드트레일은 api 로깅서비스 입니다
모든 감사활동에 있어 베이스 데이터가 됩니다
누가, 언제, 무엇을, 어디서, 어떻게 했는지 알수있음
문제가 발생했을 떄 이슈경위나 원인을 파악하고 트러블 슈팅을 위해서는
필수적인 서비스입니다

iam access analyer라는 기능이있습니다
public 혹은 cross-account-access 점검해서
외부 엔터티와 공유되는 리소스 예를들면 aws s3 버킷이나
iam 역활을 식별할 수 있습니다
anomality를 판별하기위해 로직기반추론을 사용하여 판단을 하고
커스텀 규칙을 통해 스캔결과에 대한 알림을 자동으로 받을 수 있도록 구성할 수 있습니다
가드듀티는 클라우드 위혐탐지서비스입니다
클라우드트레일이나 dns로그, vpc flow로그를 기반으로
다양한 해킹시도나 보안위혀블 탐지해주는 서비스입니다
 크게 ec2유형, s3유형,iam유형으로 나누게됩니다
 사용자가 빠르게 탐지하고 대응할수있또록 도와줍니다
 security hub는 다양한 aws서비스들을 통합해서
 aws환경 전반에 대한 보안 및 규정ㅈ ㅜㄴ수현황에 대한 정보를 제공하는
 통합 대시보드 서비스입니다
 iam 관련 보안 이슈를 포함한 다양한 이슈를 토합적으로 관리할 숭 ㅣㅆ습니다
 iam 정책에 대해 잘 이해하고 활용하시면
 기존의 역활기반이 아니라 리소스가 가진속성을 기반으로 접근제어를 할 수 있습니다
 RBAC을 통해 접근제어를 한다면, 리소스 접근제어를 할때 퍼미션 정책을
 모드 따로 관리해야합니다.
 애자일하게 확장된다면 관리적 문제가 발생합니다
 해당 문제가 발생한다면, 속성기간 abac으로 할수있습니다
 태그를 이용해서 단일 policy로 각기 다른 리소스에 재사용가능한 접근제어를 구상하는 방식을 사용할 수 있습니다
 정책의 인가과정이 정적인 리소스 arn을 통해 이뤄지는게 아니라보안주체가 가진 태그와 리소스의 태그가 일치하는지여부를
 보고 판단하기때문에 훨씬 동적인 권한관리가 가능해집니다
 프로젝트 태그별로 부여해서 접근할수있또록 한다면, 프로젝트에 리소스가 더해지더라도 업데이트하지않아도되는
 유용한 구성이 가능합니다
 
```