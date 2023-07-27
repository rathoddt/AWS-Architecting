# Istio setup
`helm upgrade --install kube-prometheus-stack --repo https://prometheus-community.github.io/helm-charts kube-prometheus-stack --namespace istio-system --create-namespace --values values-kube-prometheus.yml`  

`helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace --values values-ingress-nginx.yml`  

# links
https://github.com/in28minutes/kubernetes-crash-course/tree/master/11-istio-scripts-and-configuration


```
kubectl create namespace istio-system
```
