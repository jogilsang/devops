
### Limit pushes and merges to branches   
https://docs.aws.amazon.com/codecommit/latest/userguide/how-to-conditional-branch.html   

1. IAM에서 정책없이 그룹을 만든다
2. permissions에서 정책을 생성한다
3. 아래 policty를 기입한다
4. IAM-USER에서 그룹을 추가한다.
5. git-bash에서 master로 push가 안되는 것 확인
6. pull request를 통해 

```yml
{
   "Version": "2012-10-17"
    "Statement": [
        {
            "Effect": "Deny",
            "Action": [
                "codecommit:GitPush",
                "codecommit:DeleteBranch",
                "codecommit:PutFile",
                "codecommit:MergeBranchesByFastForward",
                "codecommit:MergeBranchesBySquash",
                "codecommit:MergeBranchesByThreeWay",
                "codecommit:MergePullRequestByFastForward",
                "codecommit:MergePullRequestBySquash",
                "codecommit:MergePullRequestByThreeWay"
            ],
            "Resource": "arn:aws:codecommit:*:*:*",
            "Condition": {
                "StringEqualsIfExists": {
                    "codecommit:References": [
                        "refs/heads/master"
                     ]
                },
                "Null": {
                    "codecommit:References": false
                }
            }
        }
    ]
}
```


