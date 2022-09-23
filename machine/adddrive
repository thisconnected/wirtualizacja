#!/bin/bash

DEFAULT=`virsh --connect qemu:///system pool-dumpxml default | awk -F "<|>" '/path/ { print $3}'`

error() {
  echo "$@" 1>&2
}

if [ $# -lt 2 ]; then
   error "Usage: $0 <source domain> <size>"
   exit 1
fi


DOMAIN=$1
SIZE=$2


NAME=$3
if [ $# -lt 3 ]; then
    NAME=$DOMAIN-newdisk.qcow2
    if [ -f "$DEFAULT/$NAME" ]; then
	error "$NAME exists in $DEFAULT"
	exit 2
    fi
fi


sudo qemu-img create -f qcow2 $DEFAULT/$NAME $SIZE

virsh --connect qemu:///system attach-disk $DOMAIN \
      --source $DEFAULT/$NAME \
      --subdriver qcow2 \
      --target vdb \
      --persistent
      
