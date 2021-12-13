#!/bin/bash

mkdir ~/.ssh
cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --cluster-init --tls-san $(hostname) --bind-address=192.168.42.110 --advertise-address=192.168.42.110 --node-ip=192.168.42.110" sh -

yum install net-tools -y

chmod +r /etc/rancher/k3s/k3s.yaml