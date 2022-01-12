#!/bin/bash


QEMU="virsh --connect qemu:///system"

error() {
  echo "$@" 1>&2
}


remove_machine() {
    $QEMU destroy $1
    $QEMU undefine $1 --remove-all-storage
    
}
remove_network() {
    $QEMU net-destroy $1
    $QEMU net-undefine $1
}


#VMs
remove_machine dhcp


#networks
remove_network dhcpnetwork

