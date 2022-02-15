#!/bin/bash

error() {
  echo "$@" 1>&2
}

if [ $# -le 3 ]; then
   error "Usage: $0 <source domain> <size>"
   exit 1
fi


DOMAIN=$1
SIZE=$2


NAME=$3
if [ $# -e 3 ]; then
    NAME=newdisk
    if [ -f "$DEFAULT/$NAME" ]; then
	error "$NAME exists in $DEFAULT"
	exit 2
    fi
fi



DEFAULT=`virsh --connect qemu:///system pool-dumpxml default | awk -F "<|>" '/path/ { print $3}'`


cd default

sudo qemu-image create -f qcow2 $DEFAULT/$NAME $SIZE

virsh --connect qemu:///system attach-disk $NAME \
      --source $DEFAULT/$NAME \
      --target vdb \
      --persistent
      
