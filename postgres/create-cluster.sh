#!/bin/bash


gcloud config set project agile-handy-sandbox-1

gcloud config set compute/zone us-central1-a

gcloud beta container clusters create k8s-db \
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
  --enable-stackdriver-kubernetes &

wait

echo " "
echo "Kubernetes cluster k8s-db is created."
echo " "

gcloud container clusters list

gcloud config set container/cluster k8s-db

gcloud container clusters get-credentials k8s-db

kubectl create clusterrolebinding myname-cluster-admin-binding --clusterrole=cluster-admin --user=haytham.mohamed@gmail.com &

wait

echo "Done."
