
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

버킷의 dir
```
aws s3 ls s3://mybucket --human-readable --summarize
```

test.txt 파일 업로드
```
aws s3 cp test.txt s3://jogilsang-bucket-1.0
```

test.txt 파일 다운로드
```
aws s3 cp s3://jogilsang-bucket-1.0/test.txt ./ 
```

폴더 업로드
```
동일한 파일이 있는경우 덮어씀. 신규파일들도 추가됨
aws s3 cp mx s3://test-jogilsang/mx --acl public-read --recursive
동일한 파일이 있는경우 덮어쓰지않음. 신규파일들만 추가됨
aws s3 sync sp s3://test-jogilsang/sp --acl public-read
```
