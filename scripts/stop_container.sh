#!/bin/bash
set -e

# Ensure Docker is using the correct socket
export DOCKER_HOST="unix:///var/run/docker.sock"

# Get the list of running containers
running_containers=$(docker ps -q)

if [ -n "$running_containers" ]; then
    echo "Stopping running containers..."
    docker stop $running_containers

    echo "Removing all stopped containers..."
    docker rm -f $(docker ps -aq)
else
    echo "No running containers found. Skipping stop step."
fi

# docker stop $(docker ps -q) && docker rm -f $(docker ps -aq)
