#!/bin/bash

kubectl autoscale deployment cartservice --cpu-percent=80 --min=1 --max=10 -n default
kubectl autoscale deployment checkoutservice --cpu-percent=80 --min=1 --max=10 -n default
kubectl autoscale deployment currencyservice --cpu-percent=80 --min=1 --max=10 -n default
kubectl autoscale deployment emailservice --cpu-percent=80 --min=1 --max=10 -n default
kubectl autoscale deployment paymentservice --cpu-percent=80 --min=1 --max=10 -n default
kubectl autoscale deployment productcatalogservice --cpu-percent=80 --min=1 --max=10 -n default
kubectl autoscale deployment shippingservice --cpu-percent=80 --min=1 --max=10 -n default
kubectl autoscale deployment recommendationservice --cpu-percent=80 --min=1 --max=10 -n default
kubectl autoscale deployment frontend --cpu-percent=80 --min=1 --max=10 -n default
kubectl autoscale deployment adservice --cpu-percent=80 --min=1 --max=10 -n default
kubectl autoscale deployment redis-cart --cpu-percent=80 --min=1 --max=10 -n default

echo "done."
