#!/bin/bash


# required packages
apt-get update
apt install -qy docker-io

mkdir docker
mv Dockerfile docker/
cd docker


docker build .
