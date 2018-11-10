# manual-aws
Amazon Web Service for me.

### 연혁
2018/10/21, AWS S3 자습서 10분을 진행하다

<hr/>

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

Ubuntu Server 16.0.4  
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
