
## k8s

### INDEX
- [CONTENTS](#contents)
- [CLI](#cli)
- [INSTALL](#install)
    - [KUBECTL](#kubectl)
    - [MINIKUBE](#minikube)
- [doc](#doc)
- [Reference](#Reference)

---

### contents
- 파드는 관리와 네트워킹 목적으로 함께 묶여 있는 하나 이상의 컨테이너 그룹이다
- 파드는 쿠버네티스 클러스터 내에서만 ip로만 접근할 수 있지만, 외부에서 접근하게하려면 쿠버네티스 서비스로 노출해야한다.

### install
#### kubectl
> https://kubernetes.io/ko/docs/tasks/tools/install-kubectl-windows/

#### minikube
> https://kubernetes.io/ko/docs/tutorials/hello-minikube/
- 1 [latest release](https://minikube.sigs.k8s.io/docs/start/)
- 2 [docker 설치](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
```sh
# Required
# 1. taskmgr - performance - CPU - Virtuallizaion checked
# 2. appwiz.cpl - window feature on/off - HyperV
# 3. x64 머신용 최신 WSL2 Linux 커널 업데이트 패키지 
#    (https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi) 
# 4. docker desktop 실행 후, sign in
# 5. "wslEngineEnabled": true
#    C:\Users\<username>\AppData\Roaming\Docker\settings.json
# 6. taskmgr 실행 후, docker desktop 다 끄고 다시시작
```
- 3
```sh
# 3.
minikube config set driver docker
minikube start
# minikube start --driver=docker

# C:\Users\user>minikube start
# * Microsoft Windows 10 Pro 10.0.18363 Build 18363 의 minikube v1.25.1
# * 유저 환경 설정 정보에 기반하여 docker 드라이버를 사용하는 중
# * minikube 클러스터의 minikube 컨트롤 플레인 노드를 시작하는 중
# * 베이스 이미지를 다운받는 중 ...
# * 쿠버네티스 v1.23.1 을 다운로드 중 ...
#  gcr.io/k8s-minikube/kicbase: 0 B [_________________________] ?% ? p/s 53s
# ----->>> 꽤 많이 기다려야함
# * Creating docker container (CPUs=2, Memory=8100MB) ...- E0217 22:42:58.383166    3360 kic.go:267] icacls failed applying permissions - err - [%!s(<nil>)], output - [ó���� ����: C:\Users\user\.minikube\machines\minikube\id_rsa
# 1 ������ ó�������� 0 ������ ó������ ���߽��ϴ�.]

# * 쿠버네티스 v1.23.1 을 Docker 20.10.12 런타임으로 설치하는 중
#   - kubelet.housekeeping-interval=5m
#   - 인증서 및 키를 생성하는 중 ...
#   - 컨트롤 플레인이 부팅...
#   - RBAC 규칙을 구성하는 중 ...
# * Kubernetes 구성 요소를 확인...
#   - Using image gcr.io/k8s-minikube/storage-provisioner:v5
# * 애드온 활성화 : storage-provisioner, default-storageclass
# * 끝났습니다! kubectl이 "minikube" 클러스터와 "default" 네임스페이스를 기본적으로 사용하도록 구성되었습니다.
```
- 4 docker container list에 minikube가 보인다
- 5 minikube dashboard
> 대시보드에서 쿠버네티스 리소스나 디플로이먼트, 서비스를 생성할 수 있다
```sh
c:\git>minikube dashboard
* Verifying dashboard health ...
* 프록시를 시작하는 중 ...
* Verifying proxy health ...
* Opening http://127.0.0.1:8816/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/ in your default browser...
```
- 6 deployment
```sh
c:\git>kubectl create deployment hello-node --image=k8s.gcr.io/echoserver:1.4
deployment.apps/hello-node created

c:\git>kubectl get deployments
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
hello-node   1/1     1            1           18s
```
- 7
![image](https://user-images.githubusercontent.com/20831981/154503151-9882e9ea-99b8-4094-bcb1-d0dc5f2806dd.png)


---

### cli
```sh
minikube addons list

# 디플로이먼트 보기
kubectl get deployments

# 파드보기
kubectl get pods

# 클러스터 이벤트 보기
kubectl get events

# kubectl 환경설정 보기
kubectl config view
```

### doc
- [슬랙Slack - 쿠버네티스](kubernetes.slack.com)
- [LinuxFoundation 이메일 구독하기 - 할인행사 등](bit.ly/3ciWx9r)
- [한글-kubernetes.io/docs](https://kubernetes.io/ko/docs/home/)
- [kubernetes-the-hard-way](https://github.com/kelseyhightower/kubernetes-the-hard-way)

### Reference
- [Cloud Native Computing Foundation](https://www.cncf.io/about/join/)
- [Kubernetes Certified Service Provider (KCSP)](https://www.cncf.io/certification/kcsp/)
- CKAD(Certified Kubernetes Application Developer).  
- CKA(Certified Kubernetes Administrator).   
- CKS(Certified Kubernetes Security Specialist).    
