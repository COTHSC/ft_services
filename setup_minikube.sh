#!/bin/bash

# Download and install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Ensure minikube env is new
minikube delete

# Starting minikube env
minikube start --driver=docker

# Allowing addons
minikube addons enable dashboard
minikube addons enable metallb

# Connet minikube image registery to local docker registry
#eval $(minikube -p minikube docker-env)
SETUP K8S
#!/bin/bash

# Download and install kubectl the CLI of Kubernetes
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x ./kubectl

sudo mv ./kubectl /usr/local/bin/kubectl

kubectl version --client

# Preparing minikube

eval $(minikube -p minikube docker-env)

echo "⚡ -- Minikube configured and running\n"

# Building docker images of our services

docker build -t service_nginx ./srcs/nginx
docker build -t service_mysql ./srcs/mysql
docker build -t service_php-my-admin ./srcs/phpmyadmin

echo "⚡ -- Docker Images ready\n"
#Install MetalLB in the cluster
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl apply -f ./srcs/pods/metallb-configmap.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f ./srcs/
# Apps pre-requisite (Secrets, configmaps..)
