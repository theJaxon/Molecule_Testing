#!/bin/bash
echo "[TASK 1] Install ansible"
yum install -y epel-release 
yum install -y ansible 

echo "[TASK 2] Install python and pip3"
yum module install -y python36
yum install -y python3-pip 

echo "[TASK 3] Use pip3 to install molecule and docker"
pip3 install molecule docker 
