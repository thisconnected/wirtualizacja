#!/bin/bash

DEFAULT=`virsh --connect qemu:///system pool-dumpxml default | awk -F "<|>" '/path/ { print $3}'`



error() {
  echo "$@" 1>&2
}

if [ $# -ne 2 ]; then
   error "Usage: $0 <source domain> <cloned domain>"
   exit 1
fi

virsh --connect qemu:///system domstate $1
retval=$?

if [ $retval -ne 0 ]; then
    error "Error: domstate unavailable, source domain does not exist?"
    exit 2
fi

ORIGINAL=`virsh --connect qemu:///system dumpxml $1 | awk -F"[']" '/source file/{print $2}'`

echo "$ORIGINAL"

sudo qemu-img create -f qcow2 -F qcow2 -b $ORIGINAL $DEFAULT/$2.qcow2


virt-clone \
       --connect qemu:///system \
       --original $1 \
       --name $2 \
       --preserve-data \
       --file $DEFAULT/$2.qcow2

echo "changing original to read only"
sudo chmod -w $ORIGINAL



exit 0
