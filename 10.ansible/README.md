## Ansible

### INDEX

ansible ???
시스템 설치관리

IaC ???
CM Tool - Ansible이라는게 있따
Ansible을 자동화 해보자

앤써블을 사용해보신분 계신가요?
어떻게 하면 앤써블을 운영하고, 자동화할수있을가
앤써블을 알고계시다면 이해하실수있는 세션입니다

인프라 엔지니어 서버구성하다보면
이럴수밖에 없어서 이렇게 구성했었는대
파일과 기록을 통해 서버의 구성정보를 체계적으로 관리하자

Amazon AWS in Lambda 
IaC는 하이레벨 프로그래밍언어를 이용해 제어하는 아이디어에서 출발했다 라고 나와있음

기록의 중요성
Server 입고 -> 랙 마운트 -> 케이블링 -> OS설치 -> OS Configure -> Application Deployment
Switch 입고 -> 랙 마운트 -> 케이블링 -> 초기화 -> 라우팅 설정 -> 관리
-> cloud / container / sdn 등
H/W를  S/W로 제어하는 기술들 발전

cloud, sdn, cmdb, 
배포/설정 자동화~
CM Tool 4대장 - chef, puppet, saltstack, ansible

cm툴

*** github 스타랭킹 보는법?
*** 구글 트렌드 보는법?

장점1 : 간편함. 서버나 DB가 없다
playbook 타켓팅을 삼은 호스트의 구성정보들을 작성하는 작성된 파일
YAML 포멧

장점 2 : agentless, 기존 운영중인 서버에 도입하기 쉬움, 운영자에게 부담을 주지않음. ssh만 열어주세요
장점 3 : idempoence, 멱등성, 여러번 실행해도 결과는 동일! state를 저장한다

Ansible은 cli 보다는 Programmable 형태

Ansible Core에는 API가 없음
Ansible Tower을 사라

Ansible Module을 import해서 python으로 구현한다

Vault
data,file,api키,토큰 등 암호화하여 저장하는 tool

- #### [Reference](#reference)
---

#### reference

- [Learning Ansible](https://riptutorial.com/Download/ansible.pdf)
- [송지형: Infrastructure as Code 를 위한 Ansible 활용 방법](https://www.youtube.com/watch?v=SQ0YXzgzIDU)
---