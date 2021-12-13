#!/bin/bash

server_ip=10.11.100.56
ssh root@${server_ip} 'kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo'