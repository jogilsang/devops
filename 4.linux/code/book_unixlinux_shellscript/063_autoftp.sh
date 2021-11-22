#!/bin/sh

#FTP 접속 설정

server="192.168.2.5"

user="user1"

password="xxxxx"
dir="/home/user1/myadpp/log"
filename="app.log"

# Upload
# put "$filename"

ftp -n "$server" << _EOT_
user "$user" "$password"
binary
cd  "$dir"
get "$filename"
_EOT_
