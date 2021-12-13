#!/bin/bash

mkdir ~/.ssh
mv /tmp/id_rsa* ~/.ssh/
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

curl https://releases.rancher.com/install-docker/19.03.sh | sh

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --cluster-init --tls-san $(hostname) --bind-address=192.168.42.110 --advertise-address=192.168.42.110 --node-ip=192.168.42.110" sh -s - --docker

yum install net-tools -y

chmod +r /etc/rancher/k3s/k3s.yaml

sleep 40

# kubectl apply -f .
/usr/local/bin/kubectl apply -f /tmp/app1.yaml
/usr/local/bin/kubectl apply -f /tmp/app2.yaml
/usr/local/bin/kubectl apply -f /tmp/app3.yaml
/usr/local/bin/kubectl apply -f /tmp/svc.yaml
/usr/local/bin/kubectl apply -f /tmp/ingress.yaml
