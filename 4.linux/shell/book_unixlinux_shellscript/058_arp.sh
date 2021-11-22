#!/bin/sh

ipaddr="172.31.0.1"

# macaddr=$(arp -an | awk "/\($ipaddr \)/ {print \$4 }")
macaddr=$(arp -an | awk '/\(172.31.0.1\)/ {print $4}') 
# arp -an | awk '/172.31.0.1/ {print $4}'

if [ -n "$macaddr " ];then
	echo "$ipaddr -> $macaddr"
else
	echo "$ipaddr가 ARP캐쉬에 없습니다"
fi

