echo "hi, starting..."

minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable ingress
minikube addons enable dashboard
minikube dashboard &

eval $(minikube docker-env)

IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
printf "minikube IP: ${IP}"
docker build -t service_nginx ./srcs/nginx

kubectl create -f ./srcs/

open http://$IP


