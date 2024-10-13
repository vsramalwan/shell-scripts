#!/bin/bash
# https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/
KUBERNETES_VERSION=v1.31

sudo apt-get update && apt-get upgrade
sudo apt-get install -y apt-transport-https ca-certificates curl gpg

mkdir -p -m 755 /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/${KUBERNETES_VERSION}/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/${KUBERNETES_VERSION}/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

echo "Installing kubelet, kubeadm and kubectl..."
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
apt-mark hold kubelet kubeadm kubectl

echo "Enabling kubelet service..."
systemctl enable --now kubelet