

## IAM
- 정의
    - Identity & Access & Management
        - IAM의 Identity는 aws로 요청할 수 있는 보안주체를 aws 어카운트 내에 만들어주는 역활
        - IAM의 access management는 누가 어떤 리소스들에 대해 어떤 일을 할 수 있는 권한을 가지는지를 정의하는 도구의 역활
    - 누가 어떤 리소스들에 대해 어떤 일을 할 수 있는 권한을 가지는지를 정의하는 도구
    - IAM은 인증과 인가를 관리하는 통합 엑세스 컨트롤 서비스
- 특징
    - IAM은 **그룹,사용자들,역활,정책** 네 가지로 나뉜다
    - IAM은 Region별로 설정하는것이 아니라 Global로 설정한다.
    
## AAA
- Authentication
    - 사용자 이름 / 패스워드, AccessKey, Federation
    - 인증은 클라이언트가 자신이 주장하는 사용자와 같은 사용자인지 확인
- Authorization
    - IAM은 수신한 API의 타임스탬프, 서명 등의 일치여부를 확인한 뒤, Policy를 기반으로 검사/평가해서 최종적으로 허용과 차단에 대한 인가를 결정
    - 인가는 클라이언트가 하고자하는 작업이 해당 클라이언트에게 허가된 작업인지를 확인
- Audit
    - CloudTrail

## IAM Role
- 신뢰하는 개체에 권한(Permission)을 부여하는 안전한 방법
    - 동일 account의 iam user
    - 다른 account의 iam user
    - aws resource
    - saml, OpenID Connect 등 외부 자격증명 공급자(IDP)로 인증된 
- IAM Role은 임시크레덴셜로 일정시간이 지나면 만료(Timeout)이 발생하는 Session Token이 추가됩니다
- iam Role을 부여하는 액션 자체에도 제어가 필요합니다
- iam Role 과 같이 임시 Credential을 쓰는경우, 일정시간이 지나면 만료되는 Session Token이 추가됩니다. 역활을 수임한다. Role을 assume 한다고 한다.
- iam Role은 역활을 수임하는 권한과 AWS 리소스에 대한 권한 2가지가 필요하다.
- 개발자에게 ec2 인스턴스를 시작할 수 있는권한과 iam 역활을 적용할 수있는권한 둘다 필요
- iam role은 saml이나 openIDC같은 연계 프로토콜을 사용해서 외부사용자를 iam role과 매핑해주게됩니다

## IAM User
- iam 사용자는 장기 크레덴셜을 사용해서 서비스에 접근을 하는 보안주체입니다
- IAM User는 영구적인 장기 크레덴셜로 지속됩니다.

## IAM Group
- 그룹에 사용자가 속하면 동일한 권한을 부여할 수 있어서, 관리포인트를 줄일 수 있다.
- IAM 사용자는 최대 10개 Group에 속할 수 있다.
- IAM Group은 보안주체로 식별될 수 없다

## process
- AWS 자원끼리 주고받는 요청과 응답은 모두 API 형태이다. API는 자격증명(Credential)이 포함되어있다
자격증명에는 accessKey와 secretKey가 포함되어있다. 비밀키는 노출되면 안되므로, 비밀키를 가진사람만 생성할 수 있는
HMAC 서명값을 포함하게 됩니다.
- 요청이 도착하면 보안주체의 서명값, 타임스탬프를 비교하고, 해당 자격증명이 적절한 권한을 가진지 판단하고 허용을 결정한다

## SCP
- Session Control Policy
    - Organization에서 멀티 어카운트를 제어하기위해 설정하는 정책

## policy
- 정의
    - Policy는 AWS 서비스와 리소스에 대한 **인가(Authorization)** 기능을 제공한다.
- 종류
    - Identity Based Policy
    - Resource Based Policy : 보안주체가 접근할 AWS Resource에 할당하는 정책
- 특징
    - policy는 JSON Object이다.
    - identity-based정책과 resource-based 정책(보안주체가 접근할 AWS 자원에 할당)의 커버리지는 동일 account인지 Cross account 환경인지 에 따라 달라집니다. 동일 account라면 합집합의 형태로 요청검사가 이뤄진다. 크로스어카운트환경에서는 공집합으로 이뤄집니다.
    - Permission Boundary는 iam 사용자가 가질 수 있는 최대권한을 제어한다.
    - policy와 role의 차이는 자격증명을 공유할 필요가 없다는 것이다.
        - Effect
            - 허용/혹은 차단
            - 정책의 디폴트는 deny로 묵시적 deny라고한다.
            - 명시적인 allow보다 명시적인 deny가 우선순위가 높다
        - Principal
            - Source (Effect를 적용하려는 대상)
        - Action
            - Effect를 하고자 하는 타입
            - EX : "iam:GetRole"
        - Resource
            - Dst (Action의 목적지)
            - "arn:aws:s3:::*"
        - Condition
            - EX : 
            ```json
            {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Action": [
                        "s3:ListAllMyBuckets",
                        "s3:Get*",
                    ],
                    "Effect": "Allow",
                    "Resource": [
                        "arn:aws:s3:::*"
                    ]
                }
            ]
            }
            ```

## ABAC
- ABAC은 태그를 이용해서 단일 policy로 각기 다른 리소스에 재사용가능한 접근제어를 구상하는 방식을 사용할 수 있습니다. 정책의 인가과정이 보안주체가 가진 태그와 리소스의 태그가 일치하는지여부를 보고 판단하기때문에 훨씬 동적인 권한관리가 가능해집니다


## RBAC

---

## q&a
- 정책이란 무엇일가요?
- 정책의 구성요소는 어떻게될가요?
- 동일계정과 서로 다른 계정의 권한획득조건은 동일한가요?
- 멀티계정 환경에서는 자원공유를 어떻게할가요?
- Identity based Policy와 Resource based Policy의 policy 구조의 차이는?
- Policy의 action, principal, resource, condition, effect 중 정책의 필수값과 선택값은?
- 정책에 기술된 문장들의 우선순위가 있을가요?
- 정책을 그대로 쳤는대 에러가난다면?
- s3:buckect.* 같은 명령어로 CLI는 정상인데, Console에서는 에러가나는 이유은?

---

## example

### 교차계정접근
```json
1. Policy: s3-read-access-to-bucket  (in resource owner)
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:ListAllMyBuckets"
            ],
            "Effect": "Allow",
            "Resource": [
                "arn:aws:s3:::*"
            ]
        },    
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": [
                "arn:aws:s3:::bucket_name",
                "arn:aws:s3:::bucket_name/*"
            ]
        }
    ]
}

2. 정책 : 요청자가 리소스 오너의 계정으로
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "sts:AssumeRole",
            "Resource": "arn:aws:iam::account_id_of_bucket_owner:role/cross-account-access-role"
        }
    ]
}

```
## Reference
- [[AWS Builders] AWS IAM 을 통한 클라우드에서의 권한 관리 - 신은수, AWS Security Specialist SA](https://www.youtube.com/watch?v=A77sIwSPCsE&list=PLivYj-G6HmuJTnwclPCbgw9i6E-YZ2dVm&index=7))
- [AWS IAM Hands on lab](https://whchoi98.gitbook.io/aws-iam/)
