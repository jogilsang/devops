
### 모든 메모장 저장 시 기본형식, UTF-8 변경
```
1. [ Window키 + R ]로 실행창을 띄운 뒤, shellnew 
2. TXTUTF-8.txt 파일 저장 (UTF-8형식)
3. [ Window키 + R ]로 실행창을 띄운 뒤 [ regedit ]
4. 레지스트리 편집기 내 HKEY_CLASSES_ROOT > .txt 의 경로로 이동
5. 마우스 우클릭 > 새로만들기 > 문자열 값 클릭
6. [ 새 값 #1 ]로 나타난 이름을 [ FileName ] 으로 변경
7. FileName 더블클릭하여 값 데이터에 [ TXTUTF-8.txt ]를 입력한 뒤 레지스트리 편집기닫기
```