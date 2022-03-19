# 1.AWS
Amazon Web Service for me.

### Reference
#### 커뮤니티
- [AWS Certified Global Community](https://aws-certification.influitive.com/forum/)
- [The Official AWS Podcast](https://aws.amazon.com/ko/podcasts/aws-podcast/?sc_icampaign=aware_aws-podcast&sc_ichannel=ha&sc_icontent=awssm-2021&sc_iplace=blog_tile&trk=ha_awssm-2021&podcast-list.sort-by=item.additionalFields.EpisodeNum&podcast-list.sort-order=desc&awsf.episode-type=*all&awsf.tech-category-filter=*all&awsf.product-filter=*all&awsf.industry-filter=*all)
- [AWS Gear Store](https://www.sunriseidcart.com/AWS/default.aspx)
- [AWS Resume][https://www.hiration.com/blog/aws-resume/]

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