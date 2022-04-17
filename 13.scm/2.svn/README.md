# 2.svn

## INDEX
- [install](#Install)
- [setting](#Setting)
- [port](#Port)
- [cli](#cli)
	- [svn](#svn)
	- [svnlook](#svnlook)
- [reference](#Reference)

---


### Port
```
http:// 로 시작 하면 80번 포트를 열어야 합니다.
https:// 로 시작하면 443번 포트를 열어야 합니다.
svn:// 으로 시작하면 3690번 포트를 여셔야 합니다.
svn+ssh:// 로 시작하면 22번포트를 여셔야 합니다.
```

---

### Install
> Ubuntu 18.04
```bash
sudo apt-get install -y subversion  
svn // install test  
svn --version // install test  
sudo mkdir svn  
cd svn  
sudo svnadmin create --fs-type fsfs repos  
cd repos  
ls -lt  
```

### Setting 
> Ubuntu 18.04
### 1. conf/svnserv.conf
```
#인증되지않은(즉 계정이 없는) 사용자에 대해 접근
anon-access = read

#인증된 사용자에 대해 쓰기 권한
auth-access = write

#인증된 사용자에 대한 계정 정보(아이디/패스) 정보가 기록된 파일명을 의미한다.(기본값 passwd)
password-db = passwd

#인증된 사용자에 대해 저장소에 대한 권한 설정이 기록된 파일명(기본값)
authz-db = authz
```
### *** 1. error (line19 : Option expected error)
```
앞에 공백 다 제거해야함.
```

### 2. conf/passwd
```
admin=1234
guest=1234
```

### 3. conf/authz
```
[/]
admin=rw
guest=rw
*=rw
```
### 4. 에디터 변경하기
export SVN_EDITOR=/usr/bin/vi  

### 5. SVN 권한부여 및 시작
```
sudo adduser svn
sudo chown -R svn:svn svn/repos
sudo chmod -R 777 svn
sudo svnserve -d -r svn/repos
```

### 6. SVN 종료 및 재시작
```
ps -ef | grep svnserve
kill -9 1684 1
sudo svnserve -d -r svn/repos
```

### 7. 폴더만들기
```
trunk : 프로젝트는 trunk에서 시작, GIT Master branch
sudo svn mkdir --parents svn://localhost/repos/trunk --username admin

branches : trunk에서 복사되서 새로 만들어진 프로젝트.
sudo svn mkdir --parents svn://localhost/repos/branches --username admin

tag : 특정 시간을 가리키는 포인터. 릴리즈 주기에 맞춰서, 각 주기의 코드를 보존하기 위해 사용
sudo svn mkdir --parents svn://localhost/repos/tags --username admin

ctr+x
c
```

### 8. checkout : 최초에 프로젝트를 받아오는 작업 (git clone)
```
svn checkout --username admin --password 1234 svn://localhost/repos
svn update
```

### *** 1. error (line19 : Authentication Error)
```
1. link에 username을 안넣은경우
2. svnserv.conf, passwd, authz 파일내용 이상한경우 (vi로 한번씩 다 켜보기)
```

### 9. import : 코드를 올리는 작업. 프로젝트 올리기
```
mkdir myproject
sudo vi helloword.c
int main(int argc, char **argv)
{
	printf("Hello World!!!\n");
}
svn import myproject svn://localhost/repos/trunk --username admin
```
### 10. commit : 수정내역을 반영해서 올리는 것
```
sudo vi hello.c
sudo svn commit --username admin
```

### 11. add : 신규 파일 넣기
```
sudo vi README.txt
sudo svn add README.txt 
sudo svn commit -m "added : README.txt"
```

### 12. branch/Tag 생성하기
#### branch,tag는 사실상 동일
```
우클릭
1. Branch/Tag : 브런치나 태그를 생성
2. Merge - Reintegrate Branch
- working copy = main
- Update 행위진행
- Conflict : 동일한 파일 동일한 지점 동일한 맥락으로 수정
- choose item : 양자택일
- preper local : 로컬(Trunk)을 선택한다.
- prefer repository : 브런치를 선택한다.
- edit conflict ; 충돌해결
- resolve later : 나중에
- resolve later all : 전부 나중에
수정 후 resolved 버튼 클릭하기 -> commit 진행
3. Switch : 로컬 브런치(Trunk)를 생성한 브런치로 변경
4. Checkout : 신규 브런치를 로컬로 가져옴
```
---

## cli
### svn
> svn commit
```
D:\project\svn\checkout>svn commit -m "test"
Sending        branches\develop\status_check_fass_v5.sh
Transmitting file data .done
Committing transaction...
Committed revision 122.
```

> svn diff
```
D:\project\svn\test>svnlook diff -r 122 D:\project\svn\test --no-diff-added --no-diff-deleted --ignore-properties
```

### svnlook
> svnlook history
```
svnlook history -r 100 D:\project\svn\test --show-ids
```

---

## Reference
- [SVN Book](http://svnbook.red-bean.com/)
- [SVN WINDOW DOWNLOAD LINK](https://sourceforge.net/projects/win32svn/)
- [SVN 튜토리얼](https://www.joinc.co.kr/w/Site/SVN/Tutorial )
- [SVN 데몬 실행,중지](https://zetawiki.com/wiki/Svnserve_%EC%8B%9C%EC%9E%91/%EC%A4%91%EC%A7%80)
- [SVN 서버 설치 및 설정](https://zetawiki.com/wiki/CentOS_%EC%84%9C%EB%B8%8C%EB%B2%84%EC%A0%84_%EC%84%9C%EB%B2%84_%EC%84%A4%EC%B9%98_%EB%B0%8F_%EC%84%A4%EC%A0%95_(svn))
