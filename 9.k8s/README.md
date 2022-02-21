
## k8s

### INDEX
- [CONTENTS](#contents)
- [CLI](#cli)
- [INSTALL](#install)
    - [KUBECTL](#kubectl)
    - [Hello_Minikube](#hello_minikube)
    - 쿠버네티스-기초학습
        - [1.클러스터생성하기](#basic_module1)
        - [2.kubectl로 deployment생성하기](#basic_module2)
- [doc](#doc)
- [Reference](#Reference)

---

### contents
- 파드는 관리와 네트워킹 목적으로 함께 묶여 있는 하나 이상의 컨테이너 그룹이다
- 파드는 쿠버네티스 클러스터 내에서만 ip로만 접근할 수 있지만, 외부에서 접근하게하려면 쿠버네티스 서비스로 노출해야한다.
- 쿠버네티스를 사용하는 이유는?
    - 소프트웨어를 컨테이너화해서 패키징한다면, 다운타임없이 어플리케이션을 릴리스 및 업데이트하여 어디서든지 구동할 수 있게된다.
- 쿠버네티스 클러스터는?
    - 클러스터를 조율하는 컨트롤 플레인과 worker 역활을하는 node로 구성되어있다
        - Control Plane
            - 클러스터를 관리하며, 어플리케이션의 활동주기를 핸들링한다
        - Node
            - Control Plane과 통신하는 kubelet 에이전트, 컨테이너 운영을 하게되는 docker로 구성된다.
            - node는 최소 세개로 유지되어야한다
- 쿠버네티스 디플로이먼트가 설치스크립트와 다른점은?
    - auto healing 기능을 제공하는지의 차이가있다. 설치스크립트는 문제가 생겼을 때, 복구시켜주지않는다. 하지만 디플로이먼트는 문제가있는 노드의 인스턴스를 다른 노드의 인스턴스로 교체해준다.
- 쿠버네티스 디플로이먼트는 이미지가 필요하다
- 쿠버네티스 프록시는 쿠버네티스 클러스터와 host간에 연결이될 수 있도록해준다

### install
#### kubectl
> https://kubernetes.io/ko/docs/tasks/tools/install-kubectl-windows/

#### hello_minikube
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
- 7 서비스 만들기
```sh
# --type=LoadBalancer플래그는 클러스터 밖의 서비스로 노출하기 원한다는 뜻이다.
kubectl expose deployment hello-node --type=LoadBalancer --port=8080 

# 생성한 서비스 살펴보기
kubectl get services

# minikube에서 LoadBalancer타입은 minikube service 명령어를 통해서 해당 서비스를 접근할 수 있게 한다.
minikube service hello-node 
```

![image](https://user-images.githubusercontent.com/20831981/154503151-9882e9ea-99b8-4094-bcb1-d0dc5f2806dd.png)

- 8 addons 조회 및 enable 하기
```sh
minikube addons list
# c:\git>minikube addons list
# |-----------------------------|----------|--------------|--------------------------------|
# |         ADDON NAME          | PROFILE  |    STATUS    |           MAINTAINER           |
# |-----------------------------|----------|--------------|--------------------------------|
# | metrics-server              | minikube | disabled     | kubernetes                     |
# |-----------------------------|----------|--------------|--------------------------------|

minikube addons enable metrics-server
#   - Using image k8s.gcr.io/metrics-server/metrics-server:v0.4.2
# * 'metrics-server' 애드온이 활성화되었습니다

kubectl get pod,svc -n kube-system
# c:\git>kubectl get pod,svc -n kube-system
# NAME                                   READY   STATUS    RESTARTS      AGE
# pod/coredns-64897985d-dgdws            1/1     Running   0             59m
# pod/etcd-minikube                      1/1     Running   0             59m
# pod/kube-apiserver-minikube            1/1     Running   0             59m
# pod/kube-controller-manager-minikube   1/1     Running   0             59m
# pod/kube-proxy-7mlvg                   1/1     Running   0             59m
# pod/kube-scheduler-minikube            1/1     Running   0             59m
# pod/metrics-server-6b76bd68b6-7jfx4    1/1     Running   0             4m12s
# pod/storage-provisioner                1/1     Running   1 (59m ago)   59m

# NAME                     TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)                  AGE
# service/kube-dns         ClusterIP   10.96.0.10    <none>        53/UDP,53/TCP,9153/TCP   59m
# service/metrics-server   ClusterIP   10.97.30.95   <none>        443/TCP                  4m12s

minikube addons disable metrics-server
# * "The 'metrics-server' 이 비활성화되었습니다

- 9 서비스 및 디플로이먼트 삭제하기
kubectl get svc
# NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
# kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   65m

kubectl delete svc hello-node
# service "hello-node" deleted

kubectl get deployments
# NAME         READY   UP-TO-DATE   AVAILABLE   AGE
# hello-node   1/1     1            1           28m

kubectl delete deployments hello-node
# deployment.apps "hello-node" deleted

kubectl get deployments
# No resources found in default namespace

```

#### #basic_module1
> 쿠버네티스 클러스터 생성하기
```sh
minikube version
minikube start
kubectl cluster-info
# c:\git>kubectl cluster-info
# Kubernetes control plane is running at https://127.0.0.1:6042
# CoreDNS is running at https://127.0.0.1:6042/api/v1/namespaces/kube-system/services/# kube-dns:dns/proxy
# 
# To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'

kubectl get nodes
# c:\git>kubectl get nodes
# NAME       STATUS   ROLES                  AGE    VERSION
# minikube   Ready    control-plane,master   110s   v1.23.1

```

#### #basic_module2
> kubectl 로 deployment 생성하기
```sh
kubectl create deployment
# c:\git>kubectl create deployment
# Error: required flag(s) "image" not set

# c:\git>kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
# deployment.apps/kubernetes-bootcamp created

kubectl get deployments
# c:\git>kubectl get deployments
# NAME                  READY   UP-TO-DATE   AVAILABLE   AGE
# kubernetes-bootcamp   1/1     1            1           66s

kubectl proxy
# c:\git>kubectl proxy
# Starting to serve on 127.0.0.1:8001

curl http://localhost:8001/version
# C:\Users\user>curl http://localhost:8001/version
# {
#   "major": "1",
#   "minor": "23",
#   "gitVersion": "v1.23.1",
#   "gitCommit": "86ec240af8cbd1b60bcc4c03c20da9b98005b92e",
#   "gitTreeState": "clean",
#   "buildDate": "2021-12-16T11:34:54Z",
#   "goVersion": "go1.17.5",
#   "compiler": "gc",
#   "platform": "linux/amd64"
# }

```

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
