## install postgres and postgres prometheus adapter


create a cluster with 2 nodes ( at least 2vCPU / 7.5 GB)

## k8s dashboard
### add cluster admin role for dashboard
$ kubectl apply -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/k8s-dashboard/dashboard-admin.yaml -n kube-system

$ kubectl create clusterrolebinding myname-cluster-admin-binding --clusterrole=cluster-admin --user=habu@hotmail.com 

### deploy kubernetes dashboard
$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/k8s-dashboard/dashboard.yaml

## create a disk

create a disk via Linode management console

### install

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/postgres/volume-pvc.yaml 

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/postgres/k8s-pg-dep.yaml 

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/postgres/k8s-pg-svc.yaml 

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/postgres/k8s-pg-adapter-dep.yaml 

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/postgres/k8s-pg-adapter-svc.yaml 
