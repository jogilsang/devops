# tool
> `ide나 tool 등 도구의 생산성을 향상시키는 내용 등 기재`

## INDEX
- ### [개발자도구(크롬)](#개발자도구(크롬))
- ### [인텔리제이(Intellij)](#Intellij)
- ### [서브라임 텍스트(Sublime)](#Sublime)
- ### [VSCODE]](#vscode)
- ### [접속도구(PUTTY)]](#PUTTY)

---

### [개발자도구(크롬)](https://developer.chrome.com/docs/devtools/)
```
커멘드메뉴 : F12 - ctrl + shift + p - screenshot - Capture node screenshot

이때 원하는 파일을 디버깅에서 제외하는 기능이 Blackbox입니다. 설정 > Blackboxing > Add pattern... 을 눌러 라이브러리를 등록하게 되면 디버깅을 할 때 해당 라이브러리 코드는 디버깅 대상에서 제외되게 됩니다.

Console창에 console.table([배열객체]) 혹은 table([배열객체]) 를 해주시면 됩니다. 그러면 아래와 같이 예쁘게 결과가 나오게 됩니다.
Store as global variable - Console - copy()

Element - select Element - H : Hide 숨기기
Element - select Element - Console - $0 - the currently selected element

Network - 오른쪽 톱니바퀴 클릭 - Capture ScreentShot - 시간별로 사진을 찍어서 반응확인가능
Network - img - Preview - Copy Image as Data URI

```

### Intellij
- 자동완성
```
- sout : System.out.println
- psvm : public static void main(String args[]) 
- iter : for-each 구문생성
- fori: for문 생성
```

---

### Sublime
- keymap
```
- ctrl + shift + d : 한줄복사해서 아래 붙여넣기(like ctrl + d)
- shift + delete : 한줄 지우기 (like ctrl + y)
```
---
### vscode
- keymap
```
- ctrl + shift + d : 한줄복사해서 아래 붙여넣기(like ctrl + d)
- shift + delete : 한줄 지우기 (like ctrl + y)
```
- keymap 중복단축키 변경하기(when 설정)
```bash
# 대문자변경으로 바꾸기(uppercase)
# ctrl + shift + u

upper -> when -> editorHasSelection
output -> when -> !editorHasSelection && editorFocus
```

---

### PUTTY
1. default
```bash
### 로깅 LOGGING : 
&H-&Y&M&D_&T.putty.log

### PEM -> PPK
https://blog.naver.com/jogilsang/221432071928

### 테마 꾸미기
https://blog.naver.com/jogilsang/221853657930
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

