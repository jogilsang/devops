

### cmd UTF 8
```
utf-8 을 cmd 에서 출력하기

cmd 에서기본적으로 utf-8가 출력되면 깨진다. utf-8을 출력하기 위해서
chcp(change code page) 를 수행하면 된다.

> chcp 65001


기본으로 돌아가려면 아래처럼 하면 된다.
> chcp 949

cmd /U
실행할때 /U 옵션을 주고 실행하자.
cmd /U : 파이프 또는 파일로의 내부 명령어 출력을 유니코드로 설정합니다.
```

### 바탕화면 desktop
```
cd %systemdrive%\users\%username%\desktop
```

### Color Theme
```
regedit 
HKEY_CURRENT_USER
Control Panel
Colors
```

### [기타 명령어]
```
calc (계산기)
charmap 문자표
cmd(도스명령프롬프트 실행)
control (제어판)
explorer 탐색기
mobsync 동기화
msconfig(시작프로그램 제어등 많은기능 제공) 
msinfo32 시스템정보
mstsc 원격 데스크톱 연결
netstat -na(현재 열린포트와 TCP/IP 프로토콜정보를 보여줌) 
        열린포트로 트라이목마형 바이러스 침투 유무확인가능 
notepad 메모장
osk 화상키보드
mspaint (그림판)
ping 사이트주소(핑테스트 해당 사이트의 인터넷연결 유무 확인) 
regedit(레지스트리 편집기)
sndvol (시스템 사운드 등록정보,볼륨조절)
wab 주소록
winver (윈도우 버전확인)
wmplayer (윈도우 미디어 플레이어)
wordpad 워드패드
wscui.cpl 보안센터.
```

### [MSC 명령어]
```
certmgr.msc : 인증서 관리
ciadv.msc : 인덱싱 서비스
compmgmt.msc : 컴퓨터 관리
devmgmt.msc : 장치관리자
dfrg.msc : 디스크 조각 모음
diskmgmt.msc : 디스크 관리
eventvwr.msc : 이벤트 뷰어 (이벤트 로그)
fsmgmt.msc : 공유 폴더 (공유 폴더 관리)
gpedit.msc : 그룹 정책
lusrmgr.msc : 로컬 사용자 및 그룹
ntmsmgr.msc : Removable Storage
ntmsoprq.msc : 이동식 저장소 운영자 요청
perfmon.msc : 성능
rsop.msc : 정책의 결과 집합
secpol.msc : 로컬 보안 설정
services.msc : 서비스
wmimgmt.msc : WMI 서비스 구성
comexp.msc : comexp 구성 요소 서비스
control userpasswords2 : 사용자 계정  
```

### [CPL 명령어]
```
appwiz.cpl	프로그램 제거 또는 변경 ★★★
desk.cpl	디스플레이 모양 변경
firewall.cpl	Windows 방화벽을 사용하여 컴퓨터 보호
hdwwiz.cpl	장치 관리자
inetcpl.cpl	인터넷 속성
intl.cpl	국가 및 언어
main.cpl	마우스 속성
mmsys.cpl	소리
ncpa.cpl	네트워크 연결 ★
powercfg.cpl	전원 관리 옵션 선택
sysdm.cpl	시스템 속성
timedate.cpl	날짜 및 시간

control admintools : 관리도구
control folders : 폴더옵션
control userpasswords : 사용자 계정
```
