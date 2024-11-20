#!/bin/bash
set -e  # Exit on any error
sudo dnf -y install dnf-plugins-core || { echo "Failed to install dnf plugins"; exit 1; }
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo || { echo "Failed to add Docker repo"; exit 1; }
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || { echo "Failed to install Docker"; exit 1; }
sudo systemctl start docker || { echo "Failed to start Docker service"; exit 1; }
sudo systemctl enable docker || { echo "Failed to enable Docker service"; exit 1; }
sudo usermod -aG docker ec2-user || { echo "Failed to add user to Docker group"; exit 1; }
echo "Docker installed and configured successfully!"