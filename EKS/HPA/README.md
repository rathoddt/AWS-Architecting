# HorizontalPodAutoscaler

```
kubectl apply -f deployment-for-hpa.yaml
kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10

# Run this in a separate terminal
# so that the load generation continues and you can carry on with the rest of the steps
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"

# type Ctrl+C to end the watch when you're ready
kubectl get hpa php-apache --watch
```




### Resources
https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

https://github.com/kubernetes-sigs/metrics-server#readme