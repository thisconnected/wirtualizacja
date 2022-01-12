#!/bin/bash

QEMU="virsh --connect qemu:///system"

error() {
  echo "$@" 1>&2
}

if [ $# -ne 1 ]; then
   error "Usage: $0 xmlfile"
   exit 1
fi

NET_NAME=`grep name $1 | awk -F "<|>" '{ print $3}'`

echo "creating network $NET_NAME"

$QEMU net-define $1
$QEMU net-autostart $NET_NAME
$QEMU net-start $NET_NAME
