## Installing the demo application with Istio on GKE

### create a k8s cluster

$ gcloud beta container clusters create infs890 \
  --cluster-version=latest \
  --machine-type=n1-standard-4 \
  --enable-autoscaling --num-nodes 5 --min-nodes 5 --max-nodes 10 \
  --max-nodes-per-pool 100 \
  --enable-autorepair \
  --enable-autoupgrade \
  --scopes=service-control,service-management,compute-rw,storage-ro,cloud-platform,logging-write,monitoring-write,pubsub,datastore \
  --labels=purpose=research \
  --tags=http-server,https-server \
  --no-enable-legacy-authorization \
  --preemptible \
  --enable-stackdriver-kubernetes \
  --zone us-west1-a

### create new node pool
$ gcloud beta container node-pools create infs890-pool --cluster infs890 \
    --enable-autoscaling --min-nodes 5 --max-nodes 10 --machine-type=n1-standard-4 --zone us-west1-a   

### remove the default pool
gcloud beta container node-pools delete default-pool --cluster infs890 --zone us-west1-a  

## set gcloud config with default cluster
$ gcloud config set container/cluster infs890

### get k8s credentials
$ gcloud container clusters get-credentials infs890 --zone us-west1-a

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

### label namespace shop for istio auto-injection:
$ kubectl label namespace default istio-injection=enabled

### set namespace as default in kubectl config
- first get name of context:
$ kubectl config current-context
- then set default namespace in context
$ kubectl config set-context gke_agile-handy-sandbox-1_us-central1-a_infs890 --namespace=default

## install istio 

You can have two options:

1- enable istio add-on if you use GKE
$ gcloud beta container clusters update myk8s --update-addons=Istio=ENABLED --istio-config=auth=MTLS_PERMISSIVE

2- install it using istioctl.

// create a namespace
$ kubectl create namespace istio-system

// install the default profile
$ istioctl manifest apply --set values.kiali.enabled=true --set values.grafana.enabled=true

### Verify that all 23 Istio CRDs were committed to the Kubernetes api-server using the following command:

$ kubectl get crds -n istio-system | grep 'istio.io\|certmanager.k8s.io' | wc -l

### Get istio ingress host (wait a little bit)
$ INGRESS_HOST="$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')"

$ echo "$INGRESS_HOST"

$ curl -v "http://$INGRESS_HOST"

### to access prometheus
- reference: https://istio.io/docs/tasks/telemetry/querying-metrics/
$ kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=prometheus -o jsonpath='{.items[0].metadata.name}') 9090:9090 &

Visit http://localhost:9090/graph in your web browser.

### to access grafana UI
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=grafana -o jsonpath='{.items[0].metadata.name}') 3000:3000

Visit  http://localhost:3000/dashboard/db/istio-dashboard

### to view Jaeger UI
kubectl port-forward -n istio-system $(kubectl get pod -n istio-system -l app=jaeger -o jsonpath='{.items[0].metadata.name}') 16686:16686

Visit http://localhost:16686

### to view Kiali UI
kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=kiali -o jsonpath='{.items[0].metadata.name}') 20001:20001

Visit  http://localhost:20001/kiali/console

## install some prometheus exporters
$ kubectl create namespace exporters

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/prometheus/disk-exporter/prometheus-exporter-disk-usage-ds.yaml -n exporters

$ kubectl create -f /Users/hmohamed/github/infs890-spring2020-latency-prediction/prometheus/kube-state-exporter/ -n exporters

$ helm install node-exporter-v1 --namespace exporters /Users/hmohamed/github/infs890-spring2020-latency-prediction/prometheus/prometheus-node-exporter

### install application in default namespace
The demo application to deploy is cloned from https://github.com/GoogleCloudPlatform/microservices-demo.git
I have cloned it inside this path in my machine /Users/hmohamed/github/infs890-ml-sre-app/

$ kubectl apply -f /Users/hmohamed/github/infs890-ml-sre-app/microservices-demo/istio-manifests -n default

***** authenticate docker with gcr
$ gcloud auth configure-docker -q

***** deploy from inside microservices-demo folder
$ skaffold run --default-repo=gcr.io/agile-handy-sandbox-1 --namespace default
