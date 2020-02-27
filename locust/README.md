## install a distributred locust on a separate cluster

create a cluster with 2 nodes ( at least 2vCPU / 7.5 GB)

### add cluster admin role for dashboard
$ kubectl apply -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/k8s-dashboard/dashboard-admin.yaml -n kube-system

$ kubectl create clusterrolebinding myname-cluster-admin-binding --clusterrole=cluster-admin --user=haybu@hotmail.com

### deploy kubernetes dashboard
$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/k8s-dashboard/dashboard.yaml

- to access the dashboard
$ kubectl proxy

go to:
http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

and choose "skip"

### install locust

You need to edit both locust-master-dep and locust-worker-dep files to specify the target URL to the app demo application

$ kubectl apply -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/locust/k8s-manifests/locust-master-dep.yaml 

$ kubectl apply -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/locust/k8s-manifests/locust-master-service.yaml 

$ kubectl apply -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/locust/k8s-manifests/locust-worker-dep.yaml
