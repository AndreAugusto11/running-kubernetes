# To install manually

Go to folder app:

`cd app/`<br/><br/>

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

`http://demo.com/nginx`

`http://demo.com/apache`

If you access any other path: `http://demo.com/<something>` it should show always the same page (Acting as 404 page as an example).<br/><br/>

# To install fully with Terraform locally

Run terraform steps :

`terraform init`

`terraform plan`

`terraform apply` <br/><br/>

Get node ip (in this case will be minikube's) :

`minikube ip`<br/><br/>

Add the ip address to /etc/hosts :

`<minikube_id> demo.com`<br/><br/>

Access the URLs :

`http://demo.com/nginx`

`http://demo.com/apache`

If you access any other path: `http://demo.com/<something>` it should show always the same page (Acting as 404 page as an example).<br/><br/>

