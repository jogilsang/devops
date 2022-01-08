
# DOP-C01

## INDEX
- Section5 : Monitoring and Logging
    - [CloudTrail](#cloudtrail)
    - [CloudWatch](#cloudwatch)
    - [X-RAY](#x-ray)
    - [ELASTICSEARCH](#ElasticSearch)
    - [TAGGING](#tagging)
- Section6 : Policies and Standards Automation
    - [AWS Systems Manager]
    - [AWS Config]
    - [AWS Inspector]
    - [AWS Health]
    - [AWS Trusted Advisor]
    - [AWS Macie]

- AWS 공인 DevOps 엔지니어 전문 실습 시험
    - [TEST1](#test1)
   

---

### Stack for CICD
- Code (AWS CodeCommit)
- Build / Test (AWS CodeBuild)
- Deploy (AWS CodeDeploy)
- Provision (AWS CloudFormation)

### jenkins
> hands-on : https://aws.amazon.com/ko/getting-started/hands-on/setup-jenkins-build-server/)
- Jenkins with CodePipeline
- Jenkins with ECS
- Jenkins with Device Farm
- Jenkins with AWS Lambda

### CloudFormation
- AWS 및 서드파티 리소스를 프로비저닝 및 관리할 수 있는 코드형 인프라(IAC) 서비스
- Declarative programming (no need to figure out ordering and orchestration)
- Deleting a stack deletes every single artifact that was created by
CloudFormation.
- HOW TO CREATE TEMPLATE
    - Editing templates in the CloudFormation Designer
    - Editing templates in a YAML file
- Templates components (one course section for each):
    1. Resources: your AWS resources declared in the template (MANDATORY)
    2. Parameters: the dynamic inputs for your template
    3. Mappings: the static variables for your template
    4. Outputs: References to what has been created
    5. Conditionals: List of conditions to perform resource creation
    6. Metadata

### codepipeline
- Code / Build / Test / Deploy / Provision 등의 Stage로 구성된 workflow를 Orchestrate해주는 Continuos Delivery 서비스이다. 각각의 Stage는 sequential 할수도있고, parallel 할 수 있다.

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

---

### test1

- 파이프라인 모범사례
    - https://docs.aws.amazon.com/codepipeline/latest/userguide/best-practices.html
- 파이프라인 모니터링
    - https://docs.aws.amazon.com/codepipeline/latest/userguide/detect-state-changes-cloudwatch-events.html

---

### Refernece
    - aws-demos