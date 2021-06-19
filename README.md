# terraform-me-that

This repo collects [Terraform](terraform.io) configurations to provision that, be it a vm, a container, a kubernetes service

Many thanks go to vendor documentation team, public forums contributors, as I learn&research ways to integrate new pieces into a working infrastructure

Current plan is to do this for various IaaS providers (AWS, GCP, IBM, Azure), etc.  

Pull request welcome. Issues reporting appreciated.

* [aws_ec2](../../tree/main/aws_ec2)  
> to provision AWS infrastructure from scratch, to instantiate a functional & customizable EC2 instance
* [docker_k8s_minikube](../../tree/main/docker_k8s_minikube)
> to bake a docker image to run a hello-world python flask app, publishes to minikube, and configures a kubernets service using this image & terraform
