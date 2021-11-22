#!/bin/sh

ipaddr="8.8.8.8"
failog="fail-port.log"

# 확인할 포트는 80, 2222, 8080

for port in 80 2222 8080
do
	nc -w 5 -z $ipaddr $port

	if [ $? -ne 0 ]; then
		echo "Failed at port: $port" >> "./$failog"
	fi
done
