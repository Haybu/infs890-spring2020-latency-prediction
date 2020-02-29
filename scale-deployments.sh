#!/bin/bash

kubectl scale deployment.v1.apps/cartservice --replicas=7
kubectl scale deployment.v1.apps/checkoutservice --replicas=7
kubectl scale deployment.v1.apps/currencyservice --replicas=7
kubectl scale deployment.v1.apps/emailservice --replicas=7
kubectl scale deployment.v1.apps/paymentservice --replicas=7
kubectl scale deployment.v1.apps/productcatalogservice --replicas=7
kubectl scale deployment.v1.apps/shippingservice --replicas=7
kubectl scale deployment.v1.apps/recommendationservice --replicas=7
kubectl scale deployment.v1.apps/frontend --replicas=7
kubectl scale deployment.v1.apps/adservice --replicas=7
kubectl scale deployment.v1.apps/redis-cart --replicas=7

echo "done."
