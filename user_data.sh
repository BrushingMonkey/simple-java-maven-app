#!/bin/bash
sudo apt-get update
sudo apt-get install -y docker.io
sudo systemctl enable docker
sudo systemctl start docker
sudo docker run -p 80:80 rebachi/githuub-actions:latest
