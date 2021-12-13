#!/bin/bash

mkdir ~/.ssh

mv /tmp/id_rsa* ~/.ssh/

cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

echo "192.168.42.110 asalahS" >> /etc/hosts

scp -o StrictHostKeyChecking=no root@192.168.42.110:/var/lib/rancher/k3s/server/token /tmp/token
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.42.110:6443 --token-file /tmp/token --node-ip=192.168.42.111" sh -

yum install net-tools -y

# mkdir /etc/rancher/k3s
# scp root@192.168.42.110:/etc/rancher/k3s/k3s.yaml /etc/rancher/k3s/k3s.yaml

# chmod +r /etc/rancher/k3s/k3s.yaml
# echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh
