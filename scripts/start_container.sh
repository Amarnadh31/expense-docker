#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull amarnadh31/mysql

# Run the Docker image as a container
docker run -d amarnadh31/mysql