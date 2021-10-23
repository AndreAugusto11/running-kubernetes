# To install manually

Go to folder k8s:

`cd k8s/`<br/><br/>

First run minikube :

`minikube start`<br/><br/>

Run dashboard :

`minikube dashboard`<br/><br/>

Run each file : 

`kubectl apply -f deployment.yaml`

`kubectl apply -f service.yaml`

`kubectl apply -f ingress.yaml`<br/><br/>

Get node ip (in this case will be minikube's) :

`minikube ip`<br/><br/>

Add the ip address to /etc/hosts :

`<minikube_id> demo.com`<br/><br/>

Access the URLs :

http://demo.com/nginx

http://demo.com/apache

If you access any other path: `http://demo.com/<something>` it should show always the same page (Acting as 404 page as an example).<br/><br/>

Clean up the environment using:

`minikube delete`<br/><br/>

# To install locally with Terraform (minikube)

Go to folder local_terraform:

`cd local_terraform/`<br/><br/>

First run minikube :

`minikube start`<br/><br/>

Run terraform steps :

`terraform init`

`terraform plan`

`terraform apply` <br/><br/>

Get node ip (in this case will be minikube's) :

`minikube ip`<br/><br/>

Add the ip address to /etc/hosts :

`<minikube_id> demo.com`<br/><br/>

Access the URLs :

http://demo.com/nginx

http://demo.com/apache

If you access any other path: `http://demo.com/<something>` it should show always the same page (Acting as 404 page as an example).<br/><br/>

Clean up the environment using:

`minikube delete`<br/><br/>

# To run using Istio (Service Mesh)

First run minikube :

`minikube start`<br/><br/>

Download [Istio](https://istio.io/latest/docs/examples/microservices-istio/setup-kubernetes-cluster/).

Install istio core, istiod and ingress gateway (for more info on what these components mean visit [Istio](https://istio.io/latest/about/service-mesh/)). This will create a new namespace for Istio:

`istioctl install`<br/><br/>

Check if the new namespace was created with the name `istio-system`, and both pods (istiod and ingress gateway) were created in the namespace using:

`kubectl get ns`

and 

`kubectl get pod -n istio-system`<br/><br/>

To Istio know in which pods to inject the proxy container, we need to indicate it. This is done by labeling a namespace with `istio-injection=enabled`. So we will create a namespace and then assign the lable to it. (It could also be done using the default namespace just for simplicity. It has to be the namespace where the pods will run.)

`kubectl create namespace nginx`

`kubectl label namespace nginx istio-injection=enabled`<br/><br/>

To verify everything went correctly run:

`kubectl get ns --show-labels` which should return a all the namespaces. One should be `nginx             Active   30s   istio-injection=enabled(...)`.<br/><br/>

Now we are ready to run the files. Go to folder k8s:

`cd k8s/`<br/><br/>

Run each file : 

`kubectl apply -f deployment.yaml`

`kubectl apply -f service.yaml`

`kubectl apply -f ingress.yaml`

(Alternatively, if you want to run everything at once run `kubectl apply -f k8s/`, which will run all `.yaml` files inside `k8s/`)<br/><br/>

At this moment, the pods are being created with two containers, the Istio proxy and the service itself. To verify run:

`kubectl get pods -n nginx`

Wait until they are all ready.<br/><br/>

We can also verify that the services have been created using:

`kubectl get svc -n nginx`<br/><br/>

## To use addons/integrations as examples

If you want more information on this visit [Istio Integrations](https://istio.io/latest/docs/ops/integrations/).<br/><br/>

### Grafana and Prometheus

Either run the file `grafana.yaml` inside the folder downloaded from Istio (`<your_path>/istio-1.11.3/samples/addons/grafana.yaml`), or use the one publically available, running the command:

`kubectl apply -f <your_path>/istio-1.11.3/samples/addons/grafana.yaml`

or

`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.11/samples/addons/grafana.yaml`<br/><br/>

We can check the pod and the service have been created within the `istio-system` namespace:

`kubectl get pods -n istio-system`

`kubectl get svc -n istio-system`<br/><br/>

As we can see, the service `grafana` can in open on port 3000 inside the cluster, but we want to access it in our browser locally. How do we do that?

We have to specify we want that mapping, which will be done automatically to the same port in the local host:

`kubectl port-forward svc/grafana -n istio-system 3000`<br/><br/>

Open the browser in [Grafana Dashboard](http://localhost:3000)<br/><br/>

Why can't you see anything?<br/><br/>

Well, Grafana is a tool that allows you to configure Dashboards, but it does not collect the metrics by itself. So we need a data source: in this case we will use Prometheus.<br/><br/>

Using Istio, this is as easy as running the corresponding `.yaml` file as done before with Grafana.

So first stop the port mapping command and run the same command we ran for Grafana, now modified:

`kubectl apply -f <your_path>/istio-1.11.3/samples/addons/prometheus.yaml`

or

`kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.11/samples/addons/prometheus.yaml`<br/><br/>

And run the port mapping again:

`kubectl port-forward svc/grafana -n istio-system 3000`<br/><br/>

And voilà! The metrics are being displayed in 5 different dashboards that you can explore and learn more in [Grafana Configuration](https://istio.io/latest/docs/ops/integrations/grafana/#configuration)<br/><br/>

If you want to play around with this, do a simple benchmark using ab (Apache HTTP server benchmarking tool):

`ab -n 20000 http://demo.com/apache`

Check some metrics changing like in the picture.

![](/Grafana.png)<br/><br/>

Clean up the environment using:

`minikube delete`<br/><br/>

# To install in GCP with Terraform

Go to folder gcp_terraform:

`cd gcp_terraform/`<br/><br/>

Install gcloud and configure the project and credentials ([Cloud SDK](https://cloud.google.com/sdk/docs/quickstart))

Run terraform steps :

`terraform init`

`terraform plan`

`terraform apply` 

(These steps can take some time...)<br/><br/>

At the moment, the ingress is not correctly configured. To access the services, we have to do that individually through the respective node.

Clean up the environment using:

`terraform destroy`<br/><br/>
