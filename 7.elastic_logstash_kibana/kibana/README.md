

### 1. Install
```
sudo wget https://artifacts.elastic.co/downloads/kibana/kibana-7.10.0-amd64.deb
sudo dpkg -i kibana-7.10.0-amd64.deb
```

### 2. config setting
```
cd /etc/
sudo chmod -R 777 kibana/
cd kibana
sudo vi kibana.yml

server.port: 5601
server.host: "localhost"
elasticsearch.hosts: ["http://localhost:9200"]
```

### 3. config 이동
```
sudo cp -r /etc/kibana/kibana.yml /usr/share/kibana/config/kibana.yml
```

### 4. kibana 실행
```
sudo /usr/share/kibana/bin/kibana
```
