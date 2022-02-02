#!/bin/bash

sudo hostnamectl 

# required packages
sudo apt-get update
sudo apt install -qy docker-io

# prepare
mkdir docker
mv Dockerfile docker/
cd docker

# build docker
docker build .
