#!/bin/bash

minikube delete --all
minikube start --driver=hyperkit
minikube addons enable ingress

./kubernetes/init-cluster.sh

minikube dashboard
