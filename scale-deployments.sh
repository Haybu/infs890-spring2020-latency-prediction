#!/bin/bash

kubectl scale deployment.v1.apps/cartservice --replicas=1
kubectl scale deployment.v1.apps/checkoutservice --replicas=1
kubectl scale deployment.v1.apps/currencyservice --replicas=1
kubectl scale deployment.v1.apps/emailservice --replicas=1
kubectl scale deployment.v1.apps/paymentservice --replicas=1
kubectl scale deployment.v1.apps/productcatalogservice --replicas=1
kubectl scale deployment.v1.apps/shippingservice --replicas=1
#kubectl scale deployment.v1.apps/recommendationservice --replicas=1

echo "done."
