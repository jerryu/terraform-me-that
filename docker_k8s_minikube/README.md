This set creates a docker image to run a hello-world flask-based python app, publishes it to minikube, and
confiures a kubernets service to run the app using terraform

prereqs:
* working & running docker & minikube with ~/.kube/config
* functional hashicorp/terraform installation and familiarity with terraform workflow (init, plan, apply, state, show, destroy)

Please review README in each directory

* README.md  - this file
* docker-image/     This directory prepares & publishes a docker image to minikube.
* terra-minikube/   This directory uses terraform to configure a two-replica deployment with the image above and to expose through service/nodeport
