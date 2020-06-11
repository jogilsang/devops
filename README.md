# manual-aws
Amazon Web Service for me.

### AWS 한국백서
https://aws.amazon.com/ko/blogs/korea/ko-whitepapers/  


### AWS 용어
```
AWS Trusted Advisor는 AWS 모범 사례에 따라 리소스를 프로비저닝하는 데 도움이 되도록 실시간 지침을 제공하는 온라인 도구
```

### AWS DIscovery Book
```
자격증 취득을 위한 교육
시험비용 지원, 합격하는경우 축하금

AWS 트레이닝 코스

aws 한국어 기술 백서목록
https://aws.amazon.com/ko/blogs/korea/ko-whitepapers

www.aws.trainning

```

### AWS
```
AWS Cloud Practitioner

https://yongho1037.tistory.com/783

https://github.com/yoonhok524/aws-certifications/tree/master/0.%20Cloud%20Practitioner

http://pyrasis.com/private/2014/09/30/publish-the-art-of-amazon-web-services-book

용어 알아보기 :
https://brunch.co.kr/@topasvga/1
https://brunch.co.kr/@topasvga/76
```

### 리눅스 포트 linux port
```
netstat -nap | grep :4000
```

### 그라파나 ubuntu 18.04
```
sudo apt-get update
sudo apt-get upgrade
apt-get install -y software-properties-common
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install grafana
sudo apt-get install -y apt-transport-https
sudo ls /usr/lib/systemd/system/grafana-server.service
cat /usr/lib/systemd/system/grafana-server.service
sudo systemctl start grafana-server
sudo systemctl status grafana-server
localhost:3000
// id : admin, password : admin

source of link : 
https://devconnected.com/how-to-install-grafana-on-ubuntu-18-04/
https://has3ong.tistory.com/626
```

### 그라파나
```
설치위치 : /usr/sbin/grafana-server ( init 파일 : /etc/init.d/grafana-server )
설정파일 : /etc/grafana/grafana.ini
로그위치 : /var/log/grafana/grafana.log
환경파일 : /etc/sysconfig/grafana-server
```

### 시간서버
```
time2.kriss.re.kr
```

###
winscp : ec2랑 파일교환 가능하게함  
https://winscp.net/eng/download.php

### 연혁
2018/10/21, AWS S3 자습서 10분을 진행하다

<hr/>

### 패스워드설정
passwd  

### PUTTY
1. default
```
로깅 LOGGING : 
&H-&Y&M&D_&T.putty.log

PEM -> PPK
https://blog.naver.com/jogilsang/221432071928
```

2. config
```
Terminal
Bell - None

Window
Lines of Scrollback 10000
Display Scrollbar in full screen mode

Window - Appearence
Font 14
Gap between text and window edge 3

Behaviour
Full screen on Alt - Enter

Window Translation
UTF-8
```

3. config down and backup
```
regedit
내 컴퓨터 - HKEY_CURRENT_USER - SOFTWARE - SimonTatham - PuTTY - Sessions
right mouse - 내보내기
```

### winSCP
다운로드 :  
https://winscp.net/download/WinSCP-5.9-Setup.exe  
(putty 설정도 다가져옴. 애시당초 )  

설명 :  
https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/UserGuide/putty.html  

### pscp
pscp -i C:\Users\user\Downloads\jogilsang.ppk C:\Users\user\Downloads\wpbox-woocommerce-korean-20180527\woocommerce-ko_KR.mo ec2-user@ec2-13-125-69-120.ap-northeast-2.compute.amazonaws.com:/home/ec2-user/woocommerce-ko_KR.mo  
-> 양식은 이런대 안됨...ㅡㅡ  

### LAMP 설치
https://webnautes.tistory.com/1185  

Android php mysql 예제 :  
https://webnautes.tistory.com/828

Document Root : /var/www/html   

sudo apt update && sudo apt upgrade  
sudo apt install apache2  
sudo apt install mysql-server  

sudo mysql  
create database db DEFAULT CHARACTER SET utf8;  
create user 'jogilsang' identified by 'password';  
GRANT ALL PRIVILEGES ON db.* TO 'jogilsang'@'localhost' identified by 'password';  

adminer :  
```
http://www.ubuntuboss.com/how-to-install-adminer-on-ubuntu/

sudo apt-get update && sudo apt-get upgrade
sudo apt-get install apache2 php5 php5-curl php5-cli php5-mysql php5-gd mysql-client mysql-server

sudo mkdir /usr/share/adminer
sudo wget "http://www.adminer.org/latest.php" -O /usr/share/adminer/latest.php
sudo ln -s /usr/share/adminer/latest.php /usr/share/adminer/adminer.php
echo "Alias /adminer.php /usr/share/adminer/adminer.php" | sudo tee /etc/apache2/conf-available/adminer.conf
sudo a2enconf adminer.conf
sudo service apache2 restart
```
 
cd /var/www/html  
sudo touch dbcon.php  
sudo touch insert.php  

### 리눅스 명령어
```
환경변수 수정 :
sudo vi /etc/environment

삭제 :  
sudo rm - r [forder-name]  
```

### java 파일 실행하기
```
eclipse로 만든거 git에 올리기
git으로 다운받기
bin,src 중에서 bin으로 들어가기
java -cp 패키지명.메인클래스
```

### jar 만들기 생성
```
sudo vi manifest.txt
(Main-Class: MainClass <--- main 함수 있는 클래스)

jar -cvmf manifest.txt [jar파일명] [클래스1] [클래스2] or 
jar -cvmf manifest.txt [jar파일명] *.class

java -jar 파일명.jar

출처: http://ra2kstar.tistory.com/125 [초보개발자 이야기.]
```

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

- AWS 무료 교육 및 자격증  
```
https://www.aws.training/
```

<hr/>

### linux command

sudo : 관리자권한  
touch : 파일생성  
vi : 편집 
mv : 

### Amazon EC2
window 2012 R2 Server  
```
-Default Setting
https://blog.naver.com/jogilsang/221385508604
(자습서 : https://aws.amazon.com/ko/getting-started/tutorials/launch-windows-vm/?trk=gs_card)

-WordPress Deploy
https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/WindowsGuide/EC2Win_CreateWordPressBlog.html

-Instance Connect
https://docs.aws.amazon.com/ko_kr/AWSEC2/latest/WindowsGuide/connecting_to_windows_instance.html

```

Ubuntu Server 18.0.4
1. nodejs
```
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v
sudo apt-get install build-essential
```

Ubuntu Server 16.0.4  
1. 시작
```
sudo apt-get update
```

2. 그 외 정보들
```
-elastic ip  
https://blog.naver.com/jogilsang/221380379924

-Domain DNS Setting  
https://blog.naver.com/jogilsang/221369907088

-dnsmasq, ns server  
https://blog.naver.com/jogilsang/221370424937

-timezone, korea  
https://blog.naver.com/jogilsang/221375057555
```
3. docker 
```
0. putty 한글폰트 설정, (EX : 터미널)

1. Docker 다운받기
sudo apt-get update
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io

2. Mariadb 도커 이미지 다운받기
sudo docker pull mariadb
sudo docker images

3. 컨테이너 실행
sudo docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 --name mariadb mariadb
sudo docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=1234 --name mariadb2 mariadb --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

-d : detached mode : 컨테이너를 백그라운드에서 동작하는 어플리케이션으로 실행
-p 3306:3306 : 외부의 3306요청을 컨테이너의 포트 3306과 연동
--name : 컨테이너의 이름

4. 도커 확인
sudo docker container ls
sudo docker ps

5. 접속, 해당 컨테이너 실행
sudo docker exec -i -t mariadb bash (exit)
mysql -uroot -p1234 (ctrl + c)

6. VI 편집기 설치, 컨피그 수정
apt-get update
apt-get install vim 
vi /etc/mysql/my.cnf 

/etc/mysql/my.cnf 설정파일에서

[client]
default-character-set=utf8

...

[mysql]
default-character-set=utf8

...

[mysqld]
collation-server = utf8_unicode_ci
init-connect='SET NAMES utf8'
character-set-server = utf8

7. 도커 언어수정
apt update
apt install locales
locale
export LANGUAGE=ko_KR.UTF-8
export LANG=ko_KR.UTF-8
dpkg-reconfigure locales
298
3

7. 컨테이너 재시작
sudo docker stop mariadb
sudo docker start mariadb
```

4. git 깃 설치
```
sudo apt-get install python-software-properties
sudo apt-get install software-properties-common
sudo add-apt-repository ppa:git-core/ppa
sudo apt-get update
sudo apt-get install git-core
```

5. nodejs
```
sudo apt-get install nodejs
sudo apt-get install npm
nodejs -v
```


### Amazon Developer Tool

- Build a Serverless Application  
```
https://blog.naver.com/jogilsang/221384240449
https://aws.amazon.com/ko/getting-started/tutorials/build-serverless-app-codestar-cloud9/?trk=gs_card

codestar
cloud 9
codepipeline
CodeCommit
CodeBuild
CodeFormation

cd /home/ec2-user/environment/nodejs-serverle
```

- Integrate Your IDE with AWS CodeStar  
```
https://docs.aws.amazon.com/ko_kr/codestar/latest/userguide/setting-up-ide.html
```

- Working with AWS CodeStar Teams  
```
https://docs.aws.amazon.com/ko_kr/codestar/latest/userguide/working-with-teams.html
```

- customize the Cloud9  
```
https://docs.aws.amazon.com/ko_kr/cloud9/latest/user-guide/ide.html
```

### Amazon RDS
```
Microsoft SQL Server DB
- study address :
https://aws.amazon.com/ko/getting-started/tutorials/create-microsoft-sql-db/?trk=gs_card

- Download : Microsoft SQL Server Management Studio Express
https://www.microsoft.com/en-us/download/confirmation.aspx?id=22985
```

### Amazon EBS
```
EC2 인스턴스 디스크용량 확장하기(Free tier 에서 30GB 까지 가능)  
https://blog.naver.com/jogilsang/221370362752
```

### Amazon LAMDA
-Free tier  
1GB, 40 ten thousand Second  
One millon Request
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
### Amazon API Gateway

- sample
```
{
  "swagger": "2.0",
  "info": {
    "description": "Your first API with Amazon API Gateway. This is a sample API that integrates via HTTP with our demo Pet Store endpoints",
    "title": "PetStore"
  },
  "schemes": [
    "https"
  ],
  "paths": {
    "/": {
      "get": {
        "tags": [
          "pets"
        ],
        "description": "PetStore HTML web page containing API usage information",
        "consumes": [
          "application/json"
        ],
        "produces": [
          "text/html"
        ],
        "responses": {
          "200": {
            "description": "Successful operation",
            "headers": {
              "Content-Type": {
                "type": "string",
                "description": "Media type of request"
              }
            }
          }
        },
        "x-amazon-apigateway-integration": {
          "responses": {
            "default": {
              "statusCode": "200",
              "responseParameters": {
                "method.response.header.Content-Type": "'text/html'"
              },
              "responseTemplates": {
                "text/html": "<html>\n    <head>\n        <style>\n        body {\n            color: #333;\n            font-family: Sans-serif;\n            max-width: 800px;\n            margin: auto;\n        }\n        </style>\n    </head>\n    <body>\n        <h1>Welcome to your Pet Store API</h1>\n        <p>\n            You have succesfully deployed your first API. You are seeing this HTML page because the <code>GET</code> method to the root resource of your API returns this content as a Mock integration.\n        </p>\n        <p>\n            The Pet Store API contains the <code>/pets</code> and <code>/pets/{petId}</code> resources. By making a <a href=\"/$context.stage/pets/\" target=\"_blank\"><code>GET</code> request</a> to <code>/pets</code> you can retrieve a list of Pets in your API. If you are looking for a specific pet, for example the pet with ID 1, you can make a <a href=\"/$context.stage/pets/1\" target=\"_blank\"><code>GET</code> request</a> to <code>/pets/1</code>.\n        </p>\n        <p>\n            You can use a REST client such as <a href=\"https://www.getpostman.com/\" target=\"_blank\">Postman</a> to test the <code>POST</code> methods in your API to create a new pet. Use the sample body below to send the <code>POST</code> request:\n        </p>\n        <pre>\n{\n    \"type\" : \"cat\",\n    \"price\" : 123.11\n}\n        </pre>\n    </body>\n</html>"
              }
            }
          },
          "passthroughBehavior": "when_no_match",
          "requestTemplates": {
            "application/json": "{\"statusCode\": 200}"
          },
          "type": "mock"
        }
      }
    },
    "/pets": {
      "get": {
        "tags": [
          "pets"
        ],
        "summary": "List all pets",
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "name": "type",
            "in": "query",
            "description": "The type of pet to retrieve",
            "required": false,
            "type": "string"
          },
          {
            "name": "page",
            "in": "query",
            "description": "Page number of results to return.",
            "required": false,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "Successful operation",
            "schema": {
              "$ref": "#/definitions/Pets"
            },
            "headers": {
              "Access-Control-Allow-Origin": {
                "type": "string",
                "description": "URI that may access the resource"
              }
            }
          }
        },
        "x-amazon-apigateway-integration": {
          "responses": {
            "default": {
              "statusCode": "200",
              "responseParameters": {
                "method.response.header.Access-Control-Allow-Origin": "'*'"
              }
            }
          },
          "requestParameters": {
            "integration.request.querystring.page": "method.request.querystring.page",
            "integration.request.querystring.type": "method.request.querystring.type"
          },
          "uri": "http://petstore-demo-endpoint.execute-api.com/petstore/pets",
          "passthroughBehavior": "when_no_match",
          "httpMethod": "GET",
          "type": "http"
        }
      },
      "post": {
        "tags": [
          "pets"
        ],
        "operationId": "CreatePet",
        "summary": "Create a pet",
        "consumes": [
          "application/json"
        ],
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "in": "body",
            "name": "NewPet",
            "required": true,
            "schema": {
              "$ref": "#/definitions/NewPet"
            }
          }
        ],
        "responses": {
          "200": {
            "description": "Successful operation",
            "schema": {
              "$ref": "#/definitions/NewPetResponse"
            },
            "headers": {
              "Access-Control-Allow-Origin": {
                "type": "string",
                "description": "URI that may access the resource"
              }
            }
          }
        },
        "x-amazon-apigateway-integration": {
          "responses": {
            "default": {
              "statusCode": "200",
              "responseParameters": {
                "method.response.header.Access-Control-Allow-Origin": "'*'"
              }
            }
          },
          "uri": "http://petstore-demo-endpoint.execute-api.com/petstore/pets",
          "passthroughBehavior": "when_no_match",
          "httpMethod": "POST",
          "type": "http"
        }
      },
      "options": {
        "consumes": [
          "application/json"
        ],
        "produces": [
          "application/json"
        ],
        "responses": {
          "200": {
            "description": "Successful operation",
            "schema": {
              "$ref": "#/definitions/Empty"
            },
            "headers": {
              "Access-Control-Allow-Origin": {
                "type": "string",
                "description": "URI that may access the resource"
              },
              "Access-Control-Allow-Methods": {
                "type": "string",
                "description": "Method or methods allowed when accessing the resource"
              },
              "Access-Control-Allow-Headers": {
                "type": "string",
                "description": "Used in response to a preflight request to indicate which HTTP headers can be used when making the request."
              }
            }
          }
        },
        "x-amazon-apigateway-integration": {
          "responses": {
            "default": {
              "statusCode": "200",
              "responseParameters": {
                "method.response.header.Access-Control-Allow-Methods": "'POST,GET,OPTIONS'",
                "method.response.header.Access-Control-Allow-Headers": "'Content-Type,X-Amz-Date,Authorization,X-Api-Key'",
                "method.response.header.Access-Control-Allow-Origin": "'*'"
              }
            }
          },
          "passthroughBehavior": "when_no_match",
          "requestTemplates": {
            "application/json": "{\"statusCode\": 200}"
          },
          "type": "mock"
        }
      }
    },
    "/pets/{petId}": {
      "get": {
        "tags": [
          "pets"
        ],
        "summary": "Info for a specific pet",
        "operationId": "GetPet",
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "name": "petId",
            "in": "path",
            "description": "The id of the pet to retrieve",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "Successful operation",
            "schema": {
              "$ref": "#/definitions/Pet"
            },
            "headers": {
              "Access-Control-Allow-Origin": {
                "type": "string",
                "description": "URI that may access the resource"
              }
            }
          }
        },
        "x-amazon-apigateway-integration": {
          "responses": {
            "default": {
              "statusCode": "200",
              "responseParameters": {
                "method.response.header.Access-Control-Allow-Origin": "'*'"
              }
            }
          },
          "requestParameters": {
            "integration.request.path.petId": "method.request.path.petId"
          },
          "uri": "http://petstore-demo-endpoint.execute-api.com/petstore/pets/{petId}",
          "passthroughBehavior": "when_no_match",
          "httpMethod": "GET",
          "type": "http"
        }
      },
      "options": {
        "consumes": [
          "application/json"
        ],
        "produces": [
          "application/json"
        ],
        "parameters": [
          {
            "name": "petId",
            "in": "path",
            "description": "The id of the pet to retrieve",
            "required": true,
            "type": "string"
          }
        ],
        "responses": {
          "200": {
            "description": "Successful operation",
            "schema": {
              "$ref": "#/definitions/Empty"
            },
            "headers": {
              "Access-Control-Allow-Origin": {
                "type": "string",
                "description": "URI that may access the resource"
              },
              "Access-Control-Allow-Methods": {
                "type": "string",
                "description": "Method or methods allowed when accessing the resource"
              },
              "Access-Control-Allow-Headers": {
                "type": "string",
                "description": "Used in response to a preflight request to indicate which HTTP headers can be used when making the request."
              }
            }
          }
        },
        "x-amazon-apigateway-integration": {
          "responses": {
            "default": {
              "statusCode": "200",
              "responseParameters": {
                "method.response.header.Access-Control-Allow-Methods": "'GET,OPTIONS'",
                "method.response.header.Access-Control-Allow-Headers": "'Content-Type,X-Amz-Date,Authorization,X-Api-Key'",
                "method.response.header.Access-Control-Allow-Origin": "'*'"
              }
            }
          },
          "passthroughBehavior": "when_no_match",
          "requestTemplates": {
            "application/json": "{\"statusCode\": 200}"
          },
          "type": "mock"
        }
      }
    }
  },
  "definitions": {
    "Pets": {
      "type": "array",
      "items": {
        "$ref": "#/definitions/Pet"
      }
    },
    "Empty": {
      "type": "object"
    },
    "NewPetResponse": {
      "type": "object",
      "properties": {
        "pet": {
          "$ref": "#/definitions/Pet"
        },
        "message": {
          "type": "string"
        }
      }
    },
    "Pet": {
      "type": "object",
      "properties": {
        "id": {
          "type": "string"
        },
        "type": {
          "type": "string"
        },
        "price": {
          "type": "number"
        }
      }
    },
    "NewPet": {
      "type": "object",
      "properties": {
        "type": {
          "$ref": "#/definitions/PetType"
        },
        "price": {
          "type": "number"
        }
      }
    },
    "PetType": {
      "type": "string",
      "enum": [
        "dog",
        "cat",
        "fish",
        "bird",
        "gecko"
      ]
    }
  },
  "x-amazon-apigateway-documentation": {
    "version": "v2.1",
    "createdDate": "2016-11-17T07:03:59Z",
    "documentationParts": [
      {
        "location": {
          "type": "API"
        },
        "properties": {
          "info": {
            "description": "Your first API with Amazon API Gateway. This is a sample API that integrates via HTTP with our demo Pet Store endpoints"
          }
        }
      },
      {
        "location": {
          "type": "METHOD",
          "method": "GET"
        },
        "properties": {
          "tags": [
            "pets"
          ],
          "description": "PetStore HTML web page containing API usage information"
        }
      },
      {
        "location": {
          "type": "METHOD",
          "path": "/pets/{petId}",
          "method": "GET"
        },
        "properties": {
          "tags": [
            "pets"
          ],
          "summary": "Info for a specific pet"
        }
      },
      {
        "location": {
          "type": "METHOD",
          "path": "/pets",
          "method": "GET"
        },
        "properties": {
          "tags": [
            "pets"
          ],
          "summary": "List all pets"
        }
      },
      {
        "location": {
          "type": "METHOD",
          "path": "/pets",
          "method": "POST"
        },
        "properties": {
          "tags": [
            "pets"
          ],
          "summary": "Create a pet"
        }
      },
      {
        "location": {
          "type": "PATH_PARAMETER",
          "path": "/pets/{petId}",
          "method": "*",
          "name": "petId"
        },
        "properties": {
          "description": "The id of the pet to retrieve"
        }
      },
      {
        "location": {
          "type": "QUERY_PARAMETER",
          "path": "/pets",
          "method": "GET",
          "name": "page"
        },
        "properties": {
          "description": "Page number of results to return."
        }
      },
      {
        "location": {
          "type": "QUERY_PARAMETER",
          "path": "/pets",
          "method": "GET",
          "name": "type"
        },
        "properties": {
          "description": "The type of pet to retrieve"
        }
      },
      {
        "location": {
          "type": "REQUEST_BODY",
          "path": "/pets",
          "method": "POST"
        },
        "properties": {
          "description": "Pet object that needs to be added to the store"
        }
      },
      {
        "location": {
          "type": "RESPONSE",
          "method": "*",
          "statusCode": "200"
        },
        "properties": {
          "description": "Successful operation"
        }
      },
      {
        "location": {
          "type": "RESPONSE_HEADER",
          "method": "OPTIONS",
          "statusCode": "200",
          "name": "Access-Control-Allow-Headers"
        },
        "properties": {
          "description": "Used in response to a preflight request to indicate which HTTP headers can be used when making the request."
        }
      },
      {
        "location": {
          "type": "RESPONSE_HEADER",
          "method": "OPTIONS",
          "statusCode": "200",
          "name": "Access-Control-Allow-Methods"
        },
        "properties": {
          "description": "Method or methods allowed when accessing the resource"
        }
      },
      {
        "location": {
          "type": "RESPONSE_HEADER",
          "method": "*",
          "statusCode": "200",
          "name": "Access-Control-Allow-Origin"
        },
        "properties": {
          "description": "URI that may access the resource"
        }
      },
      {
        "location": {
          "type": "RESPONSE_HEADER",
          "method": "GET",
          "statusCode": "200",
          "name": "Content-Type"
        },
        "properties": {
          "description": "Media type of request"
        }
      }
    ]
  }
}
```


<hr/>
