## install postgres and postgres prometheus adapter


$ gcloud config set project agile-handy-sandbox-1

$ gcloud config set compute/zone us-west1-a

$ gcloud beta container clusters create k8s-db \
  --cluster-version=latest \
  --machine-type=n1-standard-2 \
  --enable-autoscaling --num-nodes=2 --min-nodes=2 --max-nodes=4 \
  --enable-autorepair \
  --enable-autoupgrade \
  --scopes=service-control,service-management,compute-rw,storage-ro,cloud-platform,logging-write,monitoring-write,pubsub,datastore \
  --labels=purpose=research \
  --tags=http-server,https-server \
  --no-enable-legacy-authorization \
  --preemptible \
  --enable-stackdriver-kubernetes \
  --zone us-west1-a

$ gcloud config set container/cluster k8s-db

$ gcloud container clusters get-credentials k8s-db --zone us-west1-a

## k8s dashboard
### add cluster admin role for dashboard
$ kubectl apply -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/k8s-dashboard/dashboard-admin.yaml -n kube-system

$ kubectl create clusterrolebinding myname-cluster-admin-binding --clusterrole=cluster-admin --user=haytham.mohamed@gmail.com 

### deploy kubernetes dashboard
$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/k8s-dashboard/dashboard.yaml

## create a disk

$ gcloud beta compute disks create pg-disk --size 200GB --type pd-standard --zone us-west1-a

### install

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/postgres/k8s-pg-dep.yaml 

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/postgres/k8s-pg-svc.yaml 

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/postgres/k8s-pg-adapter-dep.yaml 

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/postgres/k8s-pg-adapter-svc.yaml 
