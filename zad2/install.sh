#!/bin/bash

error() {
  echo "$@" 1>&2
}

if [ $# -lt 1 ]; then
    error "Usage: $0 <domain name>"
    error "Usage: $0 <domain name> <cpu> <ram> <disk>"   
   exit 1
fi

RAM=1024
CPU=1
DISK=2

if [ $# -eq 4 ]; then
    CPU=$2
    RAM=$3
    DISK=$4
fi

if [ $DISK -lt 2 ]; then
    echo "2GB might not be enough it crashed for me"
fi


echo "Creating domain $1"
echo "cpus $CPU"
echo "ram $RAM"
echo "disk $DISK"
    
sleep 1




virt-install \
     --connect qemu:///system \
     --name $1 \
     --ram $RAM \
     --vcpus $CPU \
     --disk pool=default,size=$DISK,format=qcow2 \
     --location http://deb.debian.org/debian/dists/buster/main/installer-amd64/ \
     --os-type linux \
     --os-variant debian10 \
     --extra-args 'console=ttyS0' \
     --nographics
#     --network=bridge=br0,model=virtio \	     
#baudrate useless i "serial" depracated hmmm https://serverfault.com/a/400006
