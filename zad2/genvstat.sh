#!/bin/bash

rm vstat.log


virsh --connect qemu:///system list --all >> vstat.log

array=($(virsh --connect qemu:///system list --all| tail -n +2  | awk '{print $2}'))

for element in "${array[@]}"
do
    virsh --connect qemu:///system dominfo $element >> vstat.log
    
