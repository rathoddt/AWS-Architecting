# Elastic Kubernetes Service

### Installation
Linux
```
# for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH

curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"

# (Optional) Verify checksum
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

sudo mv /tmp/eksctl /usr/local/bin
```

Installing `kubectl`


Configuring kubectl for AWS EKS  
`aws sts get-caller-identity`  
`aws eks update-kubeconfig --region us-east-1 --name eks-demo`  

`eksctl get nodegroup --cluster=eksctl-test`  

`eksctl create cluster --config-file=eksctl-create-ng.yaml`  

`eksctl get cluster`  
`eksctl delete cluster --name=eksctl-test`  

`eksctl upgrade cluster --name eksctl-test --version 1.27 --approve`  
`eksctl upgrade nodegroup --name=ng2-managed --cluster=eksctl-test`  

## Using Helm
`choco install kubernetes-helm`  

`helm version`  

`helm repo add stable https://charts.helm.sh/stable`  
`helm search repo`  
`helm search repo wordpress`  
`helm search repo nginx`  
`helm search hub nginx`  
`helm search hub wordpress`  
`helm search hub nginx`  
`helm repo add bitnami https://charts.bitnami.com/bitnami`  
`helm search repo nginx`  
`helm pull bitnami/nginx --untar=true`  

`eksctl create cluster --name eks-helm --version 1.27 --nodegroup-name wkr-nodes --node-type t3.micro --nodes 2 --managed`  
`aws sts get-caller-identity`  
`aws eks update-kubeconfig --region us-east-1 --name eks-helm`  
`kubectl get nodes`  
`kubectl get all`  
`helm install helm-nginx  bitnami/nginx`  
`kubectl get all`  

`eksctl scale nodegroup --cluster=eks-helm --nodes=3 --nodegroup-name wkr-nodes-02`  
`eksctl create cluster -f eksctl-create-ng.yaml`  
`eksctl scale nodegroup --cluster=eks-helm --nodes=3 --name=wkr-nodes`  
`eksctl scale nodegroup --cluster=eks-logging --nodes=3 --name=ng2-managed`  

`eksctl get nodegroup --cluster eks-logging --region us-east-1 --name ng2-managed`  

`kubectl apply -f FluentD/fluentd.yml`  