#!/bin/bash

kubectl scale deployment.v1.apps/cartservice --replicas=3
kubectl scale deployment.v1.apps/checkoutservice --replicas=3
kubectl scale deployment.v1.apps/currencyservice --replicas=3
kubectl scale deployment.v1.apps/emailservice --replicas=3
kubectl scale deployment.v1.apps/paymentservice --replicas=3
kubectl scale deployment.v1.apps/productcatalogservice --replicas=3
kubectl scale deployment.v1.apps/shippingservice --replicas=3
kubectl scale deployment.v1.apps/recommendationservice --replicas=3

echo "done."
