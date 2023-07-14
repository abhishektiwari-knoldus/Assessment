----------Terraform----------

 To deploy a application infrastructure i have used Terraform to create Azure pipeline which integrates with GitHub Repo to access the pipeline configuration (.yaml).
When a developer commits new code in the repo then azure pipiline will automatically gets triggerd and create a docker images and push it to docker hub,after that pipeline fetches the latest image from dockerhub and deploys it to local minikube cluster.
Steps to Create pipeline using Terraform : 
- terraform init (initialize the backend and install the providers) 
- terraform plan (Review the infrastructure changes) 
- terraform apply (create the infrastructure) 
- terraform destroy (destroys the infrastructure after it fullfils your need).     

---------CICD-------------   

To create a CI pipeline I have used azure Pipeline to build a react app using Dockerfile and push it to dockerhub with different versions.   
pipeline configuration is added to CICD durectory in this repo.      

--------Docker-----------   

I have created a multistage Dockerfile of react based app which is build by a jenkins pipeline and push the different versions of docker image to dockerhub. 
After that the latest image from dockerhub is pulled by k8s deployment and deploys it to minikube cluster.   
Dockerfile is added along with pipeline configuration and deployment file in Docker directory in this repo.       

--------Ansible--------------          

In Ansible demo i have created a ansible role named as akash. This role has one task which installes nginx on local machines and applies a ginja template to that machines.
we can change variables in this role to see dynamic content in configured machine's browser.

To run playbook we can use this command : 
ansible-playbook master.yml (It selects the appropriate hosts and roles to run the playbook)

 --------Monitor--------
 For monitoring in this application i have used prometheus and grafana to monitor the cpu and memmory metrics of k8s cluster


