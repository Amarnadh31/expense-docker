#!/bin/bash
set -e

#stop the container
# Get the list of running containers
running_containers=$(docker ps -q)

if [ -n "$running_containers" ]; then
    echo "Stopping and removing running containers..."
    docker stop $running_containers
    docker rm -f $(docker ps -aq)
else
    echo "No running containers found. Skipping stop step."
fi
# docker stop $(docker ps -q) && docker rm -f $(docker ps -aq)
