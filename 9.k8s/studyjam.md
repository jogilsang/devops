

앱 개발: Kubernetes Engine에 애플리케이션 배포 - Python
헬로 노드 쿠버네티스
Kubernetes Engine을 사용하여 배포 관리

```
docker run hello-world
```


docker tag node-app:0.2 gcr.io/[qwiklabs-gcp-01-6cb8138bcc0e]/node-app:0.2

docker rmi node-app:0.2 gcr.io/qwiklabs-gcp-01-6cb8138bcc0e/node-app node-app:0.1
docker rmi node:lts
docker rmi $(docker images -aq) # remove remaining images
docker images

docker pull gcr.io/qwiklabs-gcp-01-6cb8138bcc0e/node-app:0.2
docker run -p 4000:80 -d gcr.io/qwiklabs-gcp-01-6cb8138bcc0e/node-app:0.2
curl http://localhost:4000