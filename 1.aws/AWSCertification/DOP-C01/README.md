
# DOP-C01

## INDEX
- [AWS OPSWORKS STACKS](#aws%20opsworks%20stacks)
- Section3 : SDLC Automation
    - [CODECOMMIT](#codecommit)
    - [CODEPIPELINE](#codepipeline)
    - [JENKINS](#jenkins)
- Section4 : Configuration Management and IaaS
    - [CLOUDFORMATION](#CloudFormation)
    - [ELASTICBEANSTALK](#ElasticBeanstalk)
    - [LAMBDA](#lambda)
    - [OPSWORK](#opswork)
    - [ECS](#ecs)
- Section5 : Monitoring and Logging
    - [CloudTrail](#cloudtrail)
    - [CloudWatch](#cloudwatch)
    - [X-RAY](#x-ray)
    - [ELASTICSEARCH](#ElasticSearch)
    - [TAGGING](#tagging)
- Section6 : Policies and Standards Automation
    - [AWS Systems Manager](#ssm)
    - [AWS Config](#config)
    - [AWS Inspector]
    - [AWS Health]
    - [AWS Trusted Advisor]
    - [AWS Macie]
- AWS 공인 DevOps 엔지니어 전문 실습 시험
    - [TEST1](#test1)
- [용어정리](#용어정리)

DynamoDB 테이블의 RCU 및 WCU 증가 는 올바르지 않습니다.
---

#### codecommit
> cheatsheet : 
- https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-permissions-reference.html
- https://docs.aws.amazon.com/codecommit/latest/userguide/auth-and-access-control-iam-identity-based-access-control.html
- https://docs.aws.amazon.com/codecommit/latest/userguide/pull-requests.html

- AWS 관리형 정책
> AWS 관리형 정책은 수정할 수 없습니다. 권한을 사용자 지정하기 위해 IAM 역할에 거부 규칙을 추가하여 이러한 정책에 포함된 특정 기능을 차단할 수 있습니다.

    - AWSCodeCommitFullAccess
        - CodeCommit에 대한 전체 액세스 권한을 부여합니다. 이 정책은 리포지토리 삭제 기능을 포함하여 AWS 계정의 CodeCommit 리포지토리 및 관련 리소스에 대한 전체 제어 권한을 부여하려는 관리자 수준 사용자에게만 적용해야 합니다.
    - AWSCodeCommitPowerUser
        - 사용자가 CodeCommit 리포지토리를 삭제하거나 Amazon CloudWatch Events와 같은 다른 AWS 서비스에서 리포지토리 관련 리소스를 생성 또는 삭제하는 것을 허용하지 않는다는 점을 제외하고 CodeCommit 및 리포지토리 관련 리소스의 모든 기능에 대한 액세스를 허용합니다. 대부분의 사용자에게 이 정책을 적용하는 것이 좋습니다.
    - AWSCodeCommitReadOnly
        - 다른 AWS 서비스의 CodeCommit 및 리포지토리 관련 리소스에 대한 읽기 전용 액세스 권한을 부여할 뿐만 아니라 자체 CodeCommit 관련 리소스(예: IAM 사용자가 액세스할 때 사용할 Git 자격 증명 및 SSH 키)를 생성 및 관리할 수 있는 기능을 부여합니다. 저장소). 리포지토리의 내용을 읽을 수 있지만 내용을 변경할 수는 없는 권한을 부여하려는 사용자에게 이 정책을 적용해야 합니다.

#### aws opsworks stacks
> Chef를 사용하여 운영 자동화
- OpsWorks Stacks에서는 예약된 일정이나 트래픽 수준 변화에 따라 서버 자동 확장을 설정할 수 있으며, 환경 규모 변화에 따라 수명 주기 후크를 사용하여 변경 사항을 조정합니다.
- Chef Solo로 Chef 레시피를 실행하면 패키지, 프로그래밍 언어, 프레임워크 설치, 소프트웨어 구성 등의 작업을 자동화할 수 있습니다.

### ElasticBeanstalk
> .ebextensions : https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/ebextensions.html

> cheatsheet : https://tutorialsdojo.com/aws-elastic-beanstalk/?src=udemy

> (*) Choosing a deployment policy : https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.deploy-existing-version.html

- deployment policy
    - All at once
        - downtime O
    - Rolling
        - 버킷 사이즈를 설정하고, 해당 사이즈만큼 v2 배포가 완료될경우 다음 배포를 진행
    - Rolling with additional Batch
        - 임시로 v2의 인스턴스 생성 및 배포를 진행. 이후 Rolling 배포를 진행. 완료 시 임시 인스턴스를 삭제한다.
        - Additional low cost
    - Immutuble
        - 새로운 v2의 tempASG를 만든 뒤, v1의 기존 ASG에 합치고 v1의 인스턴스를 삭제한다
        - Additional high cost
- EB CLI
     - eb : 모든 명령어
        - 1) create project
            ```
            mkdir HelloWorld
            cd HelloWorld
            eb init --profile aws-devops
            - select a default region
            - Enter a Application name
            - Select a platform
            - Select a platfrom version
            .elasticbeanstalk/config.yml
            eb create dev-env
            ```
    - eb status : status와 health 확인가능
    - eb health --refresh : 10초마다 갱신
    - eb logs : access_log 등
    - eb deploy : zip to s3
    - eb terminate 
- Saved Configurations
    - > region을 옮겨도 import해서 사용가능
        - eb config save dev-env --cfg initial-configuration
            .elasticbeanstalk/savedConfig/initial-configuration.yml
        - eb setenv ENABLE_COOL_NEW_FEATURE=true
        - eb config save dev-env --cfg prod // 현재 currentEnv에 적용
        - eb config put prod // AWS Console에 저장
- .ebextenions for configs
    - option_settings로 시작
    - 해당 폴더에 config를 넣고, delpoy하면 config가 확장됨
- .ebextenions for resource
    - 특정이름을 지정하지않고, type을 지정하면 랜덤으로 지정
    - {} = 싱글쿼트 + 백틱
        ```
        `value : { "Ref" : "NotificationTopic"}`
        `value : '`{Ref" : "NotificationTopic}`'`
        ```
    - /opt/elasticbenastalk/bin/get-config environment | jq
    - /opt/elasticbenastalk/bin/get-config optionsettings | jq
    - /opt/elasticbenastalk/bin/get-config NOTIFICATION_TOPIC | jq
- RDS in or out of environment
    - dynamoDB 테이블은 신규생성해서, EB 콘솔에서 추가해야함
    - config등에 추가해서 삭제되면 날라가기때문에 그런듯
- .ebextenions for commands & container
    - database_migration은 1대만 가능 (10대에서 진행된다면 이상)
    leader_only : true
- good features to know
    - application level을 rollback할 수 있음
    - managed updates를 on설정해서 minor를 주기적으로 자동할수있음
- Rolling Updates Hands On
    - immutable
- Swap URL (BLUE/GREEN)
    - Environments - Actions - Swap environment URLs - route53 CNAME Changes each ohter
- Worker Environments
    - do long running job
        - workerQueue
        - workerDeadLetterQueue
    - cron.yaml
- Multi Docker Integration
    - Web server Environments
        - Platfrom
            - Docker
            - Multi-container Docker
                - dockerrun.aws.json
        - aws ecs
            - cluster
    
### lambda
    - Security, Environment Variables, KMS and SSM
        - kms
            - os.environ['key']
        - ssm
            - secureString
        - secretManager
    - Versions, Aliases and Canary Routing
        - Versions Immutable
        - Version = code + configuration
        - $LATEST = Mutable
    - SAM Framework
        - SAM CLI
        - sam init --runtime python3.7
        - ./sam-app
        - template.yaml
        - sam build
        - sam local invoke
        - sam local start-api
    - SAM and CodeDeploy

### jenkins
> hands-on : https://aws.amazon.com /ko/getting-started/hands-on/setup-jenkins-build-server/)
- Stack for CICD
    1. Code (AWS CodeCommit)
    2. Build / Test (AWS CodeBuild)
    3. Deploy (AWS CodeDeploy)
    4. Provision (AWS CloudFormation)
- example
    - Jenkins with CodePipeline
    - Jenkins with ECS
    - Jenkins with Device Farm
    - Jenkins with AWS Lambda

### CloudFormation
> hands-on : https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-ec2-instance.html

> AWS resource Reference : https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-template-resource-type-ref.html

> cheatsheet : https://tutorialsdojo.com/aws-cloudformation/?src=udemy

- AWS 및 서드파티 리소스를 프로비저닝 및 관리할 수 있는 코드형 인프라(IAC) 서비스
- Declarative programming (no need to figure out ordering and orchestration)
- Deleting a stack deletes every single artifact that was created by
CloudFormation.
- HOW TO CREATE TEMPLATE
    - Editing templates in the CloudFormation Designer
    - Editing templates in a YAML file
- Templates components (one course section for each):
    1. Resources: your AWS resources declared in the template (MANDATORY)
        - What are resources?
            - AWS::aws-product-name::data-type-name
            - Resources are declared and can reference each other
    2. Parameters: the dynamic inputs for your template
        - What are parameters?  
            - Some inputs can not be determined ahead of time
                - !Ref : Parameters can be used anywhere in a template
                - pseudo parameters
                    ```
                    AWS::AccountId : 1234567890
                    AWS::NotificationARNs : [arn:aws:sns:us-east-1:123456789012:MyTopic]
                    AWS::NoValue : Does not return a value.
                    AWS::Region : us-east-2
                    AWS::StackId : arn:aws:cloudformation:us-east-
                    1:123456789012:stack/MyStack/1c2fa62
                    0-982a-11e3-aff7-50e2416294e0
                    AWS::StackName : MyStack
                    ```
    3. Mappings: the static variables for your template
        - What are mappings?
            - fixed variables within your CloudFormation Template
    4. Outputs: References to what has been created
        - You can also view the outputs in the AWS Console or in using the AWS CLI
        - You can’t delete a CloudFormation Stack if its outputs are being referenced by another CloudFormation stack
        - What are outputs?
            - Export
            - ImportValue
    5. Conditionals: List of conditions to perform resource creation
        - What are conditions used for?
            ```
            !And
            !Equals
            !If
            !Not
            !Or
            ```
    6. Metadata

- DeletionPolicy
    - what happens when the CloudFormation template is deleted
        - DeletePolicy=Delete (default behavior):
            - Note: for AWS::RDS::DBCluster resources, the default policy is Snapshot
            - Note: to delete an S3 bucket, you need to first empty the bucket of its content
        - DeletionPolicy=Retain:
        - DeletionPolicy=Snapshot:
            - EBS Volume, ElastiCache Cluster, ElastiCache ReplicationGroup
            - RDS DBInstance, RDS DBCluster, Redshift Cluster
- cfn-init
- cfn-signal & wait conditions
- /var/log/cloud-init-output.log
- /var/log/cfn-init.log

### codepipeline
> cheatsheet : https://tutorialsdojo.com/aws-codepipeline/
- Code / Build / Test / Deploy / Provision 등의 Stage로 구성된 workflow를 Orchestrate해주는 Continuos Delivery 서비스이다. 각각의 Stage는 sequential 할수도있고, parallel 할 수 있다.
- CodePipeline provides support for six types of actions:
    - Source
    - Build
    - Test
    - Deploy
    - Approval
    - Invoke
- runOrder조치 의 기본값 은 1입니다. 값은 양의 정수(자연수)여야 합니다. 분수, 소수, 음수 또는 0은 사용할 수 없습니다. 병렬 작업을 지정하려면 병렬로 실행하려는 각 작업에 대해 동일한 정수를 사용합니다.


### cloudtrail
- doc
    - https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-log-file-validation-cli.html
    - https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-receive-logs-from-multiple-accounts.html
    - https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-sharing-logs.html

### cloudwatch
- doc
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Metric
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/metrics-collected-by-CloudWatch-agent.html#linux-metrics-enabled-by-CloudWatch-agent
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Counting404Responses.html
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions.html
    - https://aws.amazon.com/blogs/big-data/power-data-ingestion-into-splunk-using-amazon-kinesis-data-firehose/
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/SubscriptionFilters.html#FirehoseExample
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/Create-CloudWatch-Events-CloudTrail-Rule.html
    - https://docs.aws.amazon.com/AmazonS3/latest/user-guide/enable-event-notifications.html




### x-ray
> 서버리스 어플리케이션 분석 및 디버그 도구
- doc 
    - https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html
    - https://aws.amazon.com/blogs/devops/using-amazon-cloudwatch-and-amazon-sns-to-notify-when-aws-x-ray-detects-elevated-levels-of-latency-errors-and-faults-in-your-application/
- created : cloudformation - stack 
- serviceMap에 연결된 서비스들을 drillDown 해서 src에서 dst까지 이상여부 확인가능
- 예외나 에러내용을 볼 수 있음
- CloudWatch와 차이점 ? : Metric과 log 가 없음
- x-lay에서 데이터를 뽑으려면 API를 사용해야함

### ElasticSearch
- doc 
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/CWL_ES_Stream.html
- use-case
    - Log Analytics
    - Real Time application monitoring
    - Security Analytics
    - Full Text Search
- composition
    - elasticSearch
        - provide search
        - indexing capability
    - kibana
        - more powerful
        - realtime dashboard
        - like CloudWatch
    - logstash
        - Log ingestion
        - like CloudWatch logs
- BP
    - cloudwatchlogs -> subscription filters -> lambda -> elasticSearch
    - cloudwatchlogs -> subscription filters -> kinesis firehorse -> elasticSearch
    - DynamoDB Table -> Dynamo Stream -> lambda -> elasticSearch
- if test is overed, deleted scope
    - es
    - subscription filters
- Tagging
    - https://aws.amazon.com/answers/account-management/aws-tagging-strategies/

### ssm
- how to use
    - install a SSM agent
- action
    - Run command
    - shutdown ec2
    - create ami
    - session and patch manager
    - parameter store
- cli
    - `sudo systemctl status amazon-ssm-agent`
- prefix
    - hybrid instanse -> hi
    - instatnce -> i

- resourceGRoup
    - tag based
        - developmentEC2Group
        - ProductEC2Group
    - cloudFormation based
- Run Command
    - Documents type :
        - Command
            - AWS-UpdateSSMAgent
            - AWS-RunShellScript
                - target과 persentage 두 가지 선택가능
                - error threshold를 위한 개수설정 가능
                - aws cli 코드얻을 수 있음
                - linux, window 두개 혹은 개별적용 가능
        - Automation
        - Policy
        - Session
- Parameter Store
    - Parameter details
        - Type : SecureString
        - KMS key source
    - `aws ssm get-parameters`
        - path와 --recursive 옵션으로 모두 가져올 수 있음
        - --with-decryption 으로 복호화
        - --names로 값 가져올 수 있음
- Patch Manager
- Inventory
- Automation
    - feature
        - createImage
        - stopInstance
    - aws-update-api
        - cloudFormation
            - stack
                - AutomationServiceRole
                - MangedInstanceProfile -> use
                - ManagedInstnaceRole
    - ami-hardning-process
    - session manager
        - instance 접속 history 확인 및 기록하도록 설정가능

### config
    - s3 에 저장가능
    - json 형태로 저장가능
    - 하나당 1달러 비용듬
    - 전체 리소스가 다보임
    - Resource Compliance status
    - Aggregators
        - multi account
        - Authorization

### 서비스 카탈로그
    - 클라우드포메이션 템플릿과 연관
    - 포트폴리오란 용어

### ecs
> cheatsheet : https://tutorialsdojo.com/amazon-elastic-container-service-amazon-ecs/

### route53
> cheatsheet : https://tutorialsdojo.com/amazon-route-53/
- https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-types.html
- https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/health-checks-types.html
- https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-router-firewall-rules.html

### DynamoDB
> cheatsheet : https://tutorialsdojo.com/amazon-dynamodb/
- https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.KCLAdapter.html
- https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html

---

### test1

- 파이프라인 모범사례
    - https://docs.aws.amazon.com/codepipeline/latest/userguide/best-practices.html
- 파이프라인 모니터링
    - https://docs.aws.amazon.com/codepipeline/latest/userguide/detect-state-changes-cloudwatch-events.html

- Lambda 함수를 사용자 지정 리소스와 연결하면 사용자 지정 리소스가 생성, 업데이트 또는 삭제될 때마다 함수가 호출됩니다.
- AWS CloudFormation은 Lambda API를 호출하여 함수를 호출하고 모든 요청 데이터(예: 요청 유형 및 리소스 속성)를 함수에 전달합니다.
- AWS에서 시작한 이벤트나 유지 관리는 Personal Health Dashboard를 통해 알 수 있다. CloudTrail과 AWS Config는 알 수 없다.
-  RDS 읽기 전용 복제본은 독립 실행형 DB 인스턴스가 되기 위해 필요할 때 승격될 수도 있습니다.
- 원본 데이터베이스의 데이터를 다른 AWS 리전으로 비동기식으로 복제하는 읽기 전용 복제본을 다른 AWS 리전으로 시작하는 것입니다.
- 교차 리전 스냅샷을 사용하면 스냅샷을 완료하는 데 몇 시간이 걸릴 수 있기 때문에 가장 낮은 복구 시간과 가장 적은 데이터 손실을 제공하지 않기 때문에 잘못된 것입니다.
- ELB는 Route53와 달리 다른 AWS 리전에 트래픽을 분산할 수 없다.
- AWS Opsworks Stack의 경우, Linux 스택에서는 시간 기반 인스턴스와 로드 기반 인스턴스가 모두 지원되지만 Windows 스택에서는 시간 기반 인스턴스만 지원됩니다.
- Packer와 같은 오픈 소스 머신 이미지 생성 도구가 있다.
- EBS 볼륨 스냅샷을 사용하여 기술적으로 AMI를 생성할 수 있지만, AWS Systems Manager Automation을 사용하여 AMI를 생성하는 것이 더 적합한 솔루션
- AWS System Manager Automation은 사용자 지정 워크플로를 생성하거나 AWS에서 유지 관리하는 사전 정의된 워크플로를 사용합니다.
- Amazon ECS를 사용하면 민감한 데이터를 AWS Secrets Manager 암호 또는 AWS Systems Manager Parameter Store 파라미터에 저장한 다음 컨테이너 정의에서 참조하여 민감한 데이터를 컨테이너에 주입할 수 있습니다.
- secrets에 설정할 환경 변수의 이름과 컨테이너에 표시할 민감한 데이터가 포함된 Secrets Manager 시크릿 또는 Systems Manager Parameter Store 파라미터의 전체 ARN을 지정합니다.
- AWS Secrets Manager는 수명 주기 동안 데이터베이스 자격 증명, API 키 및 기타 비밀을 쉽게 교체, 관리 및 검색할 수 있습니다. AWS 클라우드, 타사 서비스 및 온프레미스의 리소스에 액세스하는 데 사용되는 보안 암호를 보호하고 관리할 수 있습니다. 구성 및 비밀에 대한 단일 저장소를 원하는 경우 Parameter Store를 사용할 수 있습니다. 수명 주기 관리가 포함된 전용 비밀 저장소를 원하는 경우 Secrets Manager를 사용하십시오.
- AWS Systems Manager Parameter Store는 Secrets Manager와 달리 수명 주기 관리 및 키 교체가 있는 전용 스토리지를 제공하지 않습니다.
- 중요한 자격 증명을 S3에 저장하지 않는 것이 좋기 때문입니다.
- Docker Secret을 사용하여 민감한 데이터베이스 자격 증명을 보호할 수 있지만 이 기능은 Docker Swarm에만 적용됩니다.
- 각 서비스 엔드포인트에 대한 비 별칭 레코드에 대해 Route 53에서 상태 확인을 설정합니다. Route 53이 상태 확인에 지정된 엔드포인트로 요청을 보낼 수 있도록 네트워크 액세스 제어 목록과 라우팅 테이블을 구성합니다.
- 장애 조치 라우팅 정책 구성을 사용합니다. AWS 리소스로 트래픽을 라우팅하는 별칭 레코드를 Route 53에서 설정합니다. Evaluate Target Health옵션을 로 설정한 Yes다음 필요한 모든 비별칭 레코드를 생성합니다.
- CodeBuild에는 멀티 프로세싱 옵션이 없기 때문에 올바르지 않습니다. CodeBuild에는 다중 처리 같은 것이 없습니다.
- CodeBuild의 로컬 캐시를 사용하면 빌드 프로세스를 가속화하는 데 도움이 될 수있다.
- Kinesis 클라이언트 라이브러리(KCL)를 사용하여 Kinesis Data Streams용 애플리케이션을 작성할 수 있습니다. DynamoDB Streams Kinesis 어댑터를 사용하여, DynamoDB 스트림의 레코드를 사용하고 처리할 수 있습니다.
- Amazon Inspector 평가를 실행하려면 EC2 인스턴스에 사용자 지정 태그를 추가해야 합니다.
- 데이터베이스 업그레이드가 실패하면 장애 조치로 사용할 수 있는 읽기 전용 복제본이 없기 때문에 전체 시스템을 사용할 수 없기 때문입니다.
- AllowMajorVersionUpgrade속성은 주요 버전 업그레이드가 허용되는지 여부를 나타내는 값일 뿐입니다.
- RDS 다중 AZ 인스턴스에 대한 데이터베이스 엔진을 수정할 때 전체 다중 AZ 배포에 대한 데이터베이스 엔진이 업그레이드 중에 종료된다는 점을 기억하십시오.

---

### 용어정리
- OVF(Open Virtualization Format)
- guestfish 대화형 셸
- virt-rescue 셸
- 골든 Amazon 머신 이미지(AMI)

---

### Refernece
    - aws-demos