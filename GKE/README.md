# This demo used the Google Cloud Platform Kubernetes Engine Samples repo:
# https://github.com/GoogleCloudPlatform/kubernetes-engine-samples

#Â To build the container

gcloud builds submit --tag gcr.io/<project-id>/hello-app:1.0.0

gcloud container clusters get-credentials cluster-demo --zone us-east1-b --project playground-s-11-61fac7db

# Create the deployment

kubectl apply -f helloweb-deployment.yaml
kubectl get pods

#Â Create the service
# (don't forget to remove the line with YOUR.IP.ADDRESS.HERE)

kubectl apply -f helloweb-service-static-ip.yaml
kubectl get services

# The Apache-PHP YAML can be found here:
# https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/
# We add type: LoadBalancer to the Service

# Create the objects:

kubectl apply -f apache-php.yaml

# Grab the external IP:

kubectl get services

# Create the autoscaler

kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10

# Watch for pods, only labelled run=php-apache

kubectl get pods -l run=php-apache -w

# In a new terminal, create the busybox container to generate demand

kubectl run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://<ypur external IP>/; done"




## WordPress demo
git clone https://github.com/linuxacademy/content-gke-basics




```
git clone https://github.com/linuxacademy/content-gke-basics
ls 
cd content-gke-basics/
gcloud container clusters get-credentials cluster-1 --zone us-east1-b --project deploying-wo-201-fe12573f
alias k=kubectl
PS1=$
k apply -f ssd-storageclass.yaml 
k get sc
k apply -f mysql-pvc.yaml 
k apply -f wordpress-pvc.yaml 
k get pvc
echo -n mypassword | base64 -w 0

bXlwYXNzd29yZA==

k apply -f mysql-secret.yaml 
k apply -f mysql-deployment.yaml 
k apply -f mysql-service.yaml 
k get pods
k get svc
k apply -f wordpress-deployment.yaml 
k apply -f wordpress-service.yaml 
k get pods
k get svc
k get pods