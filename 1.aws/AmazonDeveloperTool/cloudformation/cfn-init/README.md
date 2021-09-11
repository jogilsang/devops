```yaml
cat /var/log/cfn-init.log
cat /var/log/cfn-init-cmd.log
```

```YAML
UserData :
  Fn:Base64 :
    !Sub |
      #!/bin/bash -xe
      # Get the latest CloudFormation package
      yum update -y aws-cfn-bootstrap
      # Start cfn-init
      /opt/aws/bin/cfn-init -s ${AWS::StackId} -r MyInstance --region ${AWS::Region}
      # Start cfn-signal to the wait condition
      /opt/aws/bin/cfn-signal -e S? --stack ${AWS::StackId} --resource SampleWaitCondition
      --region ${AWS::Region}
```
