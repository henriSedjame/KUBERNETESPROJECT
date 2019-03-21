#!/bin/bash
# Désactiver swap
sudo swapoff -a
# Initialisation du cluster
echo "[TASK 1] Initialisation du cluster"
kubeadm init --pod-network-cidr=192.168.0.0/16  --apiserver-advertise-address=192.168.0.19
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#export KUBECONFIG=/etc/kubernetes/admin.conf
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml



