#!/bin/bash
echo "[TASK 1] Generate ansible.cfg"
ansible_cfg=/home/vagrant/ansible.cfg
ansible_inventory=/home/vagrant/inventory  

if [ ! -f $ansible_cfg ]; then 
cat >> "$ansible_cfg" << EOF
[defaults]
remote_user = root 
inventory = $ansible_inventory
ask_pass = False 

[privilege_escalation]
become = True 
become_user = root
become_method = sudo 
become_ask_pass = False
EOF
fi