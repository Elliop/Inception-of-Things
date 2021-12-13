#!/bin/bash

# ip address of server
server_ip=10.11.100.56

# copy public ssh key to the server
ssh-copy-id -i ~/.ssh/id_rsa.pub root@${server_ip}
ssh-keyscan -t rsa ${server_ip} > ~/.ssh/known_hosts

# copy argocd to config to the server
scp -r ../confs root@${server_ip}:/root/.

# copy setup to the server 
scp -r setup.sh root@${server_ip}:/root/.

# connect to the server and run script
ssh root@${server_ip} -t 'bash setup.sh'
