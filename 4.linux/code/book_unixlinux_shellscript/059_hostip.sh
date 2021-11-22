#!/bin/bash


# IP 주소를 얻고 싶은 호스트명 정의
fqdn="www.google.com"

echo "Address if $fqdn"
echo "========"

# host 명령어로 IP주소 얻기, awk 가공해서 출력
host $fqdn | \
awk '/has address/ {print $NF, "IPv4"}
/has IPv6 address/ {print $NF, "IPv6"}'
