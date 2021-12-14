### cmd
```
eventvwr.msc
winevt
logfiles
```

### 부팅, 종료
```
# windows 로그 - 시스템
6005 : 시작
6006 : 종료
6008 : 비정상종료
6013 : 동작시간

# 종료확인 종료로그
shutdown /s /t 0
이벤트뷰어(eventvwr.msc)
windows 로그 - 시스템 - 로그필터링 (1074)
```

### 디스크
```
diskpart
list disk
select disk=0
detail disk
```

### 원격접속
```
Microsoft-Windows-TerminalServices-LocalSessionManager%4Operational
21 : 세션 시작
25 : 세션 종료
```

### 로그인, 로그아웃
```
Security.evtx
4624 : 로그인
4634 : 로그아웃
```
