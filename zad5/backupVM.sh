#!/bin/bash

array=("$@")

if [ $# -lt 1 ]; then
    echo "No domains provided."
    virsh --connect qemu:///system list --all
    read -p "Backup all domains? [y/n] " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo "copying all domains"

	#echo "alldomains = $ALLDOMAINS"
	array=($(virsh --connect qemu:///system list --all| tail -n +2  | awk '{print $2}'))
	
    else
	exit 1
    fi
fi

#echo "actual stuff"

#echo "${array[2]}"

if [ ! -d ~/backups ]; then
    mkdir ~/backups
fi
if [ ! -d ~/backups/xml ]; then
    mkdir ~/backups/xml
fi

#hmm jak to dziala jezeli jest wiecej dyskow?
for element in "${array[@]}"
do
    VMDRIVE=`virsh --connect qemu:///system dumpxml $element | awk -F"[']" '/source file/{print $2}'`
    echo "Job: copying $element domain"
    # this is dumb
    sudo gzip -c $VMDRIVE | pv > ~/backups/$element.gz
    virsh --connect qemu:///system dumpxml $element > ~/backups/xml/$element.xml
done




