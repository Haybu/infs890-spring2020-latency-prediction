#!/bin/bash

gcloud config set project agile-handy-sandbox-1

gcloud config set compute/zone us-central1-a

gcloud config set container/cluster k8s-db

gcloud container clusters get-credentials k8s-db

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"

kubectl create namespace metricsdb &
wait

kubectl create -f ${SCRIPT_DIR}/k8s-pg-dep.yaml &
wait
kubectl create -f ${SCRIPT_DIR}/k8s-pg-svc.yaml &
wait
kubectl create -f ${SCRIPT_DIR}/k8s-pg-adapter-dep.yaml &
wait
kubectl create -f ${SCRIPT_DIR}/k8s-pg-adapter-svc.yaml &
wait

echo "Done.!"
