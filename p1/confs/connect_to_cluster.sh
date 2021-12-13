#!/bin/sh

master_ip=192.168.42.110

curl -L https://storage.googleapis.com/kubernetes-release/release/v1.22.3/bin/darwin/amd64/kubectl -o /tmp/kubectl
chmod +x /tmp/kubectl

scp root@${master_ip}:/etc/rancher/k3s/k3s.yaml /tmp/.k3s.yaml
export KUBECONFIG="/tmp/.k3s.yaml"
alias kubectl="/tmp/kubectl"