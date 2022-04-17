# manual-jira
`JIRA ?` : 아틀라시안이 개발한 사유 이슈 추적 제품. 버그 추적, 이슈 추적, 프로젝트 관리 기능을 제공하는 소프트웨어

## Posting
- API
    - Issue
        - [JIRA - REST API를 활용한 이슈생성 및 이슈정보얻기](https://blog.naver.com/jogilsang/222243227224)
        - [JIRA - SVN 커밋 시, 이슈번호 없을 경우 목록가져오기](https://blog.naver.com/jogilsang/222316201160)
        - [지라JIRA - 기한별, 작업별 이슈리스트 작업자별로 슬랙알람받기](https://blog.naver.com/jogilsang/222460519271)
    - Comment
        - [JIRA - 댓글 Comment를 활용한 코드변경정보 관리, svnlook diff](https://blog.naver.com/jogilsang/222312827310)
- Solution
    - [JIRA - Issue의 첨부된 이미지 썸네일 최대크기 설정하기](https://blog.naver.com/jogilsang/222316187359)
    - [JIRA - Word로 내보내기(export word) 이미지 오류 해결하는 법](https://blog.naver.com/jogilsang/222314888018)

## Reference
- [jira-rest-api-examples](https://developer.atlassian.com/server/jira/platform/jira-rest-api-examples/)   
- [jira-rest-v2-doc](https://developer.atlassian.com/cloud/jira/platform/rest/v2/api-group-workflow-schemes/)  
- [BP-jira-jenkins](https://issues.jenkins.io/projects/JENKINS/issues/JENKINS-37984?filter=allopenissues)
- [BP-jira-atlassian](https://jira.atlassian.com/browse/JRACLOUD-10156)

---

## Macro
### panel
https://confluence.atlassian.com/doc/panel-macro-51872380.html   
```
{panel:title=My title|borderStyle=dashed|borderColor=blue|titleBGColor=#e7f4fa|titleColor=white|bgColor=#E7F4FA}
A formatted panel
{panel}

{panel:title=My title|titleBGColor=#3C78B5|titleColor=white|bgColor=#E7F4FA}
A formatted panel
{panel}

{panel:title=My title|titleBGColor=#F0F0F0|titleColor=white|bgColor=#E7F4FA}
A formatted panel
{panel}

{panel:title=추가항목(Contents)|borderStyle=dashed|borderColor=blue|titleBGColor=#e7f4fa|titleColor=black}
{panel}

div class="panel" style="background-color: #e7f4fa
panelContent" style="background-color: #E7F4FA
```

![image](https://user-images.githubusercontent.com/20831981/157163223-87345aab-ccd8-4e46-a8a0-8e8c5a53ca42.png)
```
{panel:title=이슈주제|borderStyle=dashed|borderColor=blue|titleBGColor=#e7f4fa|titleColor=black}
text
{panel}
```

