# AWSCLI

## INDEX
- ### [Install](#%20-%20Install)
- ### [Configure](#%20-%20Configure)
- ### [Example](#%20-%20Example)

---

## - Install
```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
aws --version
```

## - Configure
```
aws configure

AWS Access Key ID [None] : Enter
AWS Secret Access Key [None] : Enter
Default region name [None] : Enter
Default output format [None] : Enter

cat ~/.aws/config
cat ~/.aws/credential
```

## - Example
```
/home/ec2-user/AWSCLI/aws/dist/awscli/examples
```