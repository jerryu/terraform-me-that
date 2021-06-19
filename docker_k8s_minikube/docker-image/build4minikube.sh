eval $(minikube -p minikube docker-env)
docker build . --tag helloflask:latest
