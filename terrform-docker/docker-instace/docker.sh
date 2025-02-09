#!/bin/bash
set -e  # Exit on any error
sudo dnf -y install dnf-plugins-core || { echo "Failed to install dnf plugins"; exit 1; }
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo || { echo "Failed to add Docker repo"; exit 1; }
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || { echo "Failed to install Docker"; exit 1; }
sudo systemctl start docker || { echo "Failed to start Docker service"; exit 1; }
sudo systemctl enable docker || { echo "Failed to enable Docker service"; exit 1; }
sudo usermod -aG docker ec2-user || { echo "Failed to add user to Docker group"; exit 1; }
echo "Docker installed and configured successfully!"

lsblk
sudo pvcreate /dev/xvdb
sudo vgextend RootVG /dev/xvdb
sudo lvextend -L +25G /dev/RootVG/varVol
sudo lvextend -L +24G /dev/RootVG/rootVol
sudo xfs_growfs /dev/RootVG/varVol
sudo xfs_growfs /dev/RootVG/rootVol


ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo mv /tmp/eksctl /usr/local/bin


curl -O https://s3.us-west-2.amazonaws.com/amazon-eks/1.31.0/2024-09-12/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

