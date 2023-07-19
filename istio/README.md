# Istio setup
`helm upgrade --install kube-prometheus-stack --repo https://prometheus-community.github.io/helm-charts kube-prometheus-stack --namespace istio-system --create-namespace --values values-kube-prometheus.yml`  

`helm upgrade --install ingress-nginx ingress-nginx --repo https://kubernetes.github.io/ingress-nginx --namespace ingress-nginx --create-namespace --values values-ingress-nginx.yml`  