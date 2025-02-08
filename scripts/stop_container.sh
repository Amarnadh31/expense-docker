#!/bin/bash
set -e

#stop the container

docker stop $(docker ps -q) && docker rm -f $(docker ps -aq)
