```yaml
UserData :
  Fn:Base64: |
    #!/bin/bash -xe
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "Hello World from user data" > /var/www/html/index.html

cat /var/log/cloud-init-output.log
```
