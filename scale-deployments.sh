#!/bin/bash

kubectl scale deployment.v1.apps/cartservice --replicas=5
kubectl scale deployment.v1.apps/checkoutservice --replicas=5
kubectl scale deployment.v1.apps/currencyservice --replicas=5
kubectl scale deployment.v1.apps/emailservice --replicas=5
kubectl scale deployment.v1.apps/paymentservice --replicas=5
kubectl scale deployment.v1.apps/productcatalogservice --replicas=5
kubectl scale deployment.v1.apps/shippingservice --replicas=5
kubectl scale deployment.v1.apps/recommendationservice --replicas=5

echo "done."
