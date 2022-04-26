# 1.AWS
Amazon Web Service for me.

### Reference
#### 커뮤니티
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

elb
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

```
