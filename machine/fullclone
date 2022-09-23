#!/bin/bash

DEFAULT=/data/vm/


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


virt-clone \
       --connect qemu:///system \
       --original $1 \
       --name $2 \
       --file $DEFAULT$2.qcow2

exit 0
