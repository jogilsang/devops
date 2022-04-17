### Perl 인코딩, 디코딩
http://gypark.pe.kr/wiki/Perl/%ED%95%9C%EA%B8%80

### SVN BOOK
http://svnbook.red-bean.com/
http://svnbook.red-bean.com/en/1.7/svn-book.pdf

### SVN 세팅
https://taisou.tistory.com/130


### SVN 서버 윈도우세팅
svnadmin create C:\svn\window

sc create svn binpath= "\"C:\Program Files (x86)\Subversion\bin\svnserve.exe\" --service -r C:\svn\window" displayname= "Subversion Server" depend= Tcpip start= auto
sc delete svn

### setting
```
// 파일 스크립트편집
// authz
[/]
admin=rw
guest=rw
*=rw

// svnserve.conf
anon-access = read
auth-access = write
password-db = passwd
authz-db = authz

// passwd
[users]
admin=1234
guest=1234
```

### post-commit.bat
perl C:\svn\window\hooks\post-commit.pl %1 %2 %3 %4

