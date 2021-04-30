echo "hi, starting..."

minikube --vm-driver=docker start --extra-config=apiserver.service-node-port-range=1-35000
minikube addons enable ingress
minikube addons enable dashboard
minikube dashboard &

eval $(minikube docker-env)


kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

IP=$(kubectl get node -o=custom-columns='DATA:status.addresses[0].address' | sed -n 2p)
printf "minikube IP: ${IP}"
docker build -t service_nginx ./srcs/nginx
docker build -t service_mysql ./srcs/mysql
docker build -t service_php-my-admin ./srcs/phpmyadmin

kubectl apply -f ./srcs/
