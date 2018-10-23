# manual-aws
Amazon Web Service for me.

### 연혁
2018/10/21, AWS S3 자습서 10분을 진행하다

<hr/>

### 사이트주소
- 프리티어 설명서
```
https://aws.amazon.com/ko/free/
```

- 10분 자습서
```
https://aws.amazon.com/ko/getting-started/tutorials/?pg=ln&p=s3
```

- AWS 기반 프로젝트
```
https://aws.amazon.com/ko/getting-started/projects/?pg=ln&p=s3
```

<hr/>

### Amazon EC2
```
Ubuntu
-elastic ip  
https://blog.naver.com/jogilsang/221380379924

-Domain DNS Setting  
https://blog.naver.com/jogilsang/221369907088

-dnsmasq, ns server  
https://blog.naver.com/jogilsang/221370424937

-timezone, korea  
https://blog.naver.com/jogilsang/221375057555
```

### Amazon Developer Tool

-Build a Serverless Application  
```
https://aws.amazon.com/ko/getting-started/tutorials/build-serverless-app-codestar-cloud9/?trk=gs_card

codestar
cloud 9
codepipeline
CodeCommit
CodeBuild
CodeFormation

cd /home/ec2-user/environment/nodejs-serverle
```

-Integrate Your IDE with AWS CodeStar  
```
https://docs.aws.amazon.com/ko_kr/codestar/latest/userguide/setting-up-ide.html
```

-Working with AWS CodeStar Teams  
```
https://docs.aws.amazon.com/ko_kr/codestar/latest/userguide/working-with-teams.html
```

-customize the Cloud9  
```
https://docs.aws.amazon.com/ko_kr/cloud9/latest/user-guide/ide.html
```

### Amazon EBS
```
EC2 인스턴스 디스크용량 확장하기(Free tier 에서 30GB 까지 가능)  
https://blog.naver.com/jogilsang/221370362752
```

### Amazon LAMDA
```
Hello, World! with Python
https://blog.naver.com/jogilsang/221382977003
```

### Amazon S3 

IAM (Identity and Access Management) 사용자를 만든다.  
Programmatic access를 체크한다  
Attach existing policies directly - AdministratorAccess  
그리고 credentials.csv 파일에 access key랑 secret key를 잘 보관한다  

AWSCLI64.msi를 설치한뒤, CMD를 킨다
```
aws configure
AWS Access Key ID [None]: 액세스키를 넣는다
AWS Secret Access Key [None]: 비밀키를 넣는다
Default region name [None]: ap-northeast-2 (리전을 넣는다. 이 값은 태평양 서울)
Default output format [None]: json (자습서참고)
```

버킷을 명령어로 생성한다. (버킷명은 세계적으로 Unique해야하며, 중복시 에러뜬다)
```
aws s3 mb s3://jogilsang-bucket-1.0
```

test.txt 파일 업로드
```
aws s3 cp s3://jogilsang-bucket-1.0/test.txt ./
```

test.txt 파일 다운로드
```
aws s3 cp test.txt s3://jogilsang-bucket-1.0/
```

<hr/>
