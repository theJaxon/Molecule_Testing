#!/bin/bash
repo_dir=/etc/yum.repos.d/
docker_ce="$repo_dir/docker-ce.repo"

echo "[TASK 1] Add docker repo file to $repo_dir"
# Add repo file if it's not found in yum.repos.d dir
if [ ! -f $docker_ce ]; then
touch $docker_ce
cat >> "$docker_ce" << 'EOF'
[docker-ce-stable]
name=Docker CE Stable - $basearch
baseurl=https://download.docker.com/linux/centos/8/$basearch/stable/
enabled=1
gpgcheck=1
gpgkey=https://download.docker.com/linux/centos/gpg
EOF
else 
  echo "File docker-ce.repo already exists at $repo_dir"
fi 

echo "[TASK 2] Install docker"
yum repolist 
yum install -y docker-ce

if [ $? -eq 0 ]; then 
# Add current user to docker group
usermod -aG docker $USER 

# Enable docker service
systemctl enable --now docker
fi
