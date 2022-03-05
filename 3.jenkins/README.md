# manual-jenkins
`jenkins : CI/CD Tool`

## INDEX
- #### [My Posting](#My%20Posting)
- #### [비용](#비용)
- #### [slack-plugin](#Slack-plugin)
---

## My Posting
- Plugin
    - [젠킨스Jenkins - Jira Issue Updater 플러그인 사용, 배포 시 JIRA 댓글](https://blog.naver.com/jogilsang/222381816460)
    - [젠킨스jenkins - 빌드성공 후 SVN 태깅하기, Perform Subversion Tagging](https://blog.naver.com/jogilsang/222325559402)

## 비용
```
월별 예상 요금: Jenkins 서버를 구축하는 데 드는 총비용은 선택하는 인스턴스 유형에 따라 달라집니다. 
AWS에서 권장하는 구성을 사용하고 m4.large 인스턴스 유형으로 시작하여 40GB를 프로비저닝한다면, 
EBS 드라이브에서 Jenkins를 호스팅하는 데 월별 89 USD가 발생합니다(AWS 프리 티어 한도 내에 있는 경우). 
탄력적 IP 주소가 포함된 비용입니다. 사용된 서비스 및 관련 비용의 내역은 사용 서비스 및 비용을 참조하세요.

https://aws.amazon.com/ko/getting-started/hands-on/setup-jenkins-build-server/
```

## Slack-plugin
### Slack 메세지의 changes는 어떻게 처리되는가 
```java
// AbstractBuild의 getChangeSet()의 getMsg()와 getAuthor().getDisplayName() 로 구현
// 1. 
hudson.model.AbstractBuild
// 2. 
src/main/java/jenkins/plugins/slack/SlackNotifier.java - perform Method
// 3. 
src/main/java/jenkins/plugins/slack/ActiveNotifier.java - completed(AbstractBuild r) Method
// 4. 
message = message + "\n" + getCommitList(r);
AbstractBuild r
String buildKey = BuildKey.format(r);
ChangeLogSet changeSet = r.getChangeSet();
List<Entry> entries = new LinkedList<>();
log.debug(buildKey, "adding changeset entry: %s", o);
entry.getMsg()
entry.getAuthor().getDisplayName()
```

### Send git commit description to Slack using Jenkins
> git이나 svn의 log를 환경변수로 가져올 수 있을듯
```sh
# 1."Execute shell”
echo GIT_LAST_COMMIT_DESCRIPTION=\""$(git log --format="medium" -1 ${GIT_COMMIT})"\" | sed -E 's/$/\\n/g' | tr -d '\n' | sed 's/..$//' > git_last_commit_description

# 2."Inject environment variables"
git_last_commit_description

# 3."Custom Message"
$GIT_LAST_COMMIT_DESCRIPTION

# reference
https://pierreabreu.medium.com/send-git-commit-description-to-slack-using-jenkins-e965aa42ab3f
```

### [svn tagging auto](http://developerautomation.com/jenkins-job-automate-svn-tagging/)
```bash
VERSION_TAG=my_special_version-${VERSION}
FROM=${BASE_PATH}/trunk
TO=${BASE_PATH}/tags/${VERSION_TAG}
svn copy ${FROM} ${TO} --username ${SVN_USER} --password ${SVN_PASS} -m "Creating ${TO} from ${FROM}"
```

---

## Reference
- [Jenkins 환경변수](https://wiki.jenkins.io/display/JENKINS/Building+a+software+project#Buildingasoftwareproject-JenkinsSetEnvironmentVariables)
- [jenkinsci/slack-plugin](https://github.com/jenkinsci/slack-plugin)
- [SVN 태깅 자동화를위한 Jenkins Job](http://www.coolio.so/jenkins-build-with-parameters-%EC%83%9D%EC%84%B1tags-branches/)
