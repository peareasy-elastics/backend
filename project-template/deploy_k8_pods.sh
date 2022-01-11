#!/bin/sh
minikube start
eval $(minikube docker-env)
kubectl apply -f deployments/deploy-redis.yaml
kubectl apply -f deployments/deploy-api.yaml
kubectl apply -f deployments/deploy-ms.yaml
sleep 5
minikube tunnel &> /dev/null &