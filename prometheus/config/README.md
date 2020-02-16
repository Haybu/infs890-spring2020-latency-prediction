### Configure and Deploy Prometheus

prometheus comes with istio. scale the deployment down to zero, then apply the attached two mapconfig file, and scale back the deployment replica

```bash

$ Kubectl config use-context gke_agile-handy-sandbox-1_us-west1-a_infs890

$ kubectl delete deployment prometheus -n istio-system 

$ kubectl delete configmap prometheus -n istio-system

$ kubectl apply -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/prometheus/config/prometheus-alertrules.yaml -n istio-system

$ kubectl apply -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/prometheus/config/prometheus-configmap.yaml -n istio-system

$ kubectl apply -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/prometheus/config/prometheus-deployment.yaml  -n istio-system

```