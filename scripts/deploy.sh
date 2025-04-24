#!/bin/bash

# Stop and clean up previous container/image
sudo docker stop my_app || true
sudo docker rm my_app || true
sudo docker rmi my_app_image || true

# Build the Java app (create the fat jar)
mvn clean package

# Build the Docker image
sudo docker build -t my_app_image .

# Run the container
sudo docker run -d --name my_app -p 8080:8080 my_app_image
