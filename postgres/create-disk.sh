#!/bin/bash

gcloud config set project agile-handy-sandbox-1

gcloud config set compute/zone us-central1-a

gcloud beta compute disks create pg-disk --size 200GB --type pd-standard --zone us-central1-a &

wait 

kubectl apply -f /Users/hmohamed/github/infs890/infs890-research-sre-grpc/postgres-prometheus/postgres/k8s-pv.yaml &

wait

kubectl apply -f /Users/hmohamed/github/infs890/infs890-research-sre-grpc/postgres-prometheus/postgres/k8s-pvc.yaml &

wait

echo "Done!"

# check the persistent volume claim is bounded 
# kubectl get pvc -n metricsdb
