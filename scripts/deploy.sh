#!/bin/bash

# Stop and remove existing container
docker stop my_app || true
docker rm my_app || true

# Remove old image (optional)
docker rmi my_app_image || true

# Build and run the container
cd /home/ec2-user/app
docker build -t my_app_image .
docker run -d -p 80:80 --name my_app my_app_image
