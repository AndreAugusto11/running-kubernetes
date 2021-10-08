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

# To install using a cluster created with Terraform

First create a project in Google Cloud console

Replace your project id in file variables.tf

Install Cloud SDK :

`https://cloud.google.com/sdk/docs/install`<br/><br/>

Install components :

`glcoud components install kubectl`<br/><br/>

Authenticate :

`gcloud auth login`<br/><br/>

Set project :

`gcloud config set project PROJECT_ID`<br/><br/>

Set default login (this way we don't have to load credentials in the code) :

`gcloud auth application-default login`<br/><br/>

Install Terraform (if you don't have it already) :

`sudo apt-get update`

`curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -`

`sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"`

`sudo apt-get update`

`sudo apt-get -y install terraform`<br/><br/>

Run terraform steps :

`terraform init`

`terraform plan`

`terraform apply` <br/><br/>

Check the cluster has been created and Run the same commands as before manually with kubectl :

`Connect to the cluster by copying the command`

Run each file : 

`kubectl apply -f deployment.yaml`

`kubectl apply -f service.yaml`

`kubectl apply -f ingress.yaml`<br/><br/>