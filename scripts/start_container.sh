#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull amarnadh31/mysql

# Run the Docker image as a container
docker run -d --name mysql amarnadh31/mysql 

docker pull amarnadh31/backend


docker run -d -p 80:80 --name backend amarnadh31/backend

docker pull amarnadh31/frontend

docker run -d -p 80:80 --name frontend amarnadh31/frontend


