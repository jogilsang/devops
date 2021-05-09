
https://docs.aws.amazon.com/codebuild/latest/userguide/build-spec-ref.html

AS-IS
```yml
artifacts:
  files:
    - '**/*'
  name: myname-$(date +%Y-%m-%d) 
```

TO-BE
```yml
artifacts:
  files:
    - '**/*'
  name: myproject
```
