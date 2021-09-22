# Manual-Window

## INDEX
### [cmd](#cmd)
- #### [chcp](#chcp)
- #### [ren(파일 및 폴더 이름변경](#ren)
- #### [desktop](#desktop)
### [명령어](#명령어)
- #### [기타 명령어](#기타%20명령어)
- #### [MSC 명령어](#MSC%20명령어)
- #### [CPL 명령어](#CPL%20명령어)
- #### [ms-settings 명령어](#ms-settings%20명령어)
### [fun](#fun)
---

### cmd
- #### chcp
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
- #### desktop
```
cd %systemdrive%\users\%username%\desktop
```
### ren
- `파일 및 폴더 이름변경`   
  `example`
  ```
  ren folder_a folder_b
  ```
### 명령어

- #### [기타 명령어]
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

- #### [MSC 명령어]
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

- #### [CPL 명령어]
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

- #### [ms-settings 명령어]
```
Category	Settings page	URI Command (shortcut)
설정 페이지 홈 (Windows 설정)	ms-settings:
시스템		
디스플레이	ms-settings:display
야간 모드 설정	ms-settings:nightlight
고급 배율 설정	ms-settings:display-advanced
무선 디스플레이 및 무선 오디오 장치 검색	ms-settings-connectabledevices:devicediscovery
그래픽 설정	ms-settings:display-advancedgraphics
소리 (build 17063)	ms-settings:sound
사운드 장치 관리	ms-settings:sound-devices
앱 볼륨 및 장치 기본 설정	ms-settings:apps-volume
알림 및 작업	ms-settings:notifications
집중 지원 (build 17074)	ms-settings:quiethours
or
ms-settings:quietmomentshome
해당 시간 동안	ms-settings:quietmomentsscheduled
디스플레이를 복제하는 중	ms-settings:quietmomentspresentation
전체 화면으로 게임을 플레이하는 중	ms-settings:quietmomentsgame
전원 및 절전	ms-settings:powersleep
배터리 (노트북같은 휴대장치에서 나옴)	ms-settings:batterysaver
See which apps are affecting your battery life	ms-settings:batterysaver-usagedetails
Battery Saver settings	ms-settings:batterysaver-settings
저장소	ms-settings:storagesense
저장소 센스 구성 또는 지금 실행	ms-settings:storagepolicies
새 콘텐츠가 저장되는 위치 변경	ms-settings:savelocations
태블릿 모드	ms-settings:tabletmode
멀티태스킹	ms-settings:multitasking
PC에 화면 표시	ms-settings:project
공유 환경	ms-settings:crossdevice
클립보드 (build 17666)	ms-settings:clipboard
원격 데스크톱	ms-settings:remotedesktop
암호화	ms-settings:deviceencryption
정보	ms-settings:about
장치		
Bluetooth 및 기타 디바이스	ms-settings:bluetooth
or
ms-settings:connecteddevices
프린터 및 스캐너	ms-settings:printers
마우스	ms-settings:mousetouchpad
터치패드	ms-settings:devices-touchpad
입력	ms-settings:typing
Hardware keyboard – Text suggestions	ms-settings:devicestyping-hwkbtextsuggestions
휠	ms-settings:wheel
펜 및 Windows Ink	ms-settings:pen
자동 실행	ms-settings:autoplay
USB	ms-settings:usb
휴대폰 (build 16251)		
휴대폰	ms-settings:mobile-devices
휴대폰 추가	ms-settings:mobile-devices-addphone
너의 휴대폰	ms-settings:mobile-devices-addphone-direct
네트워크 및 인터넷		ms-settings:network
상태	ms-settings:network-status
데이터 사용량	ms-settings:datausage
사용가능한 네트워크 표시	ms-availablenetworks:
Cellular & SIM	ms-settings:network-cellular
Wi-Fi	ms-settings:network-wifi
Manage known networks	ms-settings:network-wifisettings
Wi-Fi 호출	ms-settings:network-wificalling
이더넷	ms-settings:network-ethernet
전화 접속	ms-settings:network-dialup
직접 접속	ms-settings:network-directaccess
VPN	ms-settings:network-vpn
에어플레인 모드	ms-settings:network-airplanemode
or
ms-settings:proximity
모바일 핫스팟	ms-settings:network-mobilehotspot
NFC	ms-settings:nfctransactions
프록시	ms-settings:network-proxy
개인 설정		ms-settings:personalization
배경	ms-settings:personalization-background
색	ms-settings:personalization-colors
or
ms-settings:colors
잠금 화면	ms-settings:lockscreen
테마	ms-settings:themes
글꼴 (build 17083)	ms-settings:fonts
시작	ms-settings:personalization-start
시작 메뉴에 표시할 폴더 선택	ms-settings:personalization-start-places
작업 표시줄	ms-settings:taskbar
앱		
앱 및 기능	ms-settings:appsfeatures
선택적 기능	ms-settings:optionalfeatures
기본 앱	ms-settings:defaultapps
오프라인 지도	ms-settings:maps
지도 다운로드	ms-settings:maps-downloadmaps
Apps for websites	ms-settings:appsforwebsites
Video playback (build 16215)	ms-settings:videoplayback
Startup (build 17017)	ms-settings:startupapps
계정		
사용자 정보	ms-settings:yourinfo
이메일 및 계정	ms-settings:emailandaccounts
로그인 옵션	ms-settings:signinoptions
Windows Hello 얼굴 설정	ms-settings:signinoptions-launchfaceenrollment
Windows Hello 지문인식 시작	ms-settings:signinoptions-launchfingerprintenrollment
보안키 설정	ms-settings:signinoptions-launchsecuritykeyenrollment
동적 잠금	ms-settings:signinoptions-dynamiclock
회사 또는 학교 엑세스	ms-settings:workplace
가족 및 다른 사용자	ms-settings:otherusers
키오스크 설정	ms-settings:assignedaccess
설정 동기화	ms-settings:sync
시간 및 언어		
날짜 및 시간	ms-settings:dateandtime
지역	
일본 IME 설정	ms-settings:regionlanguage-jpnime
병음 pinyin IME 설정	ms-settings:regionlanguage-chsime-pinyin
병음 webi IME 설정	ms-settings:regionlanguage-chsime-wubi
기본 설정 언어	ms-settings:regionlanguage
Windows 표시 언어	ms-settings:regionlanguage-setdisplaylanguage
표시 언어 추가	ms-settings:regionlanguage-adddisplaylanguage
음성	ms-settings:speech
게임		
게임바	ms-settings:gaming-gamebar
캡쳐	ms-settings:gaming-gamedvr
게임 모드	ms-settings:gaming-gamemode
Xbox 네트워킹 (build 16226)	ms-settings:gaming-xboxnetworking
기타 추가	(Only available if “settings apps” are installed (e.g. by 3rd party))	
Extras	ms-settings:extras
접근성		
디스플레이 (build 17025)	ms-settings:easeofaccess-display
커서 및 포인터 (build 17040)	ms-settings:easeofaccess-cursorandpointersize
OR
ms-settings:easeofaccess-MousePointer
텍스트 확대	ms-settings:easeofaccess-cursor
돋보기	ms-settings:easeofaccess-magnifier
색상 필터 (build 17025)	ms-settings:easeofaccess-colorfilter
고대비	ms-settings:easeofaccess-highcontrast
내레이터	ms-settings:easeofaccess-narrator
자동 로그인 후 내레이터 시작	ms-settings:easeofaccess-narrator-isautostartenabled
오디오 (build 17035)	ms-settings:easeofaccess-audio
선택 자막	ms-settings:easeofaccess-closedcaptioning
음성 명령 (build 17035)	ms-settings:easeofaccess-speechrecognition
키보드	ms-settings:easeofaccess-keyboard
마우스	ms-settings:easeofaccess-mouse
아이 컨트롤 (build 17035)	ms-settings:easeofaccess-eyecontrol
검색 (version 1903)		
사용 권한 과 기록	ms-settings:search-permissions
Windows 검색	ms-settings:cortana-windowssearch
개인정보		ms-settings:privacy
일반	ms-settings:privacy
음성 명령	ms-settings:privacy-speech
수동 입력 및 키 입력 개인 설정	ms-settings:privacy-speechtyping
피드백 및 진단	ms-settings:privacy-feedback
진단 데이터 보기	ms-settings:privacy-feedback-telemetryviewergroup
활동 기록 (build 17040)	ms-settings:privacy-activityhistory
위치	ms-settings:privacy-location
카메라	ms-settings:privacy-webcam
마이크	ms-settings:privacy-microphone
음성 활성화	ms-settings:privacy-voiceactivation
알림	ms-settings:privacy-notifications
계정 정보	ms-settings:privacy-accountinfo
연락처	ms-settings:privacy-contacts
일정	ms-settings:privacy-calendar
통화 호출	ms-settings:privacy-phonecalls
통화 기록	ms-settings:privacy-callhistory
메일	ms-settings:privacy-email
아이컨트롤 추적	ms-settings:privacy-eyetracker
작업	ms-settings:privacy-tasks
메시지	ms-settings:privacy-messaging
라디오	ms-settings:privacy-radios
기타 장치	ms-settings:privacy-customdevices
백그라운드 앱	ms-settings:privacy-backgroundapps
앱 진단	ms-settings:privacy-appdiagnostics
자동 파일 다운로드	ms-settings:privacy-automaticfiledownloads
문서	ms-settings:privacy-documents
다운로도 폴더 (build 19536)	ms-settings:privacy-downloadsfolder
사진	ms-settings:privacy-pictures
동영상	ms-settings:privacy-documents
파일 시스템	ms-settings:privacy-broadfilesystemaccess
업데이트 및 보안		ms-settings:windowsupdate
Windows 업데이트	ms-settings:windowsupdate
업데이트 체크	ms-settings:windowsupdate-action
업데이트 옵션 보기	ms-settings:windowsupdate-optionalupdates
사용 시간 변경	ms-settings:windowsupdate-activehours
업데이트 기록 보기	ms-settings:windowsupdate-history
다시 시작 옵션	ms-settings:windowsupdate-restartoptions
고급 옵션	ms-settings:windowsupdate-options
전송 최적화	ms-settings:delivery-optimization
Windows 보안	ms-settings:windowsdefender
Windows 보안 열기	windowsdefender:
백업	ms-settings:backup
문제 해결	ms-settings:troubleshoot
복구	ms-settings:recovery
정품 인증	ms-settings:activation
내 장치 찾기	ms-settings:findmydevice
개발자용	ms-settings:developers
Windows 참가자 프로그램	ms-settings:windowsinsider
or
ms-settings:windowsinsider-optin
혼합 현실		ms-settings:holographic
오디오 와 명령어	ms-settings:holographic-audio
환경	ms-settings:privacy-holographic-environment
헤드셋 디스플레이	ms-settings:holographic-headset
삭제	ms-settings:holographic-management
Surface 허브		
계정	ms-settings:surfacehub-accounts
팀 회의	ms-settings:surfacehub-calling
팀 장치 관리	ms-settings:surfacehub-devicemanagenent
세션 클린업	ms-settings:surfacehub-sessioncleanup
환영 화면	ms-settings:surfacehub-welcome
```

### fun
```
(_   _)( )                  ( )       ( )   ( )           ( )  
  | |  | |__     _ _   ___  | |/')    `\`\_/'/'_    _   _ | |  
  | |  |  _ `\ /'_` )/' _ `\| , <       `\ /'/'_`\ ( ) ( )| |  
  | |  | | | |( (_| || ( ) || |\`\       | |( (_) )| (_) || |  
  (_)  (_) (_)`\__,_)(_) (_)(_) (_)      (_)`\___/'`\___/'(_)  
              ~_^ For downloading the file! ^_~           (_)  
```      
