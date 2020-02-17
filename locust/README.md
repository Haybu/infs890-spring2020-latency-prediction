## install a distributred locust on a separate cluster

### create a new cluster 
$ gcloud config set project agile-handy-sandbox-1

$ gcloud config set compute/zone us-central1-a

$ gcloud beta container clusters create k8s-locust \
  --cluster-version=latest \
  --machine-type=n1-standard-2 \
  --enable-autoscaling --min-nodes=2 --max-nodes=4 \
  --enable-autorepair \
  --enable-autoupgrade \
  --scopes=service-control,service-management,compute-rw,storage-ro,cloud-platform,logging-write,monitoring-write,pubsub,datastore \
  --labels=purpose=research \
  --tags=http-server,https-server \
  --no-enable-legacy-authorization \
  --num-nodes=4 \
  --preemptible \
  --enable-stackdriver-kubernetes \
  --zone us-central1-a

$ gcloud config set container/cluster k8s-locust

$ gcloud container clusters get-credentials k8s-locust --zone us-central1-a

### add cluster admin role for dashboard
$ kubectl apply -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/k8s-dashboard/dashboard-admin.yaml -n kube-system

$ kubectl create clusterrolebinding myname-cluster-admin-binding --clusterrole=cluster-admin --user=haytham.mohamed@gmail.com

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
