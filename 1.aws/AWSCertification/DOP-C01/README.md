
# DOP-C01
> dop시험준비하기 : https://tutorialsdojo.com/aws-certified-devops-engineer-professional/?src=udemy

> aws공식DOP무료학습 : https://explore.skillbuilder.aws/learn/course/external/view/elearning/74/exam-readiness-aws-certified-devops-engineer-professional

> aws공식DOP문서 : https://aws.amazon.com/ko/certification/certified-devops-engineer-professional/

> examtopics시험문제 : https://www.examtopics.com/exams/amazon/aws-devops-engineer-professional/view/

---

## INDEX
- [AWS OPSWORKS STACKS](#aws%20opsworks%20stacks)
- Section1 : Course Overview - AWS Certified Devops
- Section2 : Code & Slides Download
- Section3 : SDLC Automation
    - [CODECOMMIT](#codecommit)
    - [CODEPIPELINE](#codepipeline)
    - [JENKINS](#jenkins)
- Section4 : Configuration Management and IaaS
    - [CLOUDFORMATION](#CloudFormation)
    - [ELASTICBEANSTALK](#ElasticBeanstalk)
    - [LAMBDA](#lambda)
    - [APIGateway](#apigateway)
    - [OPSWORK](#opswork)
    - [ECS](#ecs)
    - [KINESIS](#kinesis)
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
    - [SCP](#scp)
- Section6 : Incident and Event Response, HA, Fault Tolerance, DR
    - [ASG](#asg)
    - [DynamoDB](#dynamodb)
    - [MultiRegion](#multiregion)
    - [MultiAccount](#multiaccount)
    - [IAM](#iam)
- AWS 공인 DevOps 엔지니어 전문 실습 시험
    - [TEST1](#test1)
    - [examtopics](#examtopics)
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
> .ebextensions (AWS Elastic Beanstalk 구성 파일) : https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/ebextensions.html

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
            - Single-container Docker
            - Multi-container Docker
                - dockerrun.aws.json
        - aws ecs
            - cluster
- option setting (.ebextensions)
```yaml
# 2분 동안 모든 인스턴스의 CPU 사용률이 80%를 초과하는 상황이 연속 3번 발생하면 인스턴스 하나가 Auto Scaling 그룹에 추가
option_settings:
  aws:autoscaling:trigger: # namespace
    MeasureName: CPUUtilization
    Statistic: Average
    Unit: Percent
    Period: '2'
    EvaluationPeriods: '3'
    UpperThreshold: '80'
    UpperBreachScaleIncrement: '1'
    LowerThreshold: '20'
    LowerBreachScaleIncrement: '-1'
```

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

### stepfunction
    - much better fit for orchestrating a different batch jobs
    - lambda function timeout 가능
    - JSON Doucumnet
    - example
        - execution failed - cloudwatch

### APIGateWay
    - API Name
    - Endpoint Type
        - private - VPC
        - Reginal - Nomal
    - Integration Type
        - lambda function
            - alias를 이용해서 weight기반으로 blue/green 테스트 가능
            - lambda function에 : 를 추가해서 versioning 지정가능
        - http
        - mock
        - aws service
        - vpc link
    - stages
        - DEV
        - PRD
    - summary
        ```
        dev,prd,test 등의 stage를 생성할수있는 stages가 있고,
        Deployment를 구성한다
        각각의 stage는 config param이 별도고, history를 통해
        rollback이 가능하다.
        ```



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
- depends on
- [드리프트(drift)](https://docs.aws.amazon.com/ko_kr/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html)
- NoEcho : 콘솔, 명령줄 도구 또는 API에 표시되지 않도록 파라미터 값을 마스킹 처리할지 여부입니다.


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

### log
- Application logs
- OS logs
- access logs
- AWS Managed logs
    - ALB,CLB,NLB
    - CloudFront
    - S3
    - CloudTrail
    - Route53
    - VPC Flow

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

### tagging
- https://aws.amazon.com/answers/account-management/aws-tagging-strategies/
- https://d1.awsstatic.com/whitepapers/aws-tagging-best-practices.pdf

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

> 알람사례 : https://docs.aws.amazon.com/config/latest/developerguide/notifications-for-AWS-Config.html

    - s3 에 저장가능
    - json 형태로 저장가능
    - 하나당 1달러 비용듬
    - 전체 리소스가 다보임
    - 리소스가 추가,수정,삭제 될 떄 알람 받을 수 있음
    - Resource Compliance status
    - Aggregators
        - multi account
        - Authorization

- Managed Rules
> https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html
    - s3-bucket-public-read-prohibited

### scp
> example : https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_examples.html

- black list, white list
- OU, Account level(not Master Account)
- default : does not allow anything


### 서비스 카탈로그
    - 클라우드포메이션 템플릿과 연관
    - 포트폴리오란 용어

### ecs
> cheatsheet : https://tutorialsdojo.com/amazon-elastic-container-service-amazon-ecs/
- DockerFile
    - build
        - Docker image
            - pull, push
                - public
                    - Docker hub (https://hub.docker.com)
                - private
                    - AWS ECR (Elastic Container Registry)
                        - private Docker image repository
                        - Access is controlled through IAM (permission errors => policy)
            - run
                - DockerContainer
- Container Management
    - ECS : AWS Elastic Container Service
        - Cluster는 EC2의 논리적 집합
        - EC2 별로 ECS agenet가 설치되어있고, 각각이 Docker Container 이다
        - EC2의 AMI는 ECS에 최적화된 별도의 AMI다
        - ECS의 metadata는 based JSON이다
        - metadata에는 이미지정보, 호스트 및 컨테이너의 포트바인딩, IAM ROle 등이다.
    - Fargate : AWS Serverless
        - task 단위로 task 숫자를 늘림으로써 Scale이 됨
    - EKS : AWS Elastic K8s Service
- Reference
    - https://aws.amazon.com/premiumsupport/knowledge-center/ecs-agent-disconnected-linux2-ami/
    - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/update-service.html
    - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html

### kinesis
- 정의 및 특징
    - like Apache kafka
    - used logs, metrics, IoT, Click Stream, streaming processing frameworks, “real-time” big data
    - Data is automatically replicated to 3 AZ

- 종류
    - Kinesis Streams
        - 기본은 하루, 최대 일주일까지 데이터 보존이 가능하다.
        - 키네시스에 데이터가 들어오면, 임의로 삭제할수 없기때문에 immutable 하다.
        - 하나의 스트림을 여러 어플리케이션이 소비할 수 있다.
        - 스트림은 샤드의 집합이다.
        - 샤드는 시간이 지남에따라 합쳐지고, 재생성된다.
        - Kinesis Stream Records
            - Data Blob : 1mb 단위
            - Record Key : 키가 같으면, 같은 샤드이다.
            - Sequence Number
        - 실시간
    - Kinesis Analytics
        - 실시간으로 stream데이터를 SQL로 분석
    - Kinesis Firehose
        - 서비스로 제공되며, 관리가 필요없음
        - dst으로 s3,redshift,elasticSearch로 stream전송
        - lambda를 이용해서 데이터 변환가능(csv -> json), 로그정규화도 가능
        - 통과하는 만큼 비용지불
        - 거의 실시간

### route53
> cheatsheet : https://tutorialsdojo.com/amazon-route-53/
- https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-types.html
- https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/health-checks-types.html
- https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/dns-failover-router-firewall-rules.html

### DynamoDB
> cheatsheet : https://tutorialsdojo.com/amazon-dynamodb/
- https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.KCLAdapter.html
- https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html

### asg
> cheatsheet : https://tutorialsdojo.com/aws-auto-scaling/?src=udemy

https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html   
https://docs.aws.amazon.com/autoscaling/ec2/userguide/scaling_plan.html   

### iam
> https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements.html

 > https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html

> https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html

```json
"Version": "2012-10-17", // default
"Id": "cd3ad3d9-2776-4ef1-a904-4c229d1642ee", // UUID(GUID),
"Statement": [{...},{...},{...}], // 단일 명령문 또는 개별 명령문의 배열
"Sid": "1", // statement ID, IAM does not expose the Sid in the IAM API
"Effect":"Allow", // Allow or deny, By default, access to resources is denied
"Action": "iam:*AccessKey*", // wildcard (*), CreateAccessKey, DeleteAccessKey
"Condition" : { "StringEquals" : { "aws:username" : "johndoe" }} // optional

// 사용자가 IAM을 제외한 모든 AWS 서비스의 모든 작업에 액세스할 수 있도록 허용합니다.
"Effect": "Allow",
"NotAction": "iam:*",
"Resource": "*"

// 사용자가 S3의 모든 리소스에서 버킷삭제를 제외한 모든 작업을 수행할 수 있습니다.
"Effect": "Allow",
"NotAction": "s3:DeleteBucket",
"Resource": "arn:aws:s3:::*",

// 사용자는 모든 리소스에 대해서 iam 작업을 제외한 모든 것에 대해 거부합니다.
"Effect": "Deny",
"NotAction": "iam:*",
"Resource": "*",
```


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
- Packer와 같은 오픈 소스 머신 이미지 생성 도구가 있다. ( like AWS Image Builder)
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

### examtopics
```
84
```

- Resources가 DependsOn 루프를 형성한다면 순환참조를 하게된다. 따라서 Dependson 속성을 추가해야한다. 예를 들어 동일한 스택에 인터넷 게이트웨이가 있는 탄력적 IP와 VPC를 생성하는 경우 탄력적 IP는 인터넷 게이트웨이 연결에 종속되어야 합니다.
- 배포 서비스는 Auto Scaling을 활용하기 위해 더 빠른 롤아웃을 수행하도록 설계되어야 합니다. 배포 프로세스 중에 인스턴스 태그, 인스턴스 메타데이터 및 Auto Scaling 그룹과 같은 EC2 인스턴스 아티팩트를 사용하여 애플리케이션 설치를 사용자 지정할 수 있습니다.
- DB의 로그를 통해 read rate와 write rate를 확인할 수 있다. According to your logs, you are running at a 10% write rate and a 90% read rate.
- DynamoDB의 글로벌 보조 주요 기능은 파티션 키와 정렬 키는 테이블과 다를 수 있습니다.
- AWS OpsWorks를 고려할 때 스택 계층에 할당할 수 있는 인스턴스 유형이 아닌 것은 스팟 인스턴스이다.
- Route53은 레코드에 대해 null 문자열을 허용하지 않습니다.
- An Amazon EBS volume is tied to its Availability Zone and can be attached only to instances in the same Availability Zone.
- EBS 스냅샷은 해당 지역에 연결되어 있으며 동일한 지역에 볼륨을 생성하는 데만 사용할 수 있습니다.
- ElasticIP는 Region 단위
- SQS 메시지 보관 기간은 설정 가능하며 1분에서 2주까지 자유롭게 설정할 수 있습니다. 기본값은 4일이며 메시지 보관 한도에 도달하면 메시지가 자동으로 삭제됩니다.
- 암호화되지 않은 모든 Amazon EBS 볼륨은 정보 보안 규정에 따라 규정을 준수하지 않는 것으로 식별되어야 합니다. AWS Config 조직 규칙을 생성하여 EBS 암호화가 활성화되었는지 확인하고 AWS CLI를 사용하여 규칙을 배포합니다.
-  관리자 역할이 위임된 경우 Amazon SNS 주제에 메시지를 게시하는 AWS Lambda 함수를 트리거하기 위해 AWS CloudTrail 이벤트 패턴을 사용하는 AWS API 호출을 사용하여 Amazon EventBridge(Amazon CloudWatch Events) 이벤트 규칙을 생성합니다.
- [Elastic Beanstalk에서 조정 트리거 문제를 해결하려면 어떻게 해야 합니까?](https://aws.amazon.com/ko/premiumsupport/knowledge-center/elastic-beanstalk-scaling-triggers/)
- 업데이트 실패 후 스택이 UPDATE_ROLLBACK_FAILED 상태에서 멈춘 경우 스택에서 수행할 수 있는 유일한 작업은 ContinueUpdateRollback 또는 DeleteStack입니다.
- EB~ largest immediate benefit of the 'Swap Environment URLs' feature is Blue-Green Deployments
- immutability on a server is Not updating a server after creation
- Amazon SQS의 최대허용 메세지크기보다 큰 메시지를 대기열로 보내면 HTTP 코드 400과 함께 MessageTooLong 오류가 수신됩니다. (256kb 이상)
- AWS Config 규칙을 사용하여 CloudFormation 스택이 구성 변경을 감지했을 때 이를 감지하고 알립니다.
- [Configure a web identity federation role within IAM to enable access to the correct DynamoDB resources and retrieve temporary credentials.](https://aws.amazon.com/blogs/startups/dynamic-websites-using-the-aws-sdk-for-javascript-in-the-browser/)
- Elastic Beanstalk가 스왑 작업을 완료한 후 이전 환경 URL에 연결을 시도할 때 새 환경이 응답하는지 확인합니다. 그러나 DNS 변경 사항이 전파되고 이전 DNS 레코드가 만료될 때까지 이전 환경을 종료하지 마십시오. DNS 서버는 DNS 레코드에 설정한 TTL(Time to Live)을 기반으로 캐시에서 오래된 레코드를 항상 지우지는 않습니다.
- Create a governing Amazon Route 53 record set, set it to failover, and associate it with the primary and secondary Amazon Route 53 record sets to distribute traffic to healthy DNS entries.
- Create Amazon Route 53 health checks for each endpoint that cannot be entered as alias records. Ensure firewall and routing rules allow Amazon Route 53 to send requests to the endpoints that are specified in the health checks.
- 월 단위로 실행하는 데 가장 비용이 많이 드는 앱은 모든 리소스에 대해 AWS 비용 할당 태깅을 사용합니다. 비용 탐색기를 사용하여 한 달 동안의 비용을 분석합니다.
- Docker 이미지의 유일한 read-write layer는 last layer이다. 나머지 layer는 read only이다.
- DynamoDB의 최적의 키구조로 경우의 따라 해시키와 범위키를 사용할 수 있다.
- Fargate에는 "Service Auto Scaling"이 있지만 "Auto Scaling Group"은 없습니다.
- CloudFormation 스택에서 SSM 유형의 파라미터를 지정하여 Parameter Store에서 최신 AMI ID을 얻습니다. (AMI ARN's"라는 개념은 없습니다.)
- EBS 볼륨을 연결한뒤, 블록 디바이스가 검색되면 마운트를 진행합니다.
- SQS 대기열을 생성하고 AWS KMS에서 서버 측 암호화를 사용하여 대기열을 암호화합니다.
- 운영 체제의 보안 평가 스캔을 실행하기위해선 Amazon Inspector 스캔한다
- Amazon S3 트리거 및 AWS Lambda 함수를 설정하여 수신 로그를 분석하고 이상을 자동으로 식별합니다. Amazon Athena를 사용하여 중앙 계정의 로그에 대한 임시 쿼리를 실행합니다.
- Elastic Beanstalk 에는 자동 롤백 기능이 존재하지 않습니다.
- AWS OpsWorks 스택을 사용하여 웹 애플리케이션을 다시 배포하고 AWS OpsWorks 자동 롤백 기능을 사용하여 실패 시 롤백을 시작합니다.
- 웹 애플리케이션에서 데이터 및 미들웨어 계층에 대한 연결을 테스트하는 상태 확인 끝점을 만듭니다. 이 엔드포인트를 로드 밸런서의 상태 확인 URL로 사용하십시오
- 50개 이상의 동시 빌드 작업을 제공할 수 있습니까? Auto Scaling 그룹에 슬레이브 노드 집합을 배치합니다. "RunningBuildJobs"가 5분 이상 동안 45보다 클 때 Amazon EC2 인스턴스를 시작하도록 Auto Scaling 정책을 트리거하는 CloudWatch 경보를 구성합니다. "RunningBuildJobs"가 5분 이상 40 미만일 때 Amazon EC2 인스턴스를 종료하도록 Auto Scaling 정책을 트리거하는 CloudWatch 경보를 구성합니다.
- 서버 장애로 인한 데이터 손실을 방지하는 것은 DynamoDB StreamSpecification을 사용하고 모든 변경 사항을 AWS Lambda로 스트리밍합니다. AWS CloudWatch Logs에 변경 사항을 기록하고 기록하기 전에 민감한 정보를 제거합니다.
- AWS IAM scope is Global
- AD 커넥터는 2가지 크기로 제공됩니다. 작고 큰. 소규모 AD 커넥터는 최대
500명의 사용자로 구성된 소규모 조직을 위해 설계되었습니다. 대규모 AD 커넥터는 최대 5,000명의 사용자로 구성된 대규모 조직을 위해 설계되었습니다.
- AD동기화 도메인이 존재하지 않습니다.
- 서버에 Cloudwatch logs 에이전트를 설치하고, 웹 애플리케이션 로그를 CloudWatch로 스트리밍한다. Cloudwatch logs 그룹을 생성한뒤, 특정 웹상태(5XX)에 대한 매트릭지표를 설정한다
- 작업을 긴 시간동안 한번만 처리하려면, SQS에서 visibility timeout 시간을 최대한 길게한다.
- CPU 크레딧 하나는 1분 동안 100%의 사용률로 실행되는 vCPU 하나에 해당합니다.
vCPU 2개가 1분동안 50% 실행되는것과 vCPU 4개가 1분동안 25%로 실행할 수 있는것이다.
- 프로덕션에 적용되기 전에 회사의 보안 팀 구성원이 승인하려면, 배포 단계 전에 수동 승인 CodePipeline 작업을 만듭니다. 수동 승인 단계를 승인할 수 있는 액세스 권한을 보안 팀에 부여하는 정책을 만듭니다.
- CloudTrail은 기본적으로 활성화되어있다
- AWS CloudFormation의 보안을 강화하는 측정 조합은 AWS Secrets Manager AWS::SecretsManager::Secret 리소스 유형을 사용하여 암호를 생성합니다. Amazon RDS 데이터베이스와 같이 암호가 필요한 리소스의 보안 리소스 반환 속성을 참조하십시오.
- AWS CloudFormation의 보안을 강화하는 측정 조합은 CloudFormation NoEcho 매개변수 속성을 사용하여 매개변수 값을 마스킹합니다.
- AWS CloudFormation의 보안을 강화하는 측정 조합은 민감한 정적 데이터를 AWS Systems Manager Parameter Store에 보안 문자열로 저장합니다. 데이터에 액세스해야 하는 리소스에서 동적 참조를 사용합니다.
- ASG Of The health check can checking the application process
- 임시 AWS 보안 자격 증명을 교환하기 위해 Google 또는 Facebook과 같은 자격 증명 공급자를 사용합니다.
- 그룹에서 EC2 인스턴스 종료 수명 주기 작업을 생성하고, 이를 기반으로 Amazon CloudWatch Events 규칙을 생성하여 Amazon S3에 로그를 저장하기 위한 AWS Lambda 함수를 트리거하고, 다음을 사용하여 Amazon DynamoDB 테이블에 로그 파일 카탈로그를 생성합니다. 기본 키는 인스턴스 ID이고 정렬 키는 인스턴스 종료 날짜입니다.
- 재해 복구 기준은 세션 데이터가 지역 간에 거의 실시간으로 복제되어야 하고 요청의 1%가 보조 지역으로 보내져 지속적으로 시스템 작동을 검증해야 함을 나타냅니다. 두 리전 모두에서 AWS Elastic Beanstalk에 애플리케이션을 배포하고 세션 데이터에 Amazon DynamoDB 글로벌 테이블을 사용합니다. 상태 확인과 함께 Amazon Route 53 가중 라우팅 정책을 사용하여 리전 전체에 트래픽을 분산합니다.
- 테스트 코드를 만드는 것은 Devops 엔지니어의 책임이 아닙니다. 테스트 엔지니어가 테스트 환경을 검증해야 하는 CodeDeploy 배포 파이프라인에 수동 승인 작업을 추가합니다.

---

### 용어정리
- OVF(Open Virtualization Format)
- guestfish 대화형 셸
- virt-rescue 셸
- 골든 Amazon 머신 이미지(AMI)

---

### Refernece
    - aws-demos