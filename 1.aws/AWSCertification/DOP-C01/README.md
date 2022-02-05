
# DOP-C01
> dop시험준비하기 : https://tutorialsdojo.com/aws-certified-devops-engineer-professional/?src=udemy

> aws공식DOP무료학습 : https://explore.skillbuilder.aws/learn/course/external/view/elearning/74/exam-readiness-aws-certified-devops-engineer-professional

> aws공식DOP문서 : https://aws.amazon.com/ko/certification/certified-devops-engineer-professional/

> examtopics시험문제 : https://www.examtopics.com/exams/amazon/aws-devops-engineer-professional/view/

> https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/tracking-free-tier-usage.html

> DOP 시험범위 : https://d1.awsstatic.com/ko_KR/training-and-certification/docs-devops-pro/AWS-Certified-DevOps-Engineer-Professional_Exam-Guide.pdf

---

## INDEX
- Section1 : Course Overview - AWS Certified Devops
- Section2 : Code & Slides Download
- Section3 : SDLC Automation
    - [CODECOMMIT](#codecommit)
    - [CODEBUILD](#codebuild)
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
    - [AWS Secrets Manager](#secretsmanager)
- Section6 : Incident and Event Response, HA, Fault Tolerance, DR
    - [ASG](#asg)
    - [route53](#route53)
    - [DynamoDB](#dynamodb)
    - [MultiRegion](#multiregion)
    - [MultiAccount](#multiaccount)
    - [IAM](#iam)
    - [Aurora](#aurora)
- AWS 공인 DevOps 엔지니어 전문 실습 시험
    - [TEST1](#test1)
    - [TEST2](#test2)
    - [examtopics](#examtopics)
    - [examtopics_answer](#examtopics_answer)
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
- [Worker Environments](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features-managing-env-tiers.html)
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
- IAM Role
    - Service Role : EB에서 사용자를 대신해서 AWS 서비스를 사용하도록 위임
    - instance Profile : 사용자 환경의 인스턴스에 적용. 환경 유형 및 플랫폼에 따라 달라지는 기타 작업을 수행
- User Policy
    - 사용자가 Elastic Beanstalk 애플리케이션 및 환경을 생성하고 관리할 수 있습니다.

### lambda
> FAQ : https://aws.amazon.com/ko/lambda/faqs/

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

### opswork
#### aws opsworks stacks
> Chef를 사용하여 운영 자동화
- OpsWorks Stacks에서는 예약된 일정이나 트래픽 수준 변화에 따라 서버 자동 확장을 설정할 수 있으며, 환경 규모 변화에 따라 수명 주기 후크를 사용하여 변경 사항을 조정합니다.
- Chef Solo로 Chef 레시피를 실행하면 패키지, 프로그래밍 언어, 프레임워크 설치, 소프트웨어 구성 등의 작업을 자동화할 수 있습니다.
- time-based instancs(시간 기반 인스턴스)
- Load-based instances(부하 기반 인스턴스)

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

> FAQ : https://aws.amazon.com/ko/cloudformation/faqs/

> cheatsheet : https://tutorialsdojo.com/aws-cloudformation/?src=udemy

> policy 리소스속성참조 : https://docs.aws.amazon.com/ko_kr/AWSCloudFormation/latest/UserGuide/aws-product-attribute-reference.html

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

- UpdatePolicy
    - AWS Cloudformation의 스팩이 업데이트될 때, ASG의 그룹 내 리소스가 업데이트되는 방식을 정의
        - AutoScalingRollingUpdate
            ```json
            {
                "UpdatePolicy": {
                    "AutoScalingRollingUpdate": {
                        "MaxBatchSize": Integer,
                        "MinInstancesInService": Integer,
                        "MinSuccessfulInstancesPercent": Integer,
                        "PauseTime": String,
                        "SuspendProcesses": [ List of processes ],
                        "WaitOnResourceSignals": Boolean
                    }
                }
            }
            ```
        - AutoScalingReplacingUpdate : WillReplace : true
            - 신규ASG가 완전히 성공해야, 이전ASG가 삭제됨
- DeletionPolicy
    - what happens when the CloudFormation template is deleted
        - DeletePolicy=Delete (default behavior):
            - Note: for AWS::RDS::DBCluster resources, the default policy is Snapshot
            - Note: to delete an S3 bucket, you need to first empty the bucket of its content
        - DeletionPolicy=Retain:
        - DeletionPolicy=Snapshot:
            - EBS Volume, ElastiCache Cluster, ElastiCache ReplicationGroup
            - RDS DBInstance, RDS DBCluster, Redshift Cluster
- Helper Script
    - EC2 인스턴스가 대상이다
    - cfn-init
        - 리소스 메타데이터를 검색 및 해석하고, 패키지를 설치하고, 파일을 생성하고, 서비스를 시작하는 데 사용됩니다.
    - cfn-signal
        - 필수 리소스나 애플리케이션이 준비될 때 스택에서 다른 리소스를 동기화할 수 있도록 CreationPolicy 또는 WaitCondition에서 신호를 전송하는 데 사용됩니다.
    - cfn-get-metadata
        - 특정 키에 대한 리소스나 경로의 메타데이터를 검색하는 데 사용됩니다.
    - cfn-hup
        - 메타데이터에 대한 업데이트가 있는지 확인하고 변경 사항이 감지된 경우 사용자 지정 후크를 실행하는 데 사용됩니다.
- /var/log/cloud-init-output.log
    - 인스턴스가 의도한 대로 동작하지 않더라도 스크립트를 손쉽게 디버깅할 수 있습니다
- /var/log/cfn-init.log
- depends on
- [드리프트(drift)](https://docs.aws.amazon.com/ko_kr/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html)
- NoEcho : 콘솔, 명령줄 도구 또는 API에 표시되지 않도록 파라미터 값을 마스킹 처리할지 여부입니다.
- 템플릿은 Registry 리소스 유형, 자체 사용자 지정 프라이빗 유형, 자체 매크로를 활용할 수 있을 뿐 아니라, AWS Secrets Manager 및 AWS System Manager Parameter Store에서 구성 파라미터를 검색할 수도 있습니다.
- AWS 리소스 사이에서 이름 충돌을 염려할 필요 없이 하나의 템플릿에서 여러 스택을 생성할 수 있습니다.
- 리소스에 이름을 지정하면 템플릿을 재사용하기 힘들고 업데이트하기 위해 리소스를 교체할 때 이름에 충돌이 생깁니다.
- CloudFormation을 Systems Manager와 통합하면 Systems Manager Automation 문서를 통해 소프트웨어 설치를 진행하고 유지 관리할 수 있습니다.
- AWS CloudFormation은 EC2 인스턴스에서 Chef Server 및 Chef Client 소프트웨어를 부트스트랩하는 데 사용할 수 있습니다.
- AWS CloudFormation은 EC2 인스턴스에서 Puppet Master 및 Puppet Client 소프트웨어를 부트스트랩하는 데 사용할 수 있습니다.
- CloudFormation은 Amazon EBS 볼륨 및 Amazon EC2 인스턴스가 속한 CloudFormation 스택의 이름을 사용하여 해당 볼륨 및 인스턴스에 자동으로 태그를 지정합니다.
- 기본적으로 “Automatic rollback on error” 기능이 활성화되어 있습니다. 이 경우 CloudFormation은 모든 개별 작업에 성공할 경우 스택의 모든 리소스를 생성 또는 업데이트만 하게 됩니다. 
- Amazon EBS 볼륨 또는 Amazon RDS 데이터베이스 인스턴스가 삭제되기 전에 이에 대해 생성할 스냅샷을 지정할 수 있습니다. 스택이 삭제될 때 리소스를 삭제하지 않고 보존하도록 지정할 수도 있습니다.
- CloudFormation의 옵션 중 하나는 장벽처럼 작용해 애플리케이션 또는 관리 시스템과 같은 외부 소스에서 완료 신호가 수신될 때까지 다른 리소스의 생성을 차단하는 WaitCondition 리소스입니다.

### codebuild

- eb_codebuild
```sh
# settings
eb_codebuild_settings:
  CodeBuildServiceRole: role-name
  ComputeType: size
  Image: image
  Timeout: minutes 
# serviceRole
  "codebuild:CreateProject",
  "codebuild:DeleteProject",
  "codebuild:BatchGetBuilds",
  "codebuild:StartBuild"
```

### codepipeline
> cheatsheet : https://tutorialsdojo.com/aws-codepipeline/

- https://docs.aws.amazon.com/codepipeline/latest/userguide/actions-create-custom-action.html

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
- console,cli,sdk,api 등에서 AWS가 수행한 작업을 이벤트로 기록
- doc
    - https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-log-file-validation-cli.html
    - https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-receive-logs-from-multiple-accounts.html
    - https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-sharing-logs.html

- 모든지역추적(Console 기본옵션)
- 단일지역추적(AWS CLI, Trail API 기본옵션)
    - create-trail
    - update-trail
    - describe-trail : 추적정보를 반환
    - get-trail : 추적에 대한 설정정보 반환
    - add-tags
    - remove-tags
    - list-tags
    - start-logging : 추적과 함께 이벤트 로깅 시작
    - stop-logging
- CloudTrail은 자체적으로 `Enable log file validation?`체크로 로그 파일 무결성 검증 설정을 할 수 있다
- CloudTrail은 CLI로 `"LogFileValidationEnabled": true,`로 로그파일 무결성 검증설정을 할 수 있다.
- 관리이벤트는 기록되며, 기본적으로 데이터 이벤트와 인사이트 이벤트는 기록되지않는다
- 실제로 CloudTrail은 첫 번째 관리 추적에 대해 비용을 청구하지 않고 첫 번째 관리 추적 이후에 생성하는 추가 관리 추적에 대해서만 비용을 청구하기 때문입니다.

### cloudwatch
- CloudWatch는 지표 리포지토리입니다.
- CloudWatch는 리전 간에 데이터를 집계하지 않습니다. 따라서 메트릭은 지역 간에 완전히 분리됩니다.
- CloudWatch에서는 예상 AWS 요금만 추적할 수 있으며 리소스의 실제 사용률은 추적할 수 없습니다.
- Time Periods 동안, Threshold에 여러번 Datapoints 걸쳐야 알람이 울린다
- 생성할 수 있는 CloudWatch 대시보드 수에는 제한이 없습니다.
- 모든 대시보드는 지역별이 아닌 전역 적입니다.
- AWS 계정이 없어도 대시보드 공유가가능
    - 링크가 있는 모든 사용자가 대시보드를 볼 수 있도록 단일 대시보드를 공개적으로 공유합니다.
    - 하나의 대시보드를 공유하고 대시보드를 볼 수 있는 사람들의 특정 이메일 주소와 비밀번호를 지정합니다.
- IAM 정책에서 사용할 CloudWatch Amazon 리소스 이름(ARN)이 없습니다

- doc
    - [CloudWatch Agent vs SSM Agent vs Custom Daemon Scripts](https://tutorialsdojo.com/cloudwatch-agent-vs-ssm-agent-vs-custom-daemon-scripts/)
        - 사용자 정의스크립트(cron,bash)는 메트릭이 전송되기전 일부 수정이 필요한경우
    - [cloudtrail vs cloudwatch](https://tutorialsdojo.com/aws-cloudtrail-vs-amazon-cloudwatch/)
        - CloudTrail은 요청한 사람, 사용된 서비스, 수행한 작업, 작업에 대한 매개변수 및 AWS 서비스에서 반환된 응답 요소에 대한 정보를 기록
        - CloudWatch를 사용하면 지표를 수집 및 추적하고, 로그 파일을 수집 및 모니터링하고, 경보를 설정
        - CloudWatch 이벤트는 AWS 리소스의 변경 사항을 설명하는 시스템 이벤트의 거의 실시간 스트림입니다. CloudTrail은 AWS 계정에서 이루어진 AWS API 호출에 더 중점을 둡니다.
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/cloudwatch_concepts.html#Metric
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/metrics-collected-by-CloudWatch-agent.html#linux-metrics-enabled-by-CloudWatch-agent
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Counting404Responses.html
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/Subscriptions.html
    - https://aws.amazon.com/blogs/big-data/power-data-ingestion-into-splunk-using-amazon-kinesis-data-firehose/
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/SubscriptionFilters.html#FirehoseExample
    - https://docs.aws.amazon.com/AmazonCloudWatch/latest/events/Create-CloudWatch-Events-CloudTrail-Rule.html
    - https://docs.aws.amazon.com/AmazonS3/latest/user-guide/enable-event-notifications.html

- Amazon EventBridge = Amazon CloudWatch Events API를 기반으로 제공되는 서비스
- ec2
    - StatusCheckFailed : 인스턴스가 마지막으로 인스턴스 상태 확인 및 시스템 상태 확인을 통과했는지 여부를 보고
    - StatusCheckFailed_Instance
    - StatusCheckFailed_System

- Cloudwatch Agent
    - EC2와 온프레미스 서버에 설치가능
    - 설치방법
        - CLI
        - SSM Agent
        - CloudFormation
- CloudWatch Metric Streams
    - 실시간의 연속적인 스트림
    - Datadog, New Relic, Splunk, Dynatrace, Sumo Logic 및 S3
- Cloudwatch alarms
    - ServiceLimitUsage metric : EC2인스턴스 실행제한, ASG 그룹제한 알림
- Cloudwatch events
    - EC2 Instance-Launch Successful
    - EC2 Instance-Terminate Successful
    - AWS_RISK_CREDENTIALS_EXPOSED
- CloudWatch logs
    - default는 로그의 무기한 보관
    - Route 53 DNS 쿼리 기록
    - CloudTrail 기록 이벤트 모니터링
    - EC2 인스턴스의 로그
- 구성요소
    - namespaces - a container for CloudWatch metrics
    - metric
    - dimensions
    - Statistics

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
        - 서비스의 요청을 처리하고 요청에 지정된 대로 시스템을 구성합니다.
        - 자동화를 사용하여 로그인하지 않고도 서버를 관리할 수 있습니다.
        - SSM 에이전트는 루트 수준 권한에서 실행됨을 기억하십시오
        - 시스템자동화로 OS 패치를 설치하고 새 AMI를 생성하는 자동화 문서를 실행
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
        - [Automation](https://docs.aws.amazon.com/systems-manager-automation-runbooks/latest/userguide/automation-awssupport-executeec2rescue.html)
        - Policy
        - Session
- Parameter Store
    - AWS 키와 데이터베이스 암호을 암호화된 매개변수로 저장
    - Parameter details
        - Type : SecureString
        - KMS key source
    - `aws ssm get-parameters`
        - path와 --recursive 옵션으로 모두 가져올 수 있음
        - --with-decryption 으로 복호화
        - --names로 값 가져올 수 있음
- Patch Manager
    - SSM 유지 관리 기간을 사용하여 애플리케이션 패치를 예약합니다.
- session manager
    - instance 접속 history 확인 및 ssh접속 기록하도록 설정가능
    - 감사 및 검토를 위해 세션 로그를 S3 버킷 또는 CloudWatch Logs로 보냅니다.
- [state manager](https://aws.amazon.com/cn/blogs/mt/configure-amazon-ec2-instances-in-an-auto-scaling-group-using-state-manager/)
- Inventory
    - SSM 인벤토리를 통해 관리중인 인스턴스의 어플리케이션의 버전과 패치, 구성 확인가능
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

- VPC 엔드포인트를 생성해서 SSM을 이용할 수 있다. ENI를 통해 PrivateLink를 활용한다
- 관리형 인스턴스를 설정하려면 SSM 에이전트 설치 및 IAM 인스턴스 프로파일을 연결한다.
- AWS Systems Manager 문서는 대규모로 리소스를 관리할 수 있도록 코드형 구성을 지원합니다.
- AWS Systems Manager parameter store는 AWS Key Management Service(KMS)와 통합되므로, 저장하는 데이터를 자동으로 암호화할 수 있습니다.
- AWS Systems Manager parameter store는 AWS Identity and Access Management(IAM)를 사용해 파라미터에 대한 사용자 및 리소스 액세스를 제어할 수 있습니다.
- AWS IAM을 사용하면 누가 어떤 리소스에서 어떤 파라미터에 액세스할 수 있는지 제어할 수 있습니다.
- AWS Systems Manager parameter store는 파라미터 변경 이벤트를 기준으로 Amazon CloudWatch Events 규칙을 설정할 수도 있습니다. 또한, AWS CloudTrail을 사용하여 파라미터 API 호출을 추적하고 감사할 수도 있습니다.
- 파라미터 변경이력을 볼 수 있고, 자동으로 설정되는 버저닝을 통해 특정 파라미터값 검색가능
- Parameter Store에서 Secrets Manager 보안 정보를 참조할 수 있습니다.

### config
: AWS 리소스 구성 변경사항에 대한 알림을 제공하는 완전관리형 서비스
- CheatSheet : https://tutorialsdojo.com/aws-config/

> 알람사례 : https://docs.aws.amazon.com/config/latest/developerguide/notifications-for-AWS-Config.html

    - s3 에 저장가능. 자동으로 전달가능
    - json 형태로 저장가능
    - 하나당 1달러 비용듬
    - 전체 리소스가 다보임
    - 리소스가 추가,수정,삭제 될 떄 알람 받을 수 있음
    - Resource Compliance status
    - Aggregators
        - multi account
        - Authorization
    - AWS Config를 사용하면 온프레미스에서 실행되는 서버와 EC2 인스턴스 내에서 소프트웨어 구성 변경 사항을 기록할 수 있다.
        - 운영 체제 구성
        - 시스템 수준 업데이트
        - 설치된 애플리케이션
        - 네트워크 구성
    - 다중 계정, 다중 지역 데이터 집계를 통해 Config 규칙 규정 준수 상태 를 전사적으로 볼 수 있다
    - AWS CloudFormation 템플릿을 사용하여 AWS Config 관리형 규칙을 생성가능
      템플릿은 규칙만 생성하고 추가 AWS 리소스는 생성하지 않습니다.
    - AWS Cloudformation 스택을 업데이트 할 수 있음

- Managed Rules
> https://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html
    - approved-amis-by-id
    - approved-amis-by-tag
    - autoscaling-group-elb-healthcheck-required
    - s3-bucket-server-side-encryption-enabled
        - Amazon S3 버킷에 Amazon S3 기본 암호화(SSE-S3, SSE-KMS)가 활성화여부 확인
    - s3-bucket-public-read-prohibited
    - access-keys-rotated
        - maxAccessKeyAge (MAX=90)
    - account-part-of-organizations
        - 조직에속하는지여부
    - cloudfront-origin-failover-enabled
        - 오리진그룹에 오리진서버가 2대로 되어있는지
    - cloudfront-custom-ssl-certificate
        - 기본SSL 인증서를 사용하는지 여부
    - db-instance-backup-enabled
        - DB 인스턴스 백업여부
    - cloudformation-stack-notification-check
        - 클라우드포메이션이 해당 주제에 알람을 보내는지 확인
    - cloudformation-stack-drift-detection-check
        - 클라우드포메이션이 실제구성이나 예상구성과 다를경우
    - ec2-instance-managed-by-systems-manager
        - 계정의 EC2 인스턴스가 SystemManager에서 관리되는지 확인
    - ec2-ebs-encryption-by-default
        - EBS의 암호화가 기본으로 적용되었는지 여부

### trustedadvisor
> Trusted Advisor는 AWS 환경을 분석하고 5가지 범주에서 모범 사례 권장 사항을 제공합니다.
- 비용 최적화(Cost Optimization)
- 성능(Performance)
- 보안(Security)
- 결함 허용(fault tolerlence)
- 서비스 제한(service limit)

### scp
> example : https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_scps_examples.html

- black list, white list
- OU, Account level(not Master Account)
- default : does not allow anything

### secretsmanager

- 키 교체를 활성화하면, 비밀번호를 생성 후 정기적으로 자동순환할 수 있다

### 서비스 카탈로그
    - 클라우드포메이션 템플릿과 연관
    - 포트폴리오란 용어

### ecs
> 클러스터에서 Docker 컨테이너를 실행, 중지 및 관리하는 컨테이너 관리서비스

> cheatsheet : https://tutorialsdojo.com/amazon-elastic-container-service-amazon-ecs/
- ETL( Extract-Transform-Load ) 워크로드를 관리 및 확장
- TaskDefinition
    - TaskFamily
    - IAM task role
    - Network mode
    - Container definitions
    - Voluums
    - Task placement constraints
    - Launch types
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
        - ECS의 Service는 ECS TASK로 구성되어있고, ECS TASK는 EC2 또는 Fargate가 될 수 있다.
        - Cluster는 EC2의 논리적 집합
        - EC2 별로 ECS agenet가 설치되어있고, 각각이 Docker Container 이다
        - EC2의 AMI는 ECS에 최적화된 별도의 AMI다
        - ECS의 metadata는 based JSON이다
        - metadata에는 이미지정보, 호스트 및 컨테이너의 포트바인딩, IAM ROle 등이다.
    - Fargate : AWS Serverless
        - 프로비저닝, 스케일링, 메니지먼트를 신경쓸 필요가 없음
        - 비용은 서버를 유지하는 EC2 보다 저렴하게 발생
        - ECS의 TASK 또는 EKS의 Pods로 사용될 수 있음
        - task 단위로 task 숫자를 늘림으로써 Scale이 됨
    - EKS : AWS Elastic K8s Service
        - Pods 단위
- CLI TOOL
    - Amazon ECS Exec
        - EC2나 Fargate의 컨테이너에서 명령을 실행할 수 있는 방법
    - App2Container
    - Copilot
- Reference
    - https://aws.amazon.com/premiumsupport/knowledge-center/ecs-agent-disconnected-linux2-ami/
    - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/update-service.html
    - https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html
    - https://aws.amazon.com/blogs/compute/how-to-automate-container-instance-draining-in-amazon-ecs/
    - https://docs.aws.amazon.com/cli/latest/reference/ecs/update-service.html

- Docker는 현재 Amazon ECS에서 지원하는 유일한 컨테이너 플랫폼입니다.
- 단일 컨테이너를 시작하려면 태스크 정의에 단 한 개의 컨테이너 정의만 포함해야 합니다.
- 태스크에는 Amazon ECS가 배치를 결정하는 데 필요한 모든 정보가 포함되어 있습니다.
- Amazon ECS는 서비스 스케줄러를 사용하면 애플리케이션 가용성 유지 관리가 가능하여, 애플리케이션 용량 요구 사항에 따라 컨테이너 규모를 확장하거나 축소할 수 있습니다.
- 태스크 정의에 Amazon ECR 리포지토리를 지정하고 AmazonEC2ContainerServiceforEC2Role을 인스턴스에 연결하기만 하면 됩니다.
- Fargate에서는 서버 프로비저닝, 클러스터 관리, 오케스트레이션이라는 개념이 모두 필요 없습니다.
- Amazon EC2 고객은 컨테이너 인스턴스의 운영 체제(OS)에 대한 루트 액세스 권한을 가집니다. 고객은 OS 보안 설정의 소유권을 가져오고 모니터링, 패치 관리, 로그 관리 및 호스트 침입 탐지와 같은 보안 기능을 위한 추가 소프트웨어 구성 요소를 구성할 수 있습니다.
- 고객의 EC2 인스턴스는 ECS 서비스에 액세스하기 위해 IAM 역할을 사용합니다.
- 고객의 ECS 태스크는 서비스와 리소스에 액세스하기 위해 IAM 역할을 사용합니다.


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
- https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/welcome-health-checks.html

- 주제
    - 레코드 유형
    - AAAA 레코드 유형 : 16진법형식의 Ipv6
        - EX : 2001:0db8:85a3:0:0:8a2e:0370:7334
    - CAA 레코드 유형
    - CNAME 레코드 유형 : 현재 레코드의 이름에 대한 DNS 쿼리를 다른 도메인(example.com or example.net) 또는 하위 도메인(acme.example.com or zenith.example.org)으로 매핑합니다.
    - DS 레코드 유형
    - MX 레코드 유형
    - NAPTR 레코드 유식
    - NS 레코드 유형
    - PTR 레코드 유형
    - SOA 레코드 유형
    - SPF 레코드 유형
    - SRV 레코드 유형
    - TXT 레코드 유형
- Route 53이 별칭 레코드에 대한 DNS 쿼리를 받으면, Route 53은 해당 리소스에 해당되는 값으로 응답합니다.
    - Amazon API Gateway 사용자 지정 리전 API 또는 엣지 최적화 API - Route 53은 API의 하나 이상의 IP 주소로 응답합니다.
    - Amazon VPC 인터페이스 엔드포인트 – Route 53은 인터페이스 엔드포인트의 하나 이상의 IP 주소로 응답합니다.
    - CloudFront 배포 – Route 53은 콘텐츠를 제공할 수 있는 CloudFront 엣지 서버의 하나 이상의 IP 주소로 응답합니다.
    - Elastic Beanstalk 환경 – Route 53은 환경에 대해 하나 이상의 IP 주소로 응답합니다.
    - ELB 로드 밸런서 – Route 53은 로드 밸런서에 대해 1개 이상의 IP 주소로 응답합니다.
    - AWS Global Accelerator 액셀러레이터 – Route 53은 액셀러레이터의 두 IP 주소 중 하나로 응답합니다.
    정적 웹사이트로 구성되는 Amazon S3 버킷 – Route 53은 Amazon S3 버킷의 1개의 IP 주소로 응답합니다.
    동일한 호스팅 영역의 다른 Route 53 레코드 – Route 53은 별칭 레코드에서 참조하는 레코드에 대한 쿼리가 요청된 것처럼 응답합니다.

### DynamoDB
> cheatsheet : https://tutorialsdojo.com/amazon-dynamodb/

- 강력한 일관된 읽기(Strongly Consistent Read)는 default이다

- https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.KCLAdapter.html
- https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Streams.html
- [Amazon DynamoDB 전역 테이블을 사용하여 다중 지역 아키텍처를 강화하는 방법](https://aws.amazon.com/ko/blogs/database/how-to-use-amazon-dynamodb-global-tables-to-power-multiregion-architectures/)
- [Amazon DynamoDB 테이블이 제한되는 이유](https://aws.amazon.com/ko/premiumsupport/knowledge-center/dynamodb-table-throttled/)
- [지수 백오프 및 지터](https://aws.amazon.com/ko/blogs/architecture/exponential-backoff-and-jitter/)

### asg
> cheatsheet : https://tutorialsdojo.com/aws-auto-scaling/?src=udemy

https://docs.aws.amazon.com/autoscaling/ec2/userguide/schedule_time.html   
https://docs.aws.amazon.com/autoscaling/ec2/userguide/scaling_plan.html   

### Aurora
> faqs : https://aws.amazon.com/ko/rds/aurora/faqs/

- 교차 리전복제
    - Amazon Aurora Global Database
        - 모든 읽기/쓰기 워크로드를 처리하도록 보조 리전을 승격하는 데 1분이 채 걸리지 않습니다.
        - Amazon RDS 콘솔에서 교차 리전 복제본을 새로운 기본 복제본으로 승격할 수 있습니다.
        - 장애시 수동으로 애플리케이션이 새로 승격된 리전을 가리키도록 해야 합니다.
        - 장애시 수동으로 보조 리전을 제거하고 모든 읽기 및 쓰기를 처리하도록 승격해야 합니다.
        - 수동으로 승격하지않으려면, Lambda가 필요합니다
    - 최대 5개의 보조 리전에 복제
- 동일 리전복제
    - Amazon Aurora Replica
    - 비동기식(밀리초)
- 장애조치
    - Amazon Aurora 복제본이 있는경우
        - 동일한 가용 영역 또는 다른 가용 영역
            - Aurora는 DB 인스턴스의 CNAME(정식 이름 레코드)이 정상적인 복제본을 가리키도록 이를 변경하며, 해당 복제본은 승격되어 새로운 기본 복제본이 됩니다. 일반적으로 장애 조치는 처음부터 끝까지 30초 이내에 완료됩니다. 
    - Amazon Aurora 복제본이 없는경우
        - 동일한 가용 영역에 새 DB 인스턴스를 생성하려고 시도
    


### iam
> https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements.html

> https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_accounts_access.html

> https://docs.aws.amazon.com/IAM/latest/UserGuide/tutorial_cross-account-with-roles.html

- 제3자가 조직의 AWS리소스에 엑세스해야한다면, 버킷에 액세스할 수 있는 권한이 있는 교차 계정 IAM 역할을 생성하고 해당 역할을 사용할 수 있는 권한을 공급업체 AWS 계정에 부여합니다.

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

### test2
- 단계와 작업의 차이가 머지
- 5. 시스템카탈로그
- EC2 인스턴스 클러스터
- 7. 콘텐츠 덮어쓰기 옵션?
- 새 버전의 애플리케이션이 배포될 때마다 모든 사용자는 자동으로 로그아웃되어 전반적인 사용자 경험에 영향을 미칩니다.
- 40. 에이전트별 차이?
- 45. 로컬 보조인덱스와 글로벌 보조인덱스의 차이는?
- 46. 앱은 서버 라이선스 제약으로 인해 Auto Scaling을 사용할 수 없습니다.

- 데이터베이스 인스턴스의 수명 주기가 애플리케이션 환경의 수명 주기와 연결되어 있기 때문에 프로덕션 환경에는 적합하지 않습니다.
- Amazon ES 클러스터를 유지 관리하는 데 많은 운영 오버헤드가 수반되기 때문입니다.
- Amazon Route 53 서비스를 사용하여 들어오는 모든 트래픽을 새 애플리케이션 스택으로 한 번에 전달하는 것은 잘못된 것입니다. 들어오는 모든 트래픽을 새 포털로 보낼 때 중단이 상당히 높습니다. 문제가 발생하면 이전 스택으로 다시 전환하기 위해 다운타임이 발생합니다.
- AWS RDS의 경우, DB 인스턴스, DB 클러스터, DB 클러스터 스냅샷, DB 파라미터 그룹 또는 DB 보안 그룹에 대한 이벤트 범주를 구독할 수 있습니다.
- Amazon Simple Notification Service(Amazon SNS)를 사용하여 Amazon RDS 이벤트가 발생할 때 알림을 제공합니다.
- 특정 DB 인스턴스의 백업 카테고리를 구독하면 DB 인스턴스에 영향을 미치는 백업 관련 이벤트가 발생할 때마다 알림을 받습니다. DB 보안 그룹의 설정 변경 카테고리에 가입하면 DB 보안 그룹이 변경될 때 알림을 받습니다.
- 원본 스냅샷의 AWS 리전과 다른 AWS 리전에 스냅샷을 복사하면 증분 스냅샷을 복사하더라도 첫 번째 복사본은 전체 스냅샷 복사본입니다. 전체 스냅샷 복사본에는 DB 인스턴스를 복원하는 데 필요한 모든 데이터와 메타데이터가 포함됩니다.
- 스냅샷을 완료하는 데 상당한 시간이 걸리기 때문에 교차 리전 스냅샷은 읽기 전용 복제본에 비해 높은 RPO를 제공하지 않습니다.
- Amazon RDS 다중 AZ와 마찬가지로 Aurora 다중 마스터에는 여러 가용 영역에만 데이터가 복제되지만 다른 AWS 리전에는 복제되지 않습니다. 대신 Amazon Aurora 글로벌 데이터베이스를 사용해야 합니다.
- Amazon RDS의 다중AZ의경우 고가용성을 목표로하며, 동기식 복제가 진행되고 자동백업 시 대기상태로 진행된다. active-standby로 기본 인스턴스만 확장된다.
- Amazon RDS의 다중리전배포의경우 로컬성능과 재해복구를 위해서 진행한다. 모든 Region에 접근가능하며, 비동기식 복제가 가능하고 리전별로 자동백업되며 리전별로 DB엔진버전관리를 별도로할수있고, 리전별로 다중AZ배포가 가능하다.
- 고가용성을 위해 원본 데이터베이스를 다중 AZ로 구성하고 읽기 확장성을 위해 읽기 전용 복제본(단일 AZ)을 만들 수 있습니다.
- AWS Systems Manager State Manager는 Amazon EC2 및 하이브리드 인프라를 사용자가 정의한 상태로 유지하는 프로세스를 자동화하는 구성 관리 서비스일 뿐입니다.
- AWS Systems Manager 세션 관리자는 주로 인바운드 포트를 열거나, 배스천 호스트를 유지 관리하거나, SSH 키를 관리할 필요 없이 안전하고 감사 가능한 인스턴스 관리를 제공하지만 클라이언트 측 웹 세션을 필터링하는 데 사용되지 않습니다.
- AWS Shield Advanced를 사용하여 회사 AWS 리소스의 애플리케이션 계층 트래픽에 대한 향상된 DDoS 공격 탐지 및 모니터링을 활성화합니다. VPC의 모든 보안 그룹이 승인된 서버 또는 서비스의 특정 포트와 트래픽만 허용하는지 확인합니다. CloudFront 배포 뒤에 배치하여 오리진 서버를 보호합니다.
- 일반적인 DDoS 요청 패턴을 식별하고 차단하는 AWS WAF 규칙을 설정하여 회사의 클라우드 인프라에 대한 DDoS 공격을 효과적으로 완화합니다. 네트워크 ACL(액세스 제어 목록)이 VPC의 필수 포트 및 네트워크 주소만 허용하는지 확인합니다.
- AWS Shield는 Route53, Cloudfront, LoadBalancer에 다 자동으로 적용된다. 
- OS 패치를 통해 보안강화를 할 수 있지만, 침입자체를 막을 수 없다. 
- AWS Config 콘솔 또는 API를 통해 수정 작업을 쉽게 설정할 수 있습니다. 미리 채워진 목록에서 연결하려는 수정 작업을 선택하거나 AWS Systems Manager Automation 문서를 사용하여 사용자 지정 수정 작업을 생성하기만 하면 됩니다.
- AWS Config는 Lambda가 아닌 AWS Systems Manager Automation 문서와 함께 사용됩니다.
- Trusted Advisor는 매주 요약 알림만 보내므로 규정을 준수하지 않는 리소스에 대해 즉시 알리지 않습니다.
- AWS Config는 기본 수정 작업 이 없기 때문에 올바르지 않습니다. 이는 수정 작업을 구성할 수 있는 AWS Systems Manager Automation 서비스와 통합되어야 합니다.
- Amazon Inspector는 주로 EC2 인스턴스에 사용되는 자동화된 보안 평가 서비스이기 때문에 S3 버킷 정책을 수정하기 위해 AWS Systems Manager에 작업을 보냅니다 . 대신 AWS Config를 사용해야 합니다.
- AWS Elastic Beanstalk는 새 버전을 별도의 환경에 배포한 다음 두 환경의 CNAME을 교환하여 트래픽을 새 버전으로 즉시 리디렉션하는 블루/그린 배포를 수행하면 이 다운타임을 피할 수 있습니다.
- 지정된 파이프라인 또는 모든 파이프라인. 를 사용하여 이를 제어합니다 ."detail-type": "CodePipeline Pipeline Execution State Change"
- 지정된 파이프라인 또는 모든 파이프라인 내에서 지정된 단계 또는 모든 단계. 를 사용하여 이를 제어합니다 ."detail-type": "CodePipeline Stage Execution State Change"
- 지정된 단계 또는 모든 단계 내, 지정된 파이프라인 또는 모든 파이프라인 내에서 지정된 작업 또는 모든 작업. 를 사용하여 이를 제어합니다 ."detail-type": "CodePipeline Action Execution State Change"
- 배포 프로세스의 일부로 CodeDeploy 에이전트는 가장 최근 배포에 의해 설치된 모든 파일을 각 인스턴스에서 제거합니다. 이전 배포에 포함되지 않은 파일이 대상 배포 위치에 나타나는 경우 다음 배포 중에 CodeDeploy가 파일로 수행할 작업을 선택할 수 있습니다.
    - 배포 실패 — 오류가 보고되고 배포 상태가 실패로 변경됩니다.
    - 내용 덮어쓰기 — 애플리케이션 개정판의 파일 버전이 인스턴스에 이미 있는 버전을 대체합니다.
    - 내용 유지 — 대상 위치의 파일이 유지되고 애플리케이션 개정 버전이 인스턴스에 복사되지 않습니다.
- CodeDeploy 에이전트는 EC2/온프레미스 컴퓨팅 플랫폼에 배포하는 경우에만 필요합니다. Amazon ECS 또는 AWS Lambda 컴퓨팅 플랫폼을 사용하는 배포에는 에이전트가 필요하지 않습니다.
-  CodeDeploy에서 블루/그린 배포는 Amazon EC2 인스턴스에서만 작동하기 때문에 온프레미스 서버에 대한 블루/그린 배포 는 올바르지 않습니다.
- CodeDeploy는 롤링 배포를 지원하지 않기 때문에 ECS로의 롤링 배포 는 올바르지 않습니다. 이러한 유형의 배포는 실제로 Elastic Beanstalk에서 수행됩니다.
- CodeDeploy는 선형배포,카나리아배포,AllAtOnce배포가 있다. 선형배포는 특정주기별로 특정트래픽만큼 배포하는 것이고, 카나리아 배포는 특정비율까지 배포한뒤, 특정시간 뒤 일괄로 배포하는것이다
- EC2/온프레미스 배포의경우, 기본배포구성은 AllAtOnce, OneAtTime, HalfAtOnce 세가지다
    - AllAtOnce : 가능한한 모든 배포를 시도하고, 한대라도 성공하면 성공
    - HalfAtATime : 절반이상 배포가 성공하면 성공
    - OneAtATime : 마지막 인스턴스를 제외한 나머지 인스턴스가 한대라도 실패하면 배포실패
- CodeDeploy는 create-development로 시작하고, stop-development 로 멈출수있으며 3가지 상황이 나타날 수 있다
    - 보류
    - 성공
    - 오류
- CodeDeploy는 revision state(인스턴스의 버전변경여부)와 instance state(인스턴스 배포성공여부)가 있다.
- CodeDeploy와 ECS의경우, TaskSet 단위로 롤백이되고 배포가 진행된다.
- EC2/온프레미스 컴퓨팅 플랫폼을 사용하는 경우 블루/그린 배포는 Amazon EC2 인스턴스에서만 작동합니다
- AWS X-Ray 서비스는 주로 개발자가 애플리케이션을 분석하고 디버그하는 데 사용한다는 점에 유의하십시오
- Amazon ECS에서 애플리케이션을 올바르게 계측하려면 X-Ray 데몬을 실행하는 Docker 이미지를 생성하여 Docker 이미지 리포지토리에 업로드한 다음 Amazon ECS 클러스터에 배포해야 합니다.
- xray-daemon.config파일은 주로 Elastic Beanstalk에서 사용됩니다.
- AWS X-Ray 데몬은 UDP 포트 2000에서 트래픽을 수신 대기하고 원시 세그먼트 데이터를 수집하여 AWS X-Ray API에 전달하는 소프트웨어 애플리케이션입니다.
- X-Ray SDK는 X-Ray 로 바로 보내지않고, 데몬으로 보내며 데몬은 SDK와 함께 동작한다.
- Elastic Beanstalk 환경 구성에는 RDS DB 인스턴스가 연결되어 있고 애플리케이션 서버에서 사용합니다. 그렇다면 DNS 변경이 필요한 Blue/Green배포가 불가능합니다. DB가 유실됩니다
- 이 배포 유형은 롤링 배포와 유사하므로 이 문제의 근본 원인을 완화하는 데 도움이 되지 않기 때문입니다. 대본.Rolling with additional batch
- AWS SES는 클라우드 메일서비스로, 커스텀도메인으로 메일을 보낼수있으며 송수신이 가능하다. HTML 형식, 이메일 템플릿 등을 활용할 수 있다
- AWS SNS는 AWS서비스에 대한 알림서비스로 topic을 구독한 subscriber들에게 다양한 프로토콜(HTTP, 이메일, SMS 등)로 전달하는 서비스이다. 이메일의경우 텍스트 기반만 가능하며, 수신은 할 수 없다.
- CloudWatch 경보 가 AWS Lambda에서 직접 테스트 결과를 수신할 수 없기 때문에 Lambda가 AWS CloudWatch 경보에 직접 결과를 보내고 배포 중에 5xx 응답 오류가 수신될 때 롤백을 트리거하도록 하는 옵션 은 올바르지 않습니다.
- 프로덕션 트래픽으로 이동하기 전에 Lambda 검증 기능을 트리거해야 하므로 AWS Lambda에서 검증 스크립트를 생성하고 새 앱 버전을 검증하기 위해 배포 후 호출하는 옵션 은 올바르지 않습니다. 또한 예상대로 작동하지 않는 경우 배포를 롤백할 수 있습니다.
- CodeDeploy Lambda appspec.yaml
    - beforeAllowTraffic
    - AllowTraffic
    - afterAllowTraffic
- CodeDeploy ECS appspec.yaml
    - start
    - beforeInstall
    - Install
    - afterInstall
    - AllowTestTraffic
    - AfterAllowTestTraffic
    - BeforeAllowTraffic
    - AllowTraffic
    - AfterAllowTraffic
    - End
- CodeDeploy가 배포에 성공했을경우 0 값을 반환합니다. 실패할경우 0이 아닌 값을 반환합니다. 
- AutoScalingRollingUpdate의 경우 롤링 업데이트를 사용하면 실행 중인 EC2 인스턴스의 가용성 감소로 인해 시스템 중단 및 성능 저하 위험이 있습니다.
- 롤링 업데이트 중 예기치 않은 스케일링 작업으로 Auto Scaling 그룹의 상태가 변경되면 업데이트가 실패할 수 있습니다.
- 롤링 업데이트 중 Auto Scaling에서 프로세스를 실행하지 못하도록 하려면 SuspendProcesses 속성을 사용합니다.
- WaitOnResourceSignals을 true로 할경우, 다음 인스턴스의 업데이트 시작은 이전 인스턴스의 업데이트의 성공신호가 pause TIme 내에 들어와야 진행하겠다는 의미이다
- MinInstancesInService는 업데이트가 진행되는동안, ASG에서 동작해야할 최소 인스턴스 수를 의미한다. ASG의 최대 Instance값 미만으로 설정해야한다
- MinSuccessfulInstancesPercent는 성공으로 판단할 수 있는 인스턴스배포완료 비율이다. pauseTIme을 설정할경우 해당 시간내에 성공신호를 받아야 인스턴스를 성공했다라고 판단한다.
- StorageGateWay를 통해 온프레미스에서 AWS로 파일,볼륨,테이프 기반의 스토리지를 전송할 수 있다. 테이프 게이트웨이를 설정해서 보낼경우 Archive 백업용으로 서비스용은 아니다.
- 중간단계없이 온프레미스 네트워크랑 Kinesis Video Streams를 연결해서 사용할 수는 없다
- AWS Storage Gateway는 온프레미스에서 VM 어플라이언스, 하드웨어 어플라이언스로 또는 AWS에서 Amazon Elastic Compute Cloud(Amazon EC2) 인스턴스로 실행할 수 있습니다.
- Lambda@Edge는 CLoudFront를 통해 정적,동적 컨텐츠를 제공받는 서비스의 동작지연이나 동작에 관여해야할 떄 사용이 가능하다
- Lambda@Edge는 CloudFront에 접근할 때 실행되는 Lambda의 확장판이다. CloudFront Cache에 Enduser와 OriginServer 중간에서 Request와 Response에 개입할 수 있다.
- Lambda@Edge 를 사용하면 Lambda 함수를 실행하여 CloudFront에서 제공하는 콘텐츠를 사용자 지정하고 최종 사용자에게 더 가까운 AWS 위치에서 함수를 실행할 수 있습니다.
- 두 개의 오리진이 있는 오리진 그룹을 생성하여 Amazon CloudFront에서 오리진 장애 조치를 설정합니다. 하나는 기본 원점으로 지정하고 다른 하나는 두 번째 원점으로 지정합니다. 이 구성을 사용하면 기본 오리진이 특정 HTTP 상태 코드 실패 응답을 반환하는 경우 CloudFront 서비스가 두 번째 오리진으로 자동 전환됩니다.
- no-store는 캐시를 저장하지않는것이며, no-cache는 캐시가 유효한지 서버에 매번 질의하는것이며, max-age는 설정한 시간까지 캐시를 활용하고, 이후 시간에는 304 Not Modified 응답(요청된 리소스를 재전송할 필요가 없음)을 받을때에만 캐시를 이용한다
- Amazon inspector는 애플리케이션의 기능이 아닌 EC2 인스턴스의 보안 취약점만 검사하기 때문에 잘못된 것입니다. 
- Amazon ECS 를 사용하면 민감한 데이터를 AWS Secrets Manager 암호 또는 AWS Systems Manager Parameter Store 파라미터에 저장한 다음 컨테이너 정의에서 참조하여 민감한 데이터를 컨테이너에 주입할 수 있습니다. 이 기능은 EC2 및 Fargate 시작 유형을 모두 사용하는 작업에서 지원됩니다.
- Docker Secret은 Docker Swarm과 사용가능하다
- 어떠한 형태로든 Crendential 정보를 S3에 넣는건, 많은 비부가가 발생한다
- AWS ECS의 경우 agent는 중요한 역활을 한다. task의 컨테이너를 실행시킬 수도있고, task와 EC2 meta-data에서 정보등을 가져올 수있다
- Force new deployment 옵션 은 를 지정할 때 최신 플랫폼 버전을 사용하도록 Fargate 작업을 업데이트할 때도 사용됩니다
- --platform-version 옵션은 원하는 이미지 버전이 아니라 ECS에서 사용할 Fargate 플랫폼을 지정하는 데 주로 사용되기 때문입니다.
- ECS에 "재배포" 배포 전략 옵션, 자동플랫폼 버전업그레이드 기능활성화는 없기 때문에 올바르지 않습니다.
- DynamoDB 는 두 가지 유형의 보조 인덱스를 지원합니다.
    - 글로벌 보조 인덱스
        - 기본 테이블에 있는 것과 다를 수 있는 파티션 키 및 정렬 키가 있는 인덱스입니다. 글로벌 보조 인덱스는 인덱스에 대한 쿼리가 모든 파티션에서 기본 테이블의 모든 데이터에 걸쳐 있을 수 있기 때문에 "글로벌"로 간주됩니다.
    - 로컬 보조 인덱스
        - 기본 테이블과 파티션 키는 같지만 정렬 키는 다른 인덱스입니다. local secondary index는 local secondary index의 모든 파티션이 동일한 파티션 키 값을 갖는 기본 테이블 파티션으로 범위가 지정된다는 점에서 "로컬"입니다.
- 서비스 제어 정책(SCP)은 단순히 SCP가 적용되는 계정의 사용자 및 역할에 관리자가 위임할 수 있는 서비스와 작업을 결정
- AWS Trusted Advisor는 비용 최적화, 보안, 내결함성, 성능 및 서비스 제한이라는 5가지 범주에서 클라우드 인프라가 모범 사례 및 권장 사항을 준수하는지 확인하는 데 주로 사용됩니다.
- IAM 정책을 설정하면 완전히 제한되기 때문에 올바르지 않습니다.
- AWS Lambda 및 CloudWatch Events를 통합하여 VPC 내에서 실행 중인 Amazon EC2 인스턴스 목록을 검색하는 일일 프로세스를 예약합니다. 이들 중 승인되지 않은 AMI를 기반으로 하는 것이 있는지 확인하도록 기능을 구성합니다. Amazon SNS 주제에 새 메시지를 게시하여 보안 및 개발 팀에 문제가 발생했음을 알리고 EC2 인스턴스를 자동으로 종료합니다.
- AWS Systems Manager Patch Manager 는 보안 관련 업데이트로 관리형 인스턴스에 패치를 적용하는 프로세스를 자동화합니다. 패치기준으로 승인,거부목록이 가능하며 태그별로 가능하고 기간설정을 통해 예약작업도 가능하다
- QuickSight 및 Kibana가 주로 패치 관리가 아니라 데이터 시각화에 사용되기 때문에 올바르지 않습니다.
- AWS OpsWorks는 Chef 및 Puppet의 관리형 인스턴스를 제공하는 단순한 구성 관리 서비스입니다.
- AWS System manager의 PatchManager는 patch-baseline 을 사용합니다. 여기에는 릴리스 후 며칠 이내에 패치를 자동 승인하는 규칙과 승인 및 거부된 패치 목록이 포함됩니다.
- System Manager의 패치그룹은 인스턴스 태그 기준으로 묶을 수 있으며, OS유형, 환경유형(DEV,PRD), 서비스 유형 등을 묶을수있다
- EBS 스냅 샷용 Amazon DLM(데이터 수명 주기 관리자) 은 Amazon EBS 볼륨에 저장된 데이터를 백업하는 간단하고 자동화된 방법을 제공합니다.
- Oracle RAC 는 Amazon RDS 및 Aurora가 지원하지 않기 때문에 Amazon EC2를 사용한 배포를 통해서만 지원됩니다. Amazon RDS는 다중 테넌트 데이터베이스, RAC(Real Application Clusters), 통합 감사, Database Vault 등과 같은 Oracle의 특정 기능을 지원하지 않습니다.
- 임시 보안 자격 증명과 IAM 역할을 제공하는 AssumeRoleWithWebIdentity API와 함께 Web Identity Federation을 사용하여 이를 달성할 수 있습니다. Amazon Cognito를 사용하여 프로세스를 단순화할 수도 있습니다.
- 인증 토큰을 받은 다음 해당 토큰을 AWS 계정의 리소스를 사용할 권한이 있는 IAM 역할에 매핑하는 AWS의 임시 보안 자격 증명으로 교환할 수 있습니다.
- AWS 액세스 및 비밀 키를 사용하여 사진과 비디오를 S3 버킷에 저장하고 텍스트 기반 보고서를 DynamoDB 테이블에 유지하도록 모바일 애플리케이션을 구성하는 것은 보안위험이다
- Security Assertion Markup Language 2.0(SAML 2.0)
- Amazon GuardDuty는 주로 AWS 계정과 워크로드를 보호하기 위해 악의적이거나 승인되지 않은 동작을 지속적으로 모니터링하는 위협 감지 서비스로 사용
- AWS Shield Advanced 서비스가 AWS 리소스에서 DDoS 공격을 방지하는 데 더 적합
- AWS Systems Manager 유지 관리 기간(maintenance window)을 사용하면 운영 체제 패치, 드라이버 업데이트 또는 소프트웨어나 패치 설치와 같이 인스턴스에 잠재적인 중단 작업을 수행할 시기에 대한 일정을 정의할 수 있습니다. 각 유지 관리 기간에는 일정, 최대 기간, 등록된 대상 집합(작동되는 인스턴스) 및 등록된 작업 집합이 있습니다. 또한 유지 관리 기간이 전후에 실행되지 않아야 하는 날짜를 지정할 수 있으며 유지 관리 기간 일정의 기준이 되는 국제 표준 시간대를 지정할 수 있습니다.
- 세션 관리자는 주로 인스턴스에 대한 액세스를 제어해야 하는 기업 정책을 준수하는 데 사용되기 때문입니다. , 엄격한 보안 관행, 인스턴스 액세스 세부 정보가 포함된 완전히 감사 가능한 로그(OS 패치 적용용 제외)
- AWS Systems Manager State Manager는 Amazon EC2 및 하이브리드 인프라를 사용자가 정의한 상태로 유지하는 프로세스를 자동화하는 안전하고 확장 가능한 구성 관리 서비스로 주로 사용. State Manager를 사용하면 시작 시 특정 소프트웨어로 부팅하도록 인스턴스를 구성할 수 있습니다. 네트워크 설정 및 기타 여러 구성을 구성하지만 EC2 인스턴스의 패치는 구성하지 않습니다.
- 자정에 실행되도록 예약된 CloudWatch 이벤트 규칙을 생성하는 것입니다. EC2 CreateSnapshot API를 직접 호출하여 필요한 EBS 볼륨의 스냅샷을 생성하도록 대상을 설정합니다.
- CodeBuild에서 AWS CodeCommit, S3, GitHub, GitHub Enterprise 및 Bitbucket에 연결하여 빌드의 소스 코드를 가져올 수 있습니다.
- CodeBuild는 지원되는 버전(JAva, python 등)의 Docker 이미지 이용
- AWS CodeCommit에서 SSH를 사용하려면 사용자가 자체 퍼블릭-프라이빗 키 페어를 생성한 다음 퍼블릭 키를 IAM 사용자에게 추가합니다. 프라이빗 키는 AWS CodeCommit로 통신을 암호화합니다.
- AWS CodeCommit에서 리포지토리를 암호화하는건 KMS를 통해 자동으로 진행된다
- DynamoDB 테이블과 연결된 DynamoDB 스트림으로 Lambda 함수를 구독하여 DynamoDB 테이블 업데이트에 대한 Lambda 함수를 트리거할 수 있습니다. 또는 Lambda의 registerEventSource API를 사용하여 DynamoDB 스트림과 Lambda 함수를 연결할 수 있습니다.
- Lambda의경우, 샤드 내 레코드 순서를 보장한다. 서로 다른 샤드에서의 레코드 순서는 보장되지 않으며 각 샤드 처리는 병렬로 진행됩니다. 하나의 레코드를 처리하고, 다음 레코드 처리를 보장하기때문에 레코드 처리가 실패한다면 레코드 처리가 성공할때까지 만료시간인 24시간 이내로 재시도한다
- Amazon DynamoDB Streams, Amazon Kinesis Streams 등 AWS Lambda에서 폴링하는 순차적인 이벤트 소스의 경우 개발자 코드 오류가 발생하면 데이터가 만료될 때까지 Lambda에서 계속 실행을 시도합니다. Amazon S3 버킷 알림 및 사용자 지정 이벤트의 경우, 코드에 오류 조건이 발생하거나 서비스 또는 리소스 한도를 초과하면 AWS Lambda는 함수 실행을 세 번 시도합니다.
- Lambda는 SNS의 주제를 구독해서 실행될 수 있으며, Cloudwatch alarm이 SNS의 주제를 구독하게해서 연결도 가능하다
- CloudFormation과 함께 Systems Manager Parameter Store를 사용하여 템플릿에 대한 최신 AMI ID를 검색하는 것입니다. Amazon EC2 인스턴스를 업데이트하기로 결정할 때마다 템플릿의 CloudFormation에서 update-stack API를 호출합니다.
- NAT(네트워크 주소 변환) 게이트웨이 를 사용 하여 프라이빗 서브넷의 인스턴스가 인터넷이나 다른 AWS 서비스에 연결되도록 할 수 있지만 인터넷이 해당 인스턴스와의 연결을 시작하지 못하도록 할 수 있습니다.
- VPC 엔드포인트를 사용하면 VPC를 PrivateLink에서 제공하는 지원되는 AWS 서비스 및 VPC 엔드포인트 서비스에 비공개로 연결할 수 있습니다. 이렇게 하면 공용 인터넷에 연결할 수 없습니다.
- 여러 AZ에 걸쳐 있는 ElastiCache 클러스터를 사용하여 세션 관리를 위한 분산 캐시를 설정해야 합니다. 메모리 내 키/값 저장 소용 ElastiCache 제품에는 읽기전용 복제본을 통해 복제를 지원할 수 있는 Redis용 ElastiCache와 복제를 지원하지 않는 Memcached용 ElastiCache 가 있습니다. 복제가 되지않을경우, 노드가 소실되도 완전히 데이터가 지워지지않는다. 고정 세션은 인스턴스 실패 시, 데이터가 날아갈 수 있으며 스케일 아웃 등을 진행하면 특정서버에 상주하게될 수 있다
- CloudFormation은 현재 다음과 같은 동적 참조 패턴을 지원합니다.
    - ssm, AWS Systems Manager Parameter Store에 저장된 일반 텍스트 값
    - ssm-secure, AWS Systems Manager Parameter Store에 저장된 secure-string
    - secretsmanager, AWS Secrets Manager에 저장된 전체 암호 또는 특정 암호 값
- Edge-optimized API는 CloudFront 배포를 사용하여 일반적으로 AWS 리전 전체에서 클라이언트 액세스를 용이하게 하는 동안 지정된 리전에 배포되는 API Gateway의 기본 호스트 이름입니다.
- Direct Connect 연결을 설정하는 데 많은 비용발생한다.
- 온프레미스 인스턴스의 인증 및 등록을 최대한 제어하기 위해 register-on-premises-instance명령을 사용하고 AWS Security Token Service(AWS STS)로 생성된 주기적으로 새로 고쳐진 임시 자격 증명을 사용할 수 있습니다. IAM 역할은 온프레미스 서버에 직접 연결할 수 없습니다. 서버가 수임할 수 있는 정적 IAM 역할을 사용하여 CodeDeploy에서 온프레미스 서버를 "온프레미스 인스턴스"로 설정해야 합니다.
- AWS Systems Manager Parameter Store에 대한 액세스 권한을 부여하려면 IAM 정책이 아니라 IAM 역할을 사용해야 합니다.
- 단순히 S3 버킷의 버킷 정책을 구성하는 것만으로는 필수 보안 헤더가 있는 HTTP 응답을 반환할 수 없기 때문에 올바르지 않습니다.
- AWS WAF를 사용하여 API 게이트웨이 앞에 웹 액세스 제어 목록을 추가하여 악성 SQL 코드가 포함된 요청을 차단하는 것입니다. AWS Config를 사용하여 WAF 규칙 구성에 대한 업데이트를 포함하여 규칙 생성 및 삭제와 같은 웹 액세스 제어 목록(웹 ACL)에 대한 변경 사항을 추적합니다.
- CloudFront도 WAF와 쓸 수 있지만 비용이 추가된다. 서버리스 온라인 포털은 확장 가능하고 전 세계에서 액세스할 수 있어야 한다는 요구 사항이 없으므로 CloudFront 배포는 관련이 없습니다.
- AWS Firewall Manager는 주로 AWS Organizations의 여러 AWS 계정에서 방화벽을 관리하는 데 사용됩니다.
- 별칭 트래픽 이동의 도입으로 이제 Lambda 함수의 카나리아 배포를 간단하게 구현할 수 있습니다. 별칭에 대한 추가 버전 가중치를 업데이트하면 지정된 가중치에 따라 호출 트래픽이 새 기능 버전으로 라우팅됩니다.
- Amazon Inspector 보안 평가는 Amazon EC2 인스턴스의 의도하지 않은 네트워크 액세스 가능성과 해당 EC2 인스턴스의 취약점을 확인하는 데 도움이 됩니다.
- Amazon GuardDuty는 AWS 계정을 보호하기 위해 악의적인 활동과 무단 동작을 지속적으로 모니터링하는 위협 탐지 서비스이다.
- CloudWatch log agent는 이전과 통합이 있는대, 통합은 window도 제공한다.
- Amazon CloudWatch 대시보드 설정은 단일 보기에서 리소스를 모니터링해야 하는 시나리오에 주로 사용되기 때문에 적합하지 않습니다.
- 로그 데이터를 대화식으로 검색하고 분석할 수 있으므로 대신 CloudWatch Logs Insights를 사용하는 것이 좋습니다.
- AWSServiceRoleForOrganizations 서비스 연결 역할은 주로 AWS Organizations가 다른 AWS 서비스에 대한 서비스 연결 역할을 생성하도록 허용하는 데만 사용됩니다. 이 서비스 연결 역할은 특정 OU뿐만 아니라 모든 조직에 있습니다.
- CloudFront는 뷰어와 그리고 오리진과 HTTPS 통신을 할 수 있도록 설정이 가능하며, 각각의 인증서는 AWS Certificate Manager(ACM)에서 제공하는 인증서를 사용할 수 있으며 타사에서 제공하는 신뢰되는 인증서를 ACM에 저장해서 쓸 수 있다.
- 손상된 EC2 인스턴스를 자동으로 모니터링하고 복구하는 CloudWatch, AWS Lambda 및 AWS Systems Manager Run Command를 설정하는 것은 AWS Systems Manager Automation을 사용하여 쉽게 수행할 수 있는 운영 오버헤드입니다. EC2Rescue 도구를 사용하여 Amazon EC2 Linux 및 Windows Server 인스턴스의 문제를 진단하고 해결하는 것입니다. Systems Manager Automation 및 AWSSupport-ExecuteEC2Rescue문서를 사용하여 도구를 자동으로 실행합니다.
- AWS-DefaultPatchBaseline기준선은 주로 "CriticalUpdates" 또는 "SecurityUpdates"로 분류되고 MSRC 심각도가 "Critical" 또는 "Important"인 모든 Windows Server 운영 체제 패치를 승인하는 데 사용됩니다 . 패치는 릴리스 후 7일이 지나면 자동 승인됩니다.
- 모든 Amazon EC2 Windows 인스턴스에 할당할 고유한 태그로 두 개의 패치 그룹을 설정합니다. AWS-DefaultPatchBaseline두 패치 그룹에 미리 정의된 기준선을 연결합니다 . 두 개의 겹치지 않는 유지 관리 기간을 설정하고 각각을 다른 패치 그룹과 연결합니다. 패치 그룹 태그를 사용하여 특정 유지 관리 기간에 대상을 등록합니다. AWS-RunPatchBaseline처리 시작 시간이 다른 각 유지 관리 기간 내 작업으로 문서를 할당하는 것이 정답입니다.
- 필드수준암호화는 CloudFront를 만나는 순간, Origin까지 암호화가 유지된다. 클라이언트가 제공하는 민감한 정보는 사용자에게 더 가까운 에지에서 암호화되고 전체 애플리케이션 스택에서 암호화된 상태로 유지되므로 데이터가 필요하고 이를 해독할 자격 증명이 있는 애플리케이션만 그렇게 할 수 있습니다.
- 필드 수준 암호화를 사용하려면 암호화하려는 POST 요청의 필드 세트와 이를 암호화하는 데 사용할 공개 키를 지정하도록 CloudFront 배포를 구성합니다.
- AWS Inspector 라는 옵션 은 잘못된 것입니다. 이 서비스는 AWS에 배포된 애플리케이션의 보안 및 규정 준수를 개선하는 데 도움이 되는 자동화된 보안 평가 서비스이기 때문입니다. 인스턴스에서 가능한 악의적 활동은 감지하지 않습니다.
- 이벤트 로그를 AWS CloudWatch Logs로 보내는 Lambda 함수를 생성하고 CodeCommit 리포지토리를 선택하여 트리거를 설정하는 것입니다. CodeCommit에서 새 트리거를 생성할 때 리포지토리 설정으로 이동하고 트리거 목록에서 Lambda 함수를 선택합니다. 이벤트탭은 없고, 알림 탭은 있기때문에 SNS를 통해서도 가능하다
- Amazon S3 API 호출이 PUT 또는 DELETE 버킷 정책, 버킷 수명 주기, 버킷 복제 또는 버킷 ACL을 PUT할 때 트리거되는 Amazon CloudWatch 경보를 생성할 수 있습니다. CloudTrail 추적은 로그를 CloudWatch Log 그룹으로 보내므로 필요합니다. 경보를 생성하려면 먼저 메트릭 필터를 생성한 다음 필터를 기반으로 알람을 구성해야 합니다.
- S3 서버 액세스 로깅은 주로 버킷에 대한 요청에 대한 자세한 레코드를 제공하는 데 사용된다. 보안 및 엑세스 감사에 유용하다.
- CloudWatch 이벤트를 사용하여 CloudWatch logs의 로그 그룹을 직접 필터링할 수 없다
- 조직의 모든 구성원에 대해 보안 계정을 GuardDuty 관리자로 구성합니다. 
- 모든 결과를 Amazon Kinesis Data Firehose로 보내도록 CloudWatch 이벤트 규칙을 구성하기만 하면 결과가 S3 버킷으로 푸시됩니다.
- GuardDuty를 사용하면 여러 계정에서 쉽게 활성화하고 관리할 수 있습니다. 다중 계정 기능을 통해 모든 구성원 계정 결과를 GuardDuty 관리자 계정으로 집계할 수 있습니다. 이를 통해 보안 팀은 단일 계정에서 조직 전체의 모든 GuardDuty 결과를 관리할 수 있습니다. 집계된 결과는 CloudWatch 이벤트를 통해서도 제공되므로 기존 엔터프라이즈 이벤트 관리 시스템과 쉽게 통합할 수 있습니다.
- Lambda는 적절한 IAM 권한이 있어도 SSH 연결을 직접 설정하고 EC2 인스턴스 내에서 명령을 실행하여 구성 파일을 업데이트할 수 없습니다.
- 키워드 List, Get 또는 Describe로 시작하는 API 작업의 이벤트는 EventBridge에서 처리되지 않습니다.
- Amazon Athena에서 쿼리 상태 전환에 대한 Amazon CloudWatch Events가 게시됩니다. 쿼리 상태가 전환되면(예: Running(실행 중)에서 Succeeded(성공) 또는 Cancelled(취소)로) Athena가 CloudWatch Events에 쿼리 상태 변경 이벤트를 게시합니다.
- Amazon CloudWatch Events는 ACM의 인증서 Expiration을 알람받을 수 있다
- Amazon CloudWatch Events는 CodeBuild의 state와 phase 변화를 확인할 수 있다
- Amazon CloudWatch Events는 CodeCommit의 Commit의 코멘트, 리코멘트, PR 그리고 Repo의 변경사항을 확인할 수 있다
- Amazon CloudWatch Events는 System Manager의 모든 요소의 변경사항을 확인할 수 있다
- Amazon CloudWatch Events는 Trust Advior의 새로고침 알람을 받을 수 있다
- Amazon CloudWatch Events는 S3의 Object의 생성,삭제 스토리지 클래스 전환(IA->Glacier), 태깅등을 확인할 수 있다.
- Amazon CloudWatch Events는 EC2의 스냅샷, 볼륨 등을 확인할 수 있다
- Amazon CloudWatch Events는 ASG의 인스턴스의 refresh, launch, terminate알림을 받을 수 있다
- Amazon CloudWatch Events는 RDS의 클러스터, 보안그룹(SG), 파라미터그룹(PG),스냅샷, 인스턴스 등의 알림을 받을 수 있다
- CloudWatch 대시보드는 AWS Organizations의 구성이 아니라 AWS 리소스를 모니터링하는 데 주로 사용
- AWS Config의 다중 계정, 다중 리전 데이터 집계를 사용하면 여러 계정 및 리전의 AWS Config 데이터를 단일 계정으로 집계할 수 있습니다.
- Amazon CloudTrail에서 새 추적을 시작하여 AWS Organizations 콘솔의 호출을 포함하여 AWS Organizations에 대한 모든 API 호출을 캡처합니다. 또한 AWS Organizations API에 대한 모든 코드 호출을 추적합니다. CloudWatch Events와 Amazon SNS를 통합하여 조직에서 관리자가 지정한 작업이 발생할 때 이벤트를 발생시키고 알림을 보내도록 구성합니다.
- AWS 상태 이벤트는 CloudWatch Log 그룹에 자동으로 전송되지 않습니다.
- CloudWatch Event에 사용자 지정지표를 푸시할 수는 없다. CloudWatch에 사용자 지정지표로 Metric을 보낼 수 있다. metric은 시스템 성능에 대한 지표이며, AWS는 기본적으로 제공하고 데이터를 15개월 정도 보관한다
- Auto Scaling의 수명 주기 후크에 대한 알림 대상으로 사용할 수 없기 때문에 잘못된 정보입니다. 그룹. Amazon CloudWatch Events, Amazon SNS 또는 Amazon SQS만 알림 대상으로 구성할 수 있습니다.
- S3 버킷에서 객체 수준 API 작업을 기록할 수 있습니다. Amazon CloudWatch Events가 이러한 이벤트와 일치하려면 먼저 AWS CloudTrail을 사용하여 이러한 이벤트를 수신하도록 구성된 추적을 설정해야 합니다.
- 데이터 이벤트의 예는 다음과 같습니다. Amazon S3 객체 수준 API 활동(예: GetObject, DeleteObject및 PutObjectAPI 작업) AWS Lambda 함수 실행 활동( InvokeAPI)
- Amazon SNS 주제에 대해 CodeCommit 리포지토리와 동일한 계정을 사용하여 Amazon SNS 주제를 생성한 경우 추가 IAM 정책 또는 권한을 구성할 필요가 없다.

### examtopics
```
84 114 116 122 124 159 171
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
- Amazon Inspector와 CloudTrail 통합의 경우 List* 및 Describe* API의 경우 요청 정보만 기록됩니다.
- 제품이 여러 국가에서 출시될 때 기업은 모든 지역에 걸쳐 단일 제품 카탈로그를 원하지만 규정 준수를 위해 고객 정보 및 구매는 각 영역에 유지되어야 합니다. 제품 카탈로그의 읽기 전용 복제본과 함께 Aurora를 사용하고 고객 정보 및 구매를 위한 각 지역의 추가 로컬 Aurora 인스턴스를 사용합니다
- Amazon SNS alarm은 존재하지않으며, Amazon SNS notification 존재한다.
- cfnsignal
- Amazon EC2를 설정(표준 로깅, 메트릭, 보안평가, 주간패치)을 표준화하기위해서는
    - 중앙에서 인스턴스를 관리하려면
    - AWS Config를 사용하여 모든 EC2 인스턴스가 AWS Systems Manager에서 관리되도록 합니다.
    - AWS Systems Manager를 사용하여 모든 인스턴스에 Amazon Inspector, Systems Manager Patch Manager 및 Amazon CloudWatch 에이전트를 설치하고 관리합니다.
    - Systems Manager Run Command와 함께 AWS Systems Manager 유지 관리 기간을 사용하여 Systems Manager Patch Manager 작업을 예약합니다. Amazon CloudWatch Events를 사용하여 Amazon Inspector 평가 실행을 예약합니다.
-  AWS Import/Export 서비스는 스노우볼에서 사용된다. VM Import/Export 서비스는 따로있다. Amazon Linux 2는 온프레미스의 가상환경(VMWare vSphere, KVM, Oracle VirtualBox, MS Hyper-V)에서 실행될 수 있도록 image를 다운받을 수 있다
- 지연 시간을 줄이기 위해 Auto Scaling 전략은 처리 중인 요청 수 및 처리 대기 중인 요청 수와 같은 웹 애플리케이션에 대한 보다 자세한 정보가 포함된 애플리케이션용 CloudWatch에 사용자 지정 지표를 푸시합니다.
- 6개 지역 모두에서 액세스하려면, 6개 리전(북미 2개, 유럽 2개, 아시아 2개) 각각에서 Amazon DynamoDB 글로벌 테이블을 구현합니다.
- 단일 도구 또는 서비스를 통해 액세스 가능한 통합 애플리케이션 및 Amazon API 로그를 유지하는 방법은
    - Amazon CloudWatch 에이전트를 사용하여 Amazon EC2 인스턴스에서 CloudWatch로 로그를 보냅니다. 이러한 로그를 Amazon S3로 보내도록 Amazon Kinesis Data Firehouse 로그 그룹 구독을 구성합니다. AWS CloudTrail을 사용하여 API 로그를 Amazon S3로 전송합니다. Amazon Athena를 사용하여 Amazon S3의 두 로그 세트를 모두 쿼리합니다.
- Amazon EBS 스토리지에 의해 백업되는 Amazon EC2 인스턴스의 복구는 StatusCheckFailed 지표에 대한 AWS CloudWatch Alarm을 생성하고, EC2 작업을 선택하여 인스턴스를 복구합니다
-  배포 시 각 마이크로 서비스의 업데이트된 버전으로 트래픽을 천천히 전송해야 합니다.
    - 배포할 AWS CodeDeploy 구성을 설정한 다음 CodeDeployDefault.LambdaLinear10PercentEvery3Minutes
- ASG의 EC2 구성파일을 Cloudformation을 통해 최신화 반영을하려면
    - Cloud Formation 초기화 메타데이터를 템플릿에 추가한다
    - Configuration파일을 meta-data에 배치한다
    - 인스턴스가 시작될 때 실행되도록 cfn-init 스크립트를 구성하고 구성 업데이트를 폴링하도록 cfn-hup 스크립트를 구성합니다.
- DynamoDB에서 보조 인덱스는 쿼리 작업을 지원하는 대체 키와 함께 테이블의 속성 하위 집합을 포함하는 데이터 구조입니다.
- Amazon EFS에 대한 백업 전략으로 백업 활동의 시작/중지를 예약하기 위해 Amazon CloudWatch Events 규칙과 함께 AWS Lambda를 사용합니다. Auto Scaling 그룹의 Amazon EC2에서 백업 스크립트를 실행합니다. Auto Scaling 수명 주기 후크와 EC2에서 SSM Run Command를 사용하여 Amazon S3에 백업 로그를 업로드합니다. Amazon SNS를 사용하여 백업 활동 메타데이터를 관리자에게 알립니다.
- CodeBuild와 CodeDeploy에는 승인 프로세스가 없습니다. CodePipeline에는 있음
- CodePipeline은 나머지 API 엔드포인트를 호출하지 않으므로 lambda가 필요합니다
- 사용자는 항상 원본 스냅샷 크기보다 더 큰 크기의 새 EBS 볼륨을 생성할 수 있습니다. 사용자는 더 작은 크기의 볼륨을 생성할 수 없습니다
- IAM 정책 내에서 IfExists는 Null 조건을 제외한 모든 조건 연산자의 끝에 추가할 수 있습니다. 
- AWS Personal Health Dashboard에서만 찾을 수 있는 "AWS 예약 EC2 유지 관리 알림"(AWS about planned EC2 maintenance)
- Amazon S3의 메타데이터 캐시 생성을 효율적으로 하기위해서는 새 DynamoDB 테이블을 생성합니다. 새로운 DynamoDB 테이블을 사용하여 Amazon S3에 업로드된 모든 객체에 대한 모든 메타데이터를 저장합니다. 새 객체가 업로드될 때마다 DynamoDB에서 애플리케이션의 내부 Amazon S3 객체 메타데이터 캐시를 업데이트하십시오.
- AWS CloudFormation 템플릿을 사용하여 로드 밸런서 뒤에 애플리케이션을 다시 배포하고, 각 배포 중에 새 AWS CloudFormation 스택을 시작하고, 새 로드 밸런서를 가리키도록 Amazon Route53 별칭 리소스 레코드 세트를 업데이트하고, 마지막으로 이전 AWS를 종료합니다. CloudFormation 스택
- 수많은 클라이언트가 동일한 레코드에 쓰려고 할 때 개발자는 프로그램의 신뢰성을 어떻게 향상시킬 수 있습니까 지터를 사용하여 오류 재시도 및 지수 백오프를 구현합니다.
- Beanstalk를 사용하려는 경우 비용을 절감할 때 작동하는 롤링 배포 옵션보다 추가 배치로 롤링 배포를 선택하는 것이 좋습니다.
- DynamoDB를 사용하고 AWS OpsWorks와 AWS Elastic Beanstalk 모두
DynamoDB를 직접 지원하지 않으므로 CloudFormation 및 Blue-Green을 선택하는 옵션이 맞습니다.
- NAT게이트웨이는 여러 가용영역에 걸쳐있지않다
- ElasticBeanstalk랑 Opswork는 지속적으로 폴링되는 인스턴스를 필요로하며, Cloudformation은 폴링이 필요없고 상시작동 인스턴스가 없다
- Auto Scaling에서 애플리케이션이 응답을 중지한 인스턴스를 교체하도록 하려면 구성 파일을 사용하여 Elastic Load Balancing 상태 확인을 사용하도록 Auto Scaling 그룹을 구성할 수 있습니다.
- Amazon SNS 주제를 생성하고 대상 이메일 주소가 포함된 이 주제에 대한 구독을 생성합니다. Amazon CloudWatch 규칙 생성: aws.opsworks를 소스로 지정하고 started_by 세부 정보에서 자동 복구를 지정합니다. SNS 주제를 대상으로 사용합니다. OpsWorks Stacks의 자동 복구 기능(specify auto-healing)을 활성화한다면, 인스턴스가 다시 실행하게될 때 알람을 받을 수 있다.
- s3 멀티파트 업로드는 크기가 큰 파일을 전송하는데 적합하며, S3 Transfer Acceleration는 장거리 전송에 적합한 옵션이다
- EC2에서 EBS 관련처리를 하는 AWS CLI로는 ec2-create-snapshot API, ec2-describe-snapshot API, ec2-delete-snapshot-API 가 있다
- CodePipeline에서 AWS Lambda 작업을 사용하여 Lambda 함수를 실행하여 제품의 새 버전을 확인하고 AWS 서비스 카탈로그에 푸시합니다.
- 두 번째 ELB를 생성하고 새로운 Auto Scaling Group이 새로운 Launch Configuration을 할당합니다. 업데이트된 앱으로 새 AMI를 생성합니다. Route53 가중 라운드 로빈 레코드를 사용하여 두 ELB에 도달하는 트래픽의 비율을 조정합니다.
- ECS가 클러스터 인스턴스를 배포하는 데 사용하는 기본 AWS CloudFormation 템플릿을 복사합니다. 템플릿 리소스 EBS 구성 설정을 수정하여 ג€~Encrypted: Trueג€™를 설정하고 AWS KMS 별칭 ג€~aws/ebsג€™를 포함하여 AMI를 암호화합니다.
- AWS Config s3-bucket-server-side-encryption-enabled 관리형 규칙을 활성화하여 S3 기본 암호화가 활성화되지 않은 S3 버킷 또는 S3 버킷 정책 없이 객체 넣기 요청을 명시적으로 거부하지 않는 S3 버킷을 확인합니다. 서버 측 암호화. AWS-EnabledS3BucketEncryption 수정 작업을 AWS Config 규칙에 추가하여 수신 거부가 아닌 모든 S3 버킷에서 기본 암호화를 활성화합니다. AWS Config 조직 통합을 사용하여 조직의 모든 계정에 규칙을 배포합니다.
- AWS CodeDeploy에서 애플리케이션 배포 상태에 대한 Slack 알림을 받아야 합니다. CloudWatch 이벤트 규칙을 생성하여 CodeDeploy 작업의 결과를 감지하고 AWS SNS에 대한 알림을 대상으로 지정하거나 결과를 Slack 채널에 전송하는 Lambda 함수를 지정합니다.
- GitHub를 소스 공급자로 사용하고 AWS CodeDeploy를 배포 공급자로 사용하는 AWS CodePipeline 파이프라인을 생성합니다. 이 새 파이프라인을 GitHub 계정과 연결하고 CodePipeline이 GitHub의 웹훅을 사용하여 변경이 발생할 때 파이프라인을 자동으로 시작하도록 지시합니다.
- 사용자 인증 및 탄력적 IP 주소를 사용하여 프록시 서버를 생성하고 Amazon ES 엔드포인트의 액세스를 해당 IP 주소로 제한합니다.
- AWS CodePipeline을 사용하여 파이프라인을 생성한 다음 사용자 지정 작업 유형을 생성합니다. 작업 요청에 대해 CodePipeline을 폴링하고 테스트를 시작하고 결과를 반환하는 온프레미스 서버용 작업자를 생성합니다. 소스 단계 후에 사용자 지정 작업을 호출하도록 파이프라인을 구성합니다.
- Amazon Route 53 구성을 전용 AWS 계정으로 프로그래밍 방식으로 마이그레이션할 수 있다.
- RDS 데이터베이스의 스냅샷을 다른 계정에 복사합니다. RDS 데이터베이스의 읽기전용복제본은 다른 계정에 활성화 할 수 없음
- Elastic Beanstalk의 구성을 다른 계정에서 미러링할 수는 없다. 하지만 구성 파일을 다른 계정에 저장/복사는 가능하다.
- Amazon Aurora MySQL DB 클러스터가 애플리케이션을 구성할경우, 120분 응답 시간과 60분 응답 시간으로 준비해야한다면 가장 비용효율적인 방식은 Aurora DB 클러스터의 스냅샷을 생성하고 매시간 대상 리전에 복사합니다.
- Auto Scaling 서비스가 인스턴스를 종료하기 전에 비용을 낮게 유지하면서 인스턴스를 디버그할 수 있도록 하려면, 문제 해결을 완료할 때까지 인스턴스를 terminating:wait 상태로 유지하기 위해 Auto Scaling 그룹 수명 주기 후크를 생성합니다. 문제 해결이 완료되면 종료 상태가 만료될 때까지 기다리거나 Scaling에 알리고 수명 주기 후크를 완료하고 인스턴스를 종료합니다.
수명 주기 후크는 인스턴스를 대기 상태( Terminating:Wait)로 만든 다음 사용자 지정 작업을 수행합니다.
인스턴스는 수명 주기 작업을 완료하거나 제한 시간이 끝날 때까지(기본적으로 1시간) 대기 상태로 유지됩니다. 수명 주기 후크를 완료하거나 제한 시간이 만료되면 인스턴스가 다음 상태( Terminating:Proceed)로 전환됩니다.
- AWS Kinesis는 이벤트 스트림 서비스이며, 순서대로 프로그래밍된 이벤트에 대해 시스템 간에 버퍼 및 전송 역할을 할 수 있으므로 시스템 간에 API 호출 을 복제하는 데 이상적입니다.
- 보안 그룹은 지역에 묶여 있으며 동일한 지역의 인스턴스에만 할당할 수 있습니다.
- The update-trail command is used to change the configuration settings for a trail
- 메인 리전의 AMI 복사를 백업 리전으로 자동화합니다. AMI에서 EC2 인스턴스를 생성하고 로드 밸런서 뒤에 배치할 AWS Lambda 함수를 생성합니다. 동일한 Lambda 함수를 사용하여 Amazon Route 53 레코드가 백업 리전의 로드 밸런서를 가리키도록 합니다. 실패 시 Lambda 함수를 트리거합니다.
- AWS CodeDeploy는 블루/그린 배포 접근 방식을 사용하여 Amazon ECS에 애플리케이션을 배포하는 데 사용됩니다. 조직은 트래픽을 재라우팅하기 전에 애플리케이션의 그린 버전을 테스트할 스크립트를 작성하려고 합니다. CodeDeploy AppSpec 파일에 후크 섹션을 추가합니다. AfterAllowTestTraffic 수명 주기 이벤트를 사용하여 AWS Lambda 함수를 호출하여 테스트 스크립트를 실행합니다. 오류가 발견되면 오류와 함께 Lambda 함수를 종료하여 롤백을 트리거합니다.
- RTO가 4시간일경우 읽기 전용 복제본을 기본 데이터베이스로 변환하는 데 4시간이 걸리지 않습니다.
- 배포 전략으로 롤링 업데이트를 선택하면 코드가 손상되는 경우 예기치 않은 가동 중지 시간이 발생할 수 있음
- 배포와 관련된 가동 중지시간없이, 성공적인것으로 간주되기위해서는 어떡해 해야하는가? 
Application Load Balancer 및 AWS CodeDeploy 블루/그린 배포 유형과 함께 Amazon ECS 클러스터 및 서비스를 사용합니다. Amazon ECS에서 프로덕션 포트와 테스트 포트를 정의합니다. 애플리케이션을 테스트하는 AWS Lambda 함수를 작성하고 appspec.yml의 AfterAllowTestTraffic 후크 내에서 참조합니다.
- Amazon Cognito가 웹 자격 증명 연동에서 제공하는 기능의 상위 집합이라는 것입니다. 동일한 공급자를 지원하며 동일한 방식으로 앱을 구성하고 해당 공급자와 인증합니다.
- AMI 이미지를 사용하여 Amazon EC2 Auto Scaling 그룹을 생성하고 Auto Scaling 그룹의 CPU 사용률 평균을 75% 목표로 하는 조정 작업을 수행합니다. 그룹에 대해 예약된 작업을 만들어 업무 시간이 끝난 후 최소 인스턴스 수를 3개로 조정하고 업무 시간이 시작되기 전에 6개로 재설정합니다.
- 사용자는 IAM 정책에 대한 다양한 요소를 정의할 수 있습니다. 요소에는 버전, ID, 문, Sid, 효과, 주체, 주체 아님, 작업, 동작 아님,
리소스, 리소스 아님, 조건 및 지원되는 데이터 유형이 포함됩니다.
- 액세스 로깅은 기본적으로 비활성화되어 있는 Elastic Load Balancing의 선택적 기능입니다.
- Auto Scaling 그룹에 수명 주기 후크를 추가하여 Terminating 상태의 인스턴스를 Terminating:Wait 상태로 이동합니다.
- Cloudformation StackSets는 여러 계정에 동일한 스택을 배포하는 데 사용할 수 있습니다. 스택 세트는 리전 리소스입니다. 한 리전에 스택 세트를 생성하면 다른 리전에서 해당 스택 세트를 보거나 변경할 수 없습니다.
- 승인된 CloudFormation 템플릿으로 AWS 서비스 카탈로그 제품을 생성합니다.
- 암호화되지않은 EBS 스냅샷을 공유할 수 있다. KMS 암호화된 스냅샷은 공유가되지않으며, 고객관리형 키로 암호화했을경우 키도 공유해야한다.
- 새 이미지를 Amazon S3에 업로드하고 Amazon SQS 대기열에서 메시지를 삭제하기 전에 이미지의 크기를 조정하고 워터마크를 지정합니다.
- Amazon Elastic Transcoder 서비스는 이미지가 아닌 비디오와 연관된 서비스
- 모든 계정에 대해 Organizations 마스터 계정에서 AWS Config 집계기를 구성합니다.
- 기업 IAM 정책과 일치하는 조직의 모든 계정에(마스터 계정이 아닌) AWS Config 규칙을 배포합니다.
- SCP는 기업 정책 접근 방식에 포함되지만 IAM 규정 준수에 대한 질문에 응답하고 있다고 생각하지 않습니다.
- 스팟 인스턴스가 온디맨드보다 가장 저렴한 옵션이며 AMI를 생성하는 데 몇 분 이상 걸리는 경우 최소 실행 기간을 사용할 수 있습니다.
- 사용하지않는 EBS를 삭제할수있는 방법은?
    - Lambda함수로 OpsCenterAPI를 사용할 수 있다. 매일 AWS Lambda 함수를 실행하는 Amazon CloudWatch Events 규칙을 생성합니다. Lambda 함수는 연결되지 않은 EBS 볼륨을 찾아 현재 날짜로 태그를 지정하고 14일이 지난 날짜가 포함된 태그가 있는 연결되지 않은 볼륨을 삭제해야 합니다.
-  Amazon Cloud Watch Events를 CodePipeline에 구독하여 배포 테스트 전후에 모든 EC2 및 RDS 인스턴스를 시작 및 중지하는 AWS Systems Manager Automation 문서를 트리거합니다.
- DynamoDB 글로벌 테이블을 설정합니다. DynamoDB가 실행 중인 두 리전 각각에서 ELB 뒤에 Auto Scaling 그룹을 생성합니다. 두 리전의 ELB를 리소스 레코드로 사용하여 DNS 장애 조치가 있는 Route53 지연 시간 DNS 레코드를 추가합니다.
- 스팟 블록 리소스라는건 없고 spot fleet(스팟 플릿)은 존재한다
- 스팟 fleet을 사용하려면 할당 전략을 반드시 사용해야하며, 용량 최적화 정책(capacity-optimized allocation strategy)을 사용할 수 있다
- AWS::AutoScaling::AutoScalingGroup 리소스는 UpdatePoIicy 속성을 지원합니다. 이는 Cloud Formation 스택에 대한 업데이트가 발생할 때 Auto Scalinggroup 리소스가 업데이트되는 방식을 정의하는 데 사용됩니다
- 기존 환경과 병행하여 별도의 환경으로 변경 사항을 도입합니다. 카나리아 릴리스 배포를 사용하여 사용자 트래픽의 작은 하위 집합을 새 환경으로 보내도록 API Gateway를 구성합니다.
- AWS CloudTrail을 사용하면
특정 모니터링 지표가 발생하도록 로그를 AWS Cloudwatch Logs 및 S3에 전달할 수 있습니다.
- 동일한 경로에 사용자와 사용자 그룹이 있는 경우 IAM은 자동으로 해당 사용자를 해당 사용자 그룹에 넣지 않습니다.
- 경로를 사용하여 동일한 그룹의 사용자 분리할 수 있다
- lastic Beanstalk를 사용하여 애플리케이션을 배포하고 Elastic Beanstalk 환경 속성을 사용하여 외부 RDS MySQL 인스턴스에 연결합니다. 블루/그린 배포에 Elastic Beanstalk 기능을 사용하여 새 릴리스를 별도의 환경에 배포한 다음 두 환경에서 CNAME을 바꿔 트래픽을 새 버전으로 리디렉션합니다.
- AWS CloudFormation을 사용하여 서버리스 애플리케이션을 정의하고 AWS CodeDeploy를 사용하여 DeploymentPreference: Canary10Percent15Minutes를 사용하여 AWS Lambda 함수를 배포합니다.
- 추적에서 CloudTrail 파일 무결성 기능을 활성화합니다. CloudTrail에서 생성한 다이제스트 파일을 사용하여 전달된 CloudTrail 파일의 무결성을 확인합니다.

### examtopics_answer
- 191. D :: ELB
    - 엑세스로그에 접근하는게 default인가, 사용자가 설정해야하는가?
- 192. C :: ASG
- 193. D :: CloudFormation
- 194. C :: EBS
- 195. C :: S3,SQS
- 196. B,E :: Organizations
- 197. A :: EC2
- 198. C :: EBS
    - 사용하지않는 오래된 EBS 볼륨들을 삭제하려면?
- 199. D :: EC2, RDS
    - 아키텍처 변경없이 비용절감을 위해 EC2와 RDS를 잠깐씩 필요할 때 쓰려면?
- 200. 1000 :: IAMRole

- 201. C :: CloudTrail
    - Trail 생성 시, required가 아닌 optional(KMS, SNS, Cloudwatch)로 사용할 수 있는것은?
- 202. C :: IAM
    - 서로 다른 하위 부서의 두 개인을 인식하고 별도의 액세스 권한을 부여하려면 어떡해 해야하는가?
- 203. A :: EB
    - 배포중에 사용할 수 있어야하고, 롤백할 수 있으려면 어떤 배포방식을 취하는가?
- 204. C :: CodeDeploy
    - 먼저 제한된 일부의 소비자에게 배포하고 모든 고객에게 배포하기 전에 해당 배포를 모니터링하여 배포 실패의 위험을 최소화하려면?
- 205. B :: S3, SQS
    - 알림을 프로그래밍 방식으로 받으려면 어떤걸 사용해야하는가?
- 206. A :: APIGateWay
    - API Gateway에서 카나리아 릴리스 배포생성이 가능한걸 아는가?
- 207. A :: CloudFormation, ASG
    - 인스턴스 유형을 변경해야할경우, 서버 4대 중 2대가 계속 유지되려면?
    - CloudFormation의 스택 업데이트 시, ASG의 Rolling과 Replace의 차이를 아는가?
- 208. C :: EC2, ASG
    - Spot Fleet을 활용해서 CloudFormation Templete에 사용할 수 있는가?
    - Step Scaling & Simple Scaling & Target Scaling 의 차이를 아는가?
- 209. B :: DynamoDB
    - DynamoDB를 사용하면서 Region 장애를 대비하려면?
- 210. C :: S3, CloudTrail
    - CloudTrail 무결성 설정을 S3에서 하는지, Trail에서 하는지?

---
- memo
- Amazon EC2 AMI 도구로 인스턴스스토어 지원 AMI(EBS 지원 AMI)를 생성할 수 있다
- Amazon ECS의 CLI툴을 AWS Copliot이라고한다.
- Amazon ECS의경우 CLI의 옵션으로 region, --ecs-profile,--cluster-config이 필요하다, 
- ~/.ecs/credentials : 자격증명을 저장한다
- ~/.ecs/config는 클러스터 구성정보를 저장한다. 

---

### 용어정리
- OVF(Open Virtualization Format)
- guestfish 대화형 셸
- virt-rescue 셸
- 골든 Amazon 머신 이미지(AMI)

---

### Refernece
    - aws-demos