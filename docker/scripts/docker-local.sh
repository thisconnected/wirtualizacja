#!/bin/bash

sudo hostnamectl set-hostname "docker"
# mount vdb

sudo mkdir /data
mount /dev/vdb /data
sudo mkdir /data/docker
sudo rm -rf /var/lib/docker
sudo ln -s /data/docker /var/lib/docker
UUID=`lsblk -f | awk '/vdb/ { print $3 }'`
echo "UUID=$UUID\t/data\text4\tdefaults\t0\t0"



# required packages
sudo apt-get update
sudo apt install -qy docker-io

# start & enable docker
sudo systemctl enable --now docker

# prepare
mkdir docker
mv Dockerfile docker/
cd docker

# build docker
docker build . -t lib86:latest

docker run lib86 -rm
