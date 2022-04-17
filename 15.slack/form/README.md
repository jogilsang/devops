

###
```
https://app.slack.com/block-kit-builder
```

### 메세지 양식
![image](https://user-images.githubusercontent.com/20831981/147634465-6c760670-0e42-416b-ac62-b1d5f2d19b7d.png)
```json
{
	"blocks": [
		{
			"type": "context",
			"elements": [
				{
					"type": "plain_text",
					"text": "개발서버, Exception 확인요청드립니다.\n file : /usr/local/tomcat/catalina/access.log",
					"emoji": true
				}
			]
		},
		{
			"type": "divider"
		},
		{
			"type": "section",
			"text": {
				"type": "mrkdwn",
				"text": "```2021-12-29 14:37:24.967 [DEBUG] --- [http-nio-9010-exec-93] c.n.f.w.g.e.GlobalExceptionController : request has an exception```"
			}
		}
	]
}
```


### 메세지 형식1
```
                // msg = {
                        //     "response_type": "in_channel",
                        //     "attachments": [
                        //         {
                        //             "color": "#50BCDF",
                        //             "blocks": [
                        //                 {
                        //                     "type": "header",
                        //                     "text": {
                        //                         "type": "plain_text",
                        //                         "text": "Task 이슈가 생성됬습니다",
                        //                         "emoji": true
                        //                     }
                        //                 },
                        //                 {
                        //                     "type": "divider"
                        //                 },
                        //                 {
                        //                     "type": "section",
                        //                     "text": {
                        //                         "type": "mrkdwn",
                        //                         "text": resultTitle
                        //                     }
                        //                 },
                        //                 {
                        //                     "type": "section",
                        //                     "text": {
                        //                         "type": "mrkdwn",
                        //                         "text": resultLink
                        //                     }
                        //                 }
                        //             ]
                        //         }
                        //     ]
                        // }
```

### 메세지 형식2
```
             // 단위테스트 또는 통합테스트
                        msg = {
                            "response_type": "in_channel",
                            "attachments": [
                                {
                                    "fallback": "Task(Issue) has been created.",
                                    "pretext": "Task(Issue) has been created.",
                                    "color": colorList[issuetype],
                                    "fields": [
                                        {
                                            "title": resultTitle,
                                            "value": resultLink,
                                            "short": false
                                        }
                                    ]
                                }
                            ]
                        };
```
