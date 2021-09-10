
# 4.linux

## INDEX
### - Learn to live Terminal
- ### [network](#network)
  - #### [tcpdump](#tcpdump)

---

### network
- #### tcpdump
  `tcpdump는 CLI에서 실행하는 패킷캡쳐 프로그램 like wireshark`
  ```bash
  -- TCP/UDP만 캡쳐
  sudo tcpdump tcp
  sudo tcpdump udp
  
  -- 옵션 : 출력카운트 10개
  -c 10
  
  -- src의 ip가 192.168.0.1 이면서 port가 80인경우
  sudo tcpdump src port 80 and src 192.168.0.1
  -- src의 port가 8080이면서 tcp인경우
  sudo tcpdump src port 8080 and tcp
  -- src의 ip가 192.168.0.1이면서 dst의 포트가 8080 또는 8000 인경우
  sudo tcpdump 'src 192.168.0.1 and (dst port 8080 or 8000)'
  
  -- 파일읽기/쓰기
  sudo tcpdump -w dump.log
  sudo tcpdump -r dump.log
  ```


<!-- bash
System Performance
nmon, iostat, sar, vmstat

Others 
strace, dtrace, systemtap
uname,df,history

Network
nmap,tcpdump,ping,mtr,traceroute,dig
airmon,airodump, dig ,iptables, netstat

Process Monitoring
ps, top, htop, atop,lsof

Text Manipulation TOols
awk, sed, grep, sort, uniq, cat, cut, echo, fmt, tr, nl ,egrep, frep,wc -->

